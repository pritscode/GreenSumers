package com.test.my.commons.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.test.my.commons.emailtemplete.VerificationEmailTemplete;
import com.test.my.commons.utils.RandomStringGenerator;

@Service
public class MailService {

	@Autowired
	private JavaMailSender mailSender;
	
	// 비동기 메서드 (메일을 보낼때 마다 시간이 다르기 때문에 비동기로 처리)
	@Async
	public void sendMail(String to, String title, String content) throws UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper;
		try {
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("gloria990109@gmail.com", "관리자");
			messageHelper.setSubject(title);
			messageHelper.setTo(to);
			messageHelper.setText(content);
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Async
	public void sendVerificationMail(String to, String title) throws UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper;
		
		String content = "<!DOCTYPE html>\n" +
				"<head>\n" +
				"    <meta charset=\"UTF-8\">\n" +
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
				"    <title>Demistifying Email Design</title>\n" +
				"</head>\n" +
				"<body style=\"margin: 0; padding: 0;\">\n" +
				"    <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;\">\n" +
				"        <tr>\n" +
				"            <td>\n" +
				"                <hr style=\"border-width: 4px; border-color: #7dd043; border-style: solid;\">\n" +
				"            </td>\n" +
				"        </tr>\n" +
				"        <tr>\n" +
				"            <td style=\"padding-top: 10px;\">\n" +
				"                <strong>Greensumers</strong>" +
				"            </td>\n" +
				"        </tr>\n" +
				"        <tr>\n" +
				"            <td>\n" +
				"                <h2><span style=\"color: lightgreen;\">이메일 인증</span> 안내입니다.</h2>\n" +
				"            </td>\n" +
				"        </tr>\n" +
				"        <tr>\n" +
				"            <td style=\"padding-top: 40px; padding-bottom: 40px;\">\n" +
				"                새로운 계정 생성 프로세스를 시작해 주셔서 감사합니다. 사용자가 본인임을 확인하려고 합니다. 메시지가 표시되면 아래의 확인 코드를 입력하세요. 계정을 생성하지 않는 경우에는 이 메시지를 무시해도 됩니다.\n" +
				"            </td>\n" +
				"        </tr>\n" +
				"        <tr>\n" +
				"            <td style=\"padding-bottom: 20px\">\n" +
				"                확인 코드:<br>\n" +
				"                <strong><span style=\"font-size: 1cm;\">" + RandomStringGenerator.generateVerificationString() + "</span></strong>\n" +
				"            </td>\n" +
				"        </tr>\n" +
				"        <tr>\n" +
				"            <td>\n" +
				"                <hr style=\"border-width: 4px; border-color: #7dd043; border-style: solid;\">\n" +
				"            </td>\n" +
				"        </tr>\n" +
				"    </table>\n" +
				"</body>\n" +
				"</html>";
		
		try {
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("gloria990109@gmail.com", "관리자");
			messageHelper.setSubject(title);
			messageHelper.setTo(to);
			messageHelper.setText(VerificationEmailTemplete.registerEmailContent(), true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
