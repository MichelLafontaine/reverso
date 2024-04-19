package com.michel.reverso.dao;

import com.michel.reverso.exceptions.DaoException;
import com.michel.reverso.utilitaires.LoggerReverso;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;

public class DaoConnection {
    private static Connection connection = null;
    private static final String MESSAGE_ERREUR = "Problème survenue dans la Base de Données";

    private DaoConnection() throws DaoException {
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("database.properties")) {
            if (input == null) {
                throw new DaoException(2, "Fichier de configuration de la base de données introuvable");
            }
            Class.forName("com.mysql.jdbc.Driver");
            Properties dataProperties = new Properties();
            dataProperties.load(input);
            connection = DriverManager.getConnection(
                    dataProperties.getProperty("url"),
                    dataProperties.getProperty("login"),
                    dataProperties.getProperty("password")
            );
        } catch (SQLException e) {
            LoggerReverso.LOGGER.log(Level.SEVERE, "Problème ouverture BDD SQLException: " + e.getMessage(), e);
            throw new DaoException(2, MESSAGE_ERREUR);
        } catch (IOException e) {
            LoggerReverso.LOGGER.log(Level.SEVERE, "Problème ouverture BDD IOException: " + e.getMessage(), e);
            throw new DaoException(2, MESSAGE_ERREUR);
        } catch (Exception e) {
            LoggerReverso.LOGGER.log(Level.SEVERE, "Problème ouverture BDD: " + e.getMessage(), e);
            throw new DaoException(2, MESSAGE_ERREUR);
        }
    }

    static {
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    LoggerReverso.LOGGER.log(Level.SEVERE, "Problème fermeture BDD, " + e.getMessage(), e);
                }
            }
        }));
    }

    public static Connection getInstance() throws DaoException {
        if (connection == null) {
            synchronized (DaoConnection.class) {
                if (connection == null) {
                    new DaoConnection();
                    LoggerReverso.LOGGER.log(Level.INFO, "Connexion BDD réussie");
                }
            }
        }
        return connection;
    }
}
