package com.isaac.bcu.homework.member;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtil {

	public String encryptPsswd(String psswd) throws NoSuchAlgorithmException {

		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(psswd.getBytes());

		return byteToHexString(md.digest());
	}

	public String byteToHexString(byte[] data) {

		StringBuilder sb = new StringBuilder();

		for ( byte b : data ) {
			sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
		}

		return sb.toString();
	}
}
