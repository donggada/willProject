package member.vo;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;



	 
	 
	public class SMTPAuthenticatior extends Authenticator{
	 

		@Override
	    protected PasswordAuthentication getPasswordAuthentication() {
	        return new PasswordAuthentication("koem0425@naver.com","dongga0421!!");
	    }
	}


