package model;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * this class is used for handling the encryption and decryption of user
 * password. Storing plaintext password in a database is not secure so, before
 * storing the password this class is called to encrypt it and when validating
 * passsword this class is called again to decrypt it. * 
 */

public class Encryption {

	// stating the algorithm type used for the encryption.
	private static final String ALGORITHM = "AES";
	
	// random key used for the encryption and decryption.
	private static final String KEY = "lr2&&T5Ys8Otnx0493674Wy!";

	// constructor is private so no object of this class is created.
	private Encryption() {
		super();
	}

	// method for encrypting plaintext passwords.
	public static String encrypt(String plainText) {

		String encryptedPassword = "";

		try {

			SecretKeySpec keySpec = new SecretKeySpec(KEY.getBytes(StandardCharsets.UTF_8), ALGORITHM);
			Cipher cipher = Cipher.getInstance(ALGORITHM);
			cipher.init(Cipher.ENCRYPT_MODE, keySpec);
			byte[] cipherText = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));
			encryptedPassword = Base64.getEncoder().encodeToString(cipherText);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return encryptedPassword;

	}
	
	
	// method for decrypting encrypted passwords.
	public static String decrypt(String cipherText) {
		String decryptedPassword = "";

		try {
			SecretKeySpec keySpec = new SecretKeySpec(KEY.getBytes(StandardCharsets.UTF_8), ALGORITHM);
			Cipher cipher = Cipher.getInstance(ALGORITHM);
			cipher.init(Cipher.DECRYPT_MODE, keySpec);
			byte[] decryptedData = cipher.doFinal(Base64.getDecoder().decode(cipherText));
			decryptedPassword = new String(decryptedData, StandardCharsets.UTF_8);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return decryptedPassword;
	}

}
