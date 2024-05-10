package com.test.my.commons.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.my.commons.emailtemplete.VerificationEmailTemplete;
import com.test.my.commons.service.MailService;
import com.test.my.commons.utils.RandomStringGenerator;
import com.test.my.commons.vo.MailVO;

@Controller
@EnableAsync
public class MailController {

	@Autowired
	private MailService mailService;
	
	@RequestMapping("/test")
	public String test() throws UnsupportedEncodingException {
		mailService.sendMail("hyy91234@gmail.com", "연습용 메일", VerificationEmailTemplete.registerEmailContent());
		return "/registView";
	}
	
	@RequestMapping("/testVerification")
	public String testVerification() throws UnsupportedEncodingException {
		mailService.sendVerificationMail("hyy91234@gmail.com", "연습용 인증 메일");
		return "/registView";
	}
	
	@RequestMapping("/sendVerificationMailDo")
	public String sendVerificationMailDo(MailVO mailVO, RedirectAttributes re) throws UnsupportedEncodingException {
		System.out.println(mailVO);
		List<String> arr = mailVO.getEmail();
		for(String email: arr) {
			mailService.sendMail(mailVO.getReciever(), "GreenSumers 이메일 확인", "새로운 계정 생성 프로세스를 시작해 주셔서 감사합니다. 사용자가 본인임을 확인하려고 합니다. 메시지가 표시되면 다음 확인 코드를 입력하세요."+RandomStringGenerator.generateVerificationString()+"계정을 생성하지 않는 경우에는 이 메시지를 무시해도 됩니다.");
		}
		re.addFlashAttribute("msg", "메일이 전송되었습니다.");
		return "redirect:/admin";
	}
}
