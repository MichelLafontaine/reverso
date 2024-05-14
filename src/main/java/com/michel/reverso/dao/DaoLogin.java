package com.michel.reverso.dao;

import com.michel.reverso.exceptions.DaoException;
import com.michel.reverso.exceptions.MetierException;
import com.michel.reverso.metiers.Login;
import com.michel.reverso.utilitaires.LoggerReverso;
import com.michel.reverso.utilitaires.PasswordUtils;

import java.sql.*;
import java.util.logging.Level;

import static com.michel.reverso.dao.DaoConnection.getInstance;

public class DaoLogin {
    private static final String MESSAGE_ERREUR ="problème lecture BDD";
    private static final String MESSAGE_FERMETURE = "problème connection base de donnée, le logiciel va fermer" ;

    public static Login findLogin(String email) throws DaoException, SQLException {
        String mdp = null;
        PreparedStatement pstmt = null;
        Connection connection = getInstance();
        Login login = new Login();

        String query = "SELECT NOM_LOGIN AS nom, PRENOM_LOGIN AS prenom, MOTDEPASSE_LOGIN AS mdp, MOTDEPASSE_SALT AS salt FROM login WHERE EMAIL_LOGIN LIKE ?;";

        try {
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                login = new Login(email, rs.getString("nom"), rs.getString("prenom"), rs.getString("mdp"), rs.getString("salt"));
            }
        } catch (SQLException e) {
            StringBuilder messageLog = new StringBuilder(MESSAGE_ERREUR);
            messageLog.append(e.getMessage()).append(" ").append(e);
            LoggerReverso.LOGGER.log(Level.SEVERE, messageLog.toString());
            throw new DaoException(2, MESSAGE_FERMETURE);
        } catch (MetierException e) {
            throw new DaoException(2, MESSAGE_FERMETURE);
        } finally {
            if (pstmt != null){
                pstmt.close();
            }
        }
        return login;
    }

    public static void createLogin (Login login) throws DaoException {
        Connection connection = getInstance();
        String salt = PasswordUtils.generateSalt(50);
        String mdpHash = PasswordUtils.hashPassword(login.getMdp(), salt);

        String queryInsertLogin = "INSERT INTO `login` (`ID_LOGIN`, `EMAIL_LOGIN`, `NOM_LOGIN`, " +
                "`PRENOM_LOGIN`, `MOTDEPASSE_LOGIN`, `MOTDEPASSE_SALT`) " +
                "VALUES (NULL, ?, ?, ?, ?, ?);";

        try(PreparedStatement pstmtCreateLogin = connection.prepareStatement(queryInsertLogin)){
            pstmtCreateLogin.setString(1, login.getLoginEmail());
            pstmtCreateLogin.setString(2, login.getNom());
            pstmtCreateLogin.setString(3, login.getPrenom());
            pstmtCreateLogin.setString(4, mdpHash);
            pstmtCreateLogin.setString(5, salt);

            pstmtCreateLogin.executeUpdate();

        } catch (SQLIntegrityConstraintViolationException sqlIntegrity){
            if (sqlIntegrity.getErrorCode() == 1062){
                throw new DaoException(1, "Attention cette adresse email existe déjà");
            }
            if (sqlIntegrity.getErrorCode() == 1406) {
                throw new DaoException(1, "Un paramètre n'est pas bon");
            }
        } catch (SQLException e) {
            StringBuilder messageLog = new StringBuilder(MESSAGE_ERREUR);
            messageLog.append(e.getMessage()).append(" ").append(e);
            LoggerReverso.LOGGER.log(Level.SEVERE, messageLog.toString());
            throw new DaoException(2, MESSAGE_FERMETURE);
        }
    }
}
