package cn.fulong.util;

public class JavaMailTest {
	
	public static void main(String[] stra){
		JavaMail smtp = new JavaMail();
		smtp.setM_to("438034247@qq.com");
		smtp.setM_body("您好，欢迎使用（融资平台），您的验证码为:6758,有效时间为10分钟，请在页面输入正确的验证码");
		smtp.sendEmail();
	}

}
