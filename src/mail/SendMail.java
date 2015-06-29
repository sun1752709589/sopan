package mail;

public class SendMail {

	public static void main(String[] args) {

		MailSenderInfo mailInfo = new MailSenderInfo();
	    mailInfo.setMailServerHost("smtp.163.com");
	    mailInfo.setMailServerPort("25");
	    mailInfo.setValidate(true);
	    mailInfo.setUserName("email4sun@163.com");
	    mailInfo.setPassword("sun088530");
	    mailInfo.setFromAddress("email4sun@163.com");
	    mailInfo.setToAddress("1752709589@qq.com");

	    mailInfo.setSubject("hello");
	    mailInfo.setContent("<a href='www.easysoso.cn'>easysoso</a>");

	    SimpleMailSender sms = new SimpleMailSender();
	    sms.sendTextMail(mailInfo);
		
	}

}
