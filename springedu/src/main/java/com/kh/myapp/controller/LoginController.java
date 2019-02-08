package com.kh.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.myapp.bbs.dto.BbsDTO;
import com.kh.myapp.login.LoginCmd;
import com.kh.myapp.login.LoginSvc;
import com.kh.myapp.member.dto.MemberDTO;
import com.kh.myapp.member.service.MemberSvc;
import com.kh.myapp.util.RecordCriteria;

import javafx.scene.control.Alert;

@Controller
@RequestMapping("/login")
public class LoginController {

	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
			
	@Inject
	LoginSvc loginSvc;
	
	@Inject
	private MemberSvc memberSvc;
	
	@RequestMapping("/loginForm")
	public void loginForm(Model model) {
		model.addAttribute("login", new LoginCmd());
	}
	
	//로그인
	@RequestMapping(value="/loginOk")//,method=RequestMethod.POST)
	public String login(@Valid @ModelAttribute("login") LoginCmd login, BindingResult result,HttpSession session) {

		logger.info("String login 호출됨!");
				
		MemberDTO mdto = null;

		if(result.hasErrors()) {
			logger.info(result.toString());			
			return "/login/loginForm";
		}
		
		//1)회원 유무체크
		if (loginSvc.isMember(login.getId(), login.getPw())) {
		//2)로그인 처리
			mdto = loginSvc.login(login.getId(), login.getPw());
			session.setAttribute("user", mdto);
			logger.info("로그인 처리됨:" + login.getId());
		}else {
			
			return "forward:/login/loginForm";
		}
		return "redirect:/";
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login/loginForm";
	}
	
	//아이디찾기-폼
			@RequestMapping("/findidform")
			public String findidform(Model model) {
				
				model.addAttribute("mdto", new MemberDTO());
				return "/login/findid";
			}
			
		
			//아이디 찾기 처리
			@RequestMapping(value="/findid", method=RequestMethod.POST)
			public String findid(
					@Valid @ModelAttribute("mdto") LoginCmd login,String birth,String tel,BindingResult result, Model model) {
				logger.info("/login/findid 호출됨!");
				
				
				if(result.hasErrors()) {
					
					logger.info(result.toString());
					logger.info("아이디찾기 오류발생!!");
					
					return "/login/findidform";
				}
				MemberDTO mdto = memberSvc.findId(login.getTel(),login.getBirth());
				model.addAttribute("mdto", mdto);
				return "/login/id";
			}
	
			//비밀번호찾기-폼
			@RequestMapping("/findpwform")
			public String findpwform(Model model) {
				
				model.addAttribute("mdto", new MemberDTO());
				return "/login/findpw";
			}
			
		
			//비밀번호 찾기 처리
			@RequestMapping(value="/findpw", method=RequestMethod.POST)
			public String findpw(
					@Valid @ModelAttribute("mdto") LoginCmd login,String id,String birth,String tel,BindingResult result, Model model) {
				logger.info("/login/findid 호출됨!");
				
				
				if(result.hasErrors()) {
					
					logger.info(result.toString());
					logger.info("pw찾기 오류발생!!");
					
					return "/login/findpwform";
				}
				MemberDTO mdto = memberSvc.findPw(login.getId(),login.getTel(),login.getBirth());
				model.addAttribute("mdto", mdto);
				return "/login/pw";
			}
	
	
}
