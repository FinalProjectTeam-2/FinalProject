package com.finalproject.festival.controller;


import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.domain.Member;
import com.finalproject.festival.service.MailService;
import com.finalproject.festival.service.MemberService;



@Controller
public class ProjectController {
	
	
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailService mailService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@RequestMapping("/main")//메인페이지로 이동
	public String main () {
		return "main";
	}
	
	@RequestMapping("/login")//로그인 페이지로 이동
	public String loginFrom (){
		return "login";
	}

	
	@RequestMapping("/memberJoinPage")//가입 정보동의약관
	public String memberJoinPage(){
		return"memberJoinConfirm";
	}
	
	@RequestMapping("/memberJoinForm")//회원가입페이지
	public String memberJoinForm(){
		return"memberJoinForm";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "main";
	}
	
	//로그인 
	@ResponseBody
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST, consumes = "application/json")
	public int loginCheck(HttpSession session, @RequestBody Map<String, String> param)
				throws ServletException, IOException{
		
		String id = (String)param.get("id");
		String password = (String)param.get("password");
		
		
		
		boolean result = memberService.loginCheck(id, password);
		
		try {
			if(result) {
				session.setAttribute("id", id);
				return 1;
			}
			else {
				return 0;
			}
			
		 } catch (Exception e) {
				return -1;
		 }
		
		};
	
	// 아이디 중복확인 
	@ResponseBody
	@RequestMapping(value = "/joinIdCheck", method = RequestMethod.POST)
	public int joinIdCheck(String id) {
	    
	    System.out.println("controller-id- "+ id);
   
	    int idCheck = memberService.joinIdCheck(id);
	    
	    System.out.println("idCheck"+idCheck);
	    return idCheck;
	};

	//이메일 인증
		@ResponseBody
		@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
		}
		
		
	//회원가입 
	@ResponseBody
	@RequestMapping("/memberJoin")
	public String memberJoin(@RequestParam("joinName")String name,@RequestParam("joinId")String id,@RequestParam("phoneNumber")String phonenumber,
							 @RequestParam("joinPasswordCheck")String password,@RequestParam("zipcode")String zipcode,
							 @RequestParam("address1")String address1,@RequestParam("address2")String address2,
							 @RequestParam("eMailId")String eMailId,@RequestParam("eMailDomain")String eMailDomain){
		
					String email = eMailId +"@"+eMailDomain;
					String passEncode = passwordEncoder.encode(password);
					
						Member member =new Member();
						member.setName(name);
						member.setId(id);
						member.setPassword(passEncode);
						member.setZipcode(zipcode);
						member.setAddress1(address1);
						member.setAddress2(address2);
						member.setEmail(email);
						
						memberService.joinMember(member);
		
		
		return "";
	}

	
	
	
}
