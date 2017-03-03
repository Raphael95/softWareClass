package com.javamail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.model.User;

public class SendMail extends Thread {
	
	private String from="raphaelleo@sohu.com";
	private String userName="raphaelleo";
	private String passWord="jianliang0729";
	private String host="smtp.sohu.com";
	
	private User user;
	public SendMail(User user){
		this.user=user;
	}
	
	public void run(){
		try{
			Properties prop=new Properties();
			prop.setProperty("mail.host", host);
			prop.setProperty("mail.transport.protocol", "smtp");
			prop.setProperty("mail.smtp.auth", "true");
			Session session = Session.getInstance(prop);
			session.setDebug(true);
			
			Transport ts=session.getTransport();
			ts.connect(host, userName, passWord);
			Message message = createEmail(session,user);
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	public Message createEmail(Session session,User user)throws Exception{
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
		message.setSubject("用户注册邮件");
		String info = "感谢您注册使用！";
		message.setContent(info, "text/html;charset=UTF-8");
		message.saveChanges();
		return message;
	}

}
