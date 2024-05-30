package com.greensumers.carbonbudget.commons.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greensumers.carbonbudget.commons.service.MailService;
import com.greensumers.carbonbudget.member.vo.MemberVO;

@Controller
@EnableAsync
public class MailController {
	
	@Autowired
	private MailService mailService;
	
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

	/**
	 * @Author : Pangsu
	 * @Date   : 2024. 5. 13.
	 * @Method : verifyCode
	 * @return : String
	 * Purpose : 메일 인증코드 체크 
	 * Description : redis (remote dictionary server key-value 구조의 비정형 데이터 저장관리 도구)에 저장된 값 체크
	*/
	@RequestMapping(value = "/verify", method = RequestMethod.POST)
    public @ResponseBody String verifyCode(@RequestParam String email, @RequestParam String code) {
        boolean isVerified = mailService.verifyEmail(email, code);
        return isVerified ? "Y" : "N";
    }
	
	@RequestMapping(value = "/sendTemporaryPasswordMailDo")
	public ResponseEntity<String> temporaryPasswordMailTest(MemberVO vo, HttpSession session) {
		MemberVO memberFindingPw = (MemberVO) session.getAttribute("memberFindingPw");
		vo.setMemEmail(memberFindingPw.getMemEmail());
		System.out.println(vo);
		try {
			mailService.sendTemporaryPasswordMail(vo.getMemEmail());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		session.invalidate();
		return ResponseEntity.ok("Success");
	}
}
