package com.test.my.member.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.my.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;
	
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}

	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest req, Model model) {
		String reqURL = req.getHeader("Referer");
		model.addAttribute("fromURL", reqURL);
		
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("구글:" + url);

		model.addAttribute("google_url", url);

		/* 생성한 인증 URL을 View로 전달 */
		return "member/loginView";
	}
	
	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2GoogleCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");

		return "member/mypageView";
	}
	
	@RequestMapping("/mypageView")
	public String mypageView() {
		return "member/mypageView";
	}
	
}
