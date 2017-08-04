package cn.fulong.util;

import java.util.Random;

public class RandomUtil {

	static char[] str1 = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	/**
	 * 生成验证码（数字）
	 */
	public static String authcodenum(int n) {
		// TODO Auto-generated method stub
		int i;
		int count = 0;
		StringBuffer authcode = new StringBuffer("");
		Random r = new Random();
		while (count < n) {
			i = Math.abs(r.nextInt(10));
			if (i >= 0 && i < str1.length) {
				authcode.append(str1[i]);
				count++;
			}
		}
		return authcode.toString();
	}
}
