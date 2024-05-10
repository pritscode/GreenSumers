package com.greensumers.carbonbudget.commons.emailtemplete;

import com.greensumers.carbonbudget.commons.utils.RandomStringGenerator;

public class VerificationEmailTemplete {
	
	private static final String registerEmailContentText = 
			"<!DOCTYPE html>\n" +
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
	
	public static String registerEmailContent() {
		return registerEmailContentText;
	}
	
}
