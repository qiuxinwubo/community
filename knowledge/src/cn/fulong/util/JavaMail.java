package cn.fulong.util;



import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
/**
 * @author lzc
 */
public class JavaMail {
	static char[] str1 = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
	private String m_user = "";// 用于需要验证的用户名
	private String m_pass = ""; // 口令
	private String m_server = ""; // SMTP服务器名称
	private int m_port = 25; // 端口号,缺省为25
	private String m_from = ""; // 发件人
	private String m_to = ""; // 收件人
	private String m_subject = null; // 主题
	private String m_body = null; // 内容体
	private String m_body_type = "text/plain";// 内容类型
	
	public void setM_user(String m_user) {
		this.m_user = m_user;
	}

	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}

	public void setM_server(String m_server) {
		this.m_server = m_server;
	}

	public void setM_port(int m_port) {
		this.m_port = m_port;
	}

	public void setM_from(String m_from) {
		this.m_from = m_from;
	}

	public void setM_to(String m_to) {
		this.m_to = m_to;
	}

	public void setM_subject(String m_subject) {
		this.m_subject = m_subject;
	}

	public void setM_body(String m_body) {
		this.m_body = m_body;
	}

	public void setM_body_type(String m_body_type) {
		this.m_body_type = m_body_type;
	}

	/**
	 * 发送邮件
	 */
	public void sendEmail(){
		 this.setM_from(this.getValue("email"));
		 this.setM_server(this.getValue("email-server"));
		 this.setM_user(this.getValue("email"));
		 this.setM_pass(this.getValue("email-pwd"));
		 this.setM_from(this.getValue("email"));
		 // 设置邮件标题
		 this.setM_subject("（视频互联互通系统）");
		
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp"); // smtp协议
		props.put("mail.smtp.host", m_server); // 服务器地址
		props.put("mail.smtp.port", m_port); // 端口号
		props.put("mail.smtp.auth", "true");// 现在的大部分smpt都需要验证了
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		Session s = Session.getInstance(props);// 为了查看运行时的信息
		s.setDebug(true);
		MimeMessage message = new MimeMessage(s);// 由邮件会话新建一个消息对象
		
		try {
			InternetAddress from = new InternetAddress(m_from);// 发件人
			message.setFrom(from);
			//设置自定义发件人昵称
			String nick="";
			try {  
				nick=javax.mail.internet.MimeUtility.encodeText("视频互联互通系统"); 
				message.setFrom(new InternetAddress(nick+" <"+m_from+">"));
		    } catch (UnsupportedEncodingException e) {  
		       e.printStackTrace();  
		    }
		   
			InternetAddress to = new InternetAddress(m_to);// 收件人
			message.setRecipient(Message.RecipientType.TO, to);
			
			// 邮件标题
			if(m_subject!=null){
				message.setSubject(m_subject);
			}
 			message.setContent(m_body, "text/html;charset=utf-8");
			message.saveChanges();
			Transport transport = s.getTransport("smtp");
			// smtp验证，就是你用来发邮件的邮箱用户名密码
			transport.connect(m_server, m_user, m_pass);
			// 发送
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 生成验证码（数字）
	 */
	public static String authcodenum(int n) {
		// TODO Auto-generated method stub
		int i;
		int count = 0;
		StringBuffer authcode = new StringBuffer("");
		Random r = new Random();
		while(count < n){
			i = Math.abs(r.nextInt(10));
			if(i >= 0&& i < str1.length){
				authcode.append(str1[i]);
				count ++;
			}
		}
		return authcode.toString();
	}
	/**
	 * 读取xml 得到email pwd server
	 * 
	 * @param code
	 * @return
	 */
	public static String getValue(String code) {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		Document dom;
		try {
			DocumentBuilder builder = dbf.newDocumentBuilder();
			// 读取xml文件位置
			InputStream inputStream = Thread.currentThread()
					.getContextClassLoader().getResourceAsStream(
							"SystemConfig.xml");
			dom = builder.parse(inputStream);
			NodeList nodeList = dom.getElementsByTagName("mail");
			Element node = (Element) nodeList.item(0);
			if (node.getElementsByTagName(code).item(0) == null)
				return null;
			if (node.getElementsByTagName(code).item(0).getFirstChild() == null)
				return null;
			else
				return node.getElementsByTagName(code).item(0).getFirstChild()
						.getNodeValue();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	@RequestMapping(value = "/sendTwoEmail")
	public  void sendTwoEmail(String email,String content){
		JavaMail smtp = new JavaMail();
		smtp.setM_to(email);
		smtp.setM_body(content);
		smtp.sendEmail();
	}
	
	/*public static void main(String[] stra){
		JavaMail smtp = new JavaMail();
//		smtp.setM_from(smtp.getValue("email"));
		smtp.setM_to("351402663@qq.com");
//		smtp.setM_server(smtp.getValue("email-server"));
//		smtp.setM_user(smtp.getValue("email"));
//		smtp.setM_pass(smtp.getValue("email-pwd"));
//		smtp.setM_from(smtp.getValue("email"));
		// 设置邮件标题
		smtp.setM_body("您好，欢迎使用（企业融资平台），您的验证码为:6758,有效时间为10分钟，请在页面输入正确的验证码");
		smtp.sendEmail();
	}*/
}
