package cn.fulong.util;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {      
	 public static String md5s(String plainText) {
		 String str = new String();
		 try {   
			 MessageDigest md = MessageDigest.getInstance("MD5");   
			 md.update(plainText.getBytes());   
			 byte b[] = md.digest();   
	  
			 int i;   
	  
			 StringBuffer buf = new StringBuffer("");   
			 for (int offset = 0; offset < b.length; offset++) {   
				 i = b[offset];   
				 if (i < 0)   
					 i += 256;   
				 if (i < 16)   
					 buf.append("0");   
				 buf.append(Integer.toHexString(i));   
			 }   
			 str = buf.toString();   
//			 System.out.println("result: " + buf.toString());   
		 }catch (NoSuchAlgorithmException e) {   
			 e.printStackTrace();   
		 }  
		 return str;
	 }


	
	 public static void main(String agrs[]) {   
		  MD5 md51 = new MD5();   
		  String s1="qwert@123";   
		  System.out.println(md5s(s1));
//		  System.out.println(md51.md5s(md51.md5s(s1)+"34c4cd"));   
//		  String s =md51.md5s(md51.md5s(s1));
//		  System.out.println(s);
		 } 
}
