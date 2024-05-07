package com.test.my.commons.utils;

import java.util.Random;
import java.util.UUID;

public class RandomStringGenerator {
    public static String generateRandomString() {
        return UUID.randomUUID().toString();
    }
    
    
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final Random random = new Random();
    
    public static String generateVerificationString() {
    	StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            sb.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
        }
        System.out.println(sb);
        return sb.toString();
    }
}

