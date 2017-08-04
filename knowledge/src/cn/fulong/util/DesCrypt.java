package cn.fulong.util;
import java.security.Key;
import java.security.Security;

import javax.crypto.Cipher;

public class DesCrypt {
	private static String strDefaultKey = "national";

	private Cipher encryptCipher = null;

	private Cipher decryptCipher = null;

	
	public static String byteArr2HexStr(byte[] arrB) throws Exception {
		int iLen = arrB.length;
		StringBuffer sb = new StringBuffer(iLen * 2);
		for (int i = 0; i < iLen; i++) {
			int intTmp = arrB[i];
			while (intTmp < 0) {
				intTmp = intTmp + 256;
			}
			if (intTmp < 16) {
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp, 16));
		}
		return sb.toString();
	}

	
	public static byte[] hexStr2ByteArr(String strIn) throws Exception {
		byte[] arrB = strIn.getBytes();
		int iLen = arrB.length;

		byte[] arrOut = new byte[iLen / 2];
		for (int i = 0; i < iLen; i = i + 2) {
			String strTmp = new String(arrB, i, 2);
			arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
		}
		return arrOut;
	}

	public DesCrypt() throws Exception {
		this(strDefaultKey);
	}

	public DesCrypt(String strKey) throws Exception {
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		Key key = getKey(strKey.getBytes());

		encryptCipher = Cipher.getInstance("DES");
		encryptCipher.init(Cipher.ENCRYPT_MODE, key);

		decryptCipher = Cipher.getInstance("DES");
		decryptCipher.init(Cipher.DECRYPT_MODE, key);
	}

	
	public byte[] encrypt(byte[] arrB) throws Exception {
		return encryptCipher.doFinal(arrB);
	}

	
	public String encrypt(String strIn) throws Exception {
		return byteArr2HexStr(encrypt(strIn.getBytes()));
	}

	
	public byte[] decrypt(byte[] arrB) throws Exception {
		return decryptCipher.doFinal(arrB);
	}

	
	public String decrypt(String strIn) throws Exception {
		return new String(decrypt(hexStr2ByteArr(strIn)));
	}

	
	private Key getKey(byte[] arrBTmp) throws Exception {
		byte[] arrB = new byte[8];

		for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
			arrB[i] = arrBTmp[i];
		}

		Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");

		return key;
	}
	
	public static void main(String[] args) throws Exception{
		/*
		 * 以下为加密代码用法
		 * 	运行结果为：
		 *  		字符串:我是中国人
		 *			加密后的字符串：42f94441869211949c9ed0441f5a52e4
		 */
		DesCrypt des = new DesCrypt();
		String str = "1";
		System.out.println("字符串:"+str);
		String enc= des.encrypt(str);
		System.out.println("加密后的字符串："+enc);
		
		/*
		 * 一下为解密代码用法
		 * 运行结果为：
		 * 			密文:25b7f5afee0d962a
		 *			解密后的字符串：123456
		 */
		DesCrypt desc = new DesCrypt();
		String dec = "6fe30e9f432231aa0dd4cefbe581f6c8";
		String strTemp= desc.decrypt(dec);
		System.out.println("解密后的字符串："+strTemp);
	}
}
