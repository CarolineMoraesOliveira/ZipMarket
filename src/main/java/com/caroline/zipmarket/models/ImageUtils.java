package com.caroline.zipmarket.models;

import java.util.Base64;

public class ImageUtils {
//	 public static String encodeBase64(byte[] imageBytes) {
//	        return Base64.getEncoder().encodeToString(imageBytes);
//	    }
	 
	 public static String encodeBase64(byte[] imageBytes) {
	        String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
	        System.out.println("Encoded Image: " + encodedImage);
	        return encodedImage;
	    }
}
