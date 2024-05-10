package com.greensumers.carbonbudget.commons.web;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.greensumers.carbonbudget.commons.service.MailService;
import com.greensumers.carbonbudget.commons.utils.RandomStringGenerator;

@Controller
@EnableAsync
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping("/test")
	public String test(RedirectAttributes re) throws UnsupportedEncodingException{
		mailService.sendMail("pritscode@naver.com", "연습용 메일", RandomStringGenerator.generateVerificationString());
		re.addFlashAttribute("msg", "성공적으로 메일이 전송되었습니다.");
		return "redirect:/";
	}
	
	@RequestMapping("/testVerification")
	public String testVerification(RedirectAttributes re) throws UnsupportedEncodingException {
		mailService.sendVerificationMail("pritscode@naver.com");
		re.addFlashAttribute("msg", "성공적으로 메일이 전송되었습니다.");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/sendVerifMailDo", method = { RequestMethod.POST })	
	public ResponseEntity<String> test(@RequestParam("memEmail") String memEmail) {
	    System.out.println(memEmail);
	    // 여기서 적절한 응답을 생성하고 반환합니다.
	    try {
			mailService.sendVerificationMail(memEmail);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    return ResponseEntity.ok("Success"); // 예시로 "Success" 문자열 반환
	}
	
	//@RequestMapping(value = "/VerificationDo", method = {RequestMethod.POST})
	//public ResponseEntity<String>(){
	//	System.out.println();
	//	try {
	//		mailService.CheckingCode();
	//	} catch (UnsupportedEncodingException e) {
	//		e.printStackTrace();
	//	}
	//	return ResponseEntity.ok("Success");
	//}
}
