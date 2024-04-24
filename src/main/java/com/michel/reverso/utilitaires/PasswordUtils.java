package com.michel.reverso.utilitaires;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

import java.security.SecureRandom;

public class PasswordUtils {
    // Création d'une instance Argon2 pour être utilisée dans le hachage des mots de passe
    private static final Argon2 argon2 = Argon2Factory.create();

    /**
     * Générer un sel cryptographiquement sécurisé
     */
    public static String generateSalt(final int length) {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[length];
        random.nextBytes(salt);
        return bytesToHex(salt);
    }

    /**
     * Hacher un mot de passe avec Argon2
     */
    public static String hashPassword(String password, String salt) {
        return argon2.hash(2, 65536, 1, (salt + password).toCharArray());
    }

    /**
     * Vérifier un mot de passe avec un hash stocké
     */
    public static boolean verifyPassword(String password, String hash, String salt) {
        return argon2.verify(hash, (salt + password).toCharArray());
    }

    /**
     * Convertir un tableau de bytes en une chaîne hexadécimale
     */
    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte aByte : bytes) {
            sb.append(String.format("%02x", aByte));
        }
        return sb.toString();
    }
}

