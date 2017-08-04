package cn.fulong.util;

import cn.fulong.toolkit.util.Encrypt;

public class EncryptPwdUtil {
	//密码加密
	public String doEncryptPwd(String pwd){
		String newpwd = "";
		try {
			DesCrypt dc = new DesCrypt();
			newpwd = dc.encrypt(pwd);
			newpwd = dc.encrypt(newpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newpwd;
	}
	
	//解密显示
	public String doDecryptPwd(String pwd){
		String oldpwd = "";
		try {
			DesCrypt dc = new DesCrypt();
			oldpwd = dc.decrypt(pwd);
			oldpwd = dc.decrypt(oldpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return oldpwd;
	}
	
	public static void main(String[] stra){
		System.out.println(Encrypt.MD5("wjqy01"+"123456"));
		
		
	}
}
