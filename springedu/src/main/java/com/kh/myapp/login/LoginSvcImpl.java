package com.kh.myapp.login;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.myapp.controller.LoginController;
import com.kh.myapp.member.dao.MemberDAO;
import com.kh.myapp.member.dto.MemberDTO;

@Service
public class LoginSvcImpl implements LoginSvc {

	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	LoginDAO loginDAO;
	
	@Qualifier("memberDAOImplXML") 
	MemberDAO mdao;
	
	//회원 유무체크
	@Override
	public boolean isMember(String id, String pw) {

		return loginDAO.isMember(id, pw);
	}

	//로그인
	@Override
	public MemberDTO login(String id, String pw) {
	
		return loginDAO.login(id, pw);
	}
	
	//아이디찾기
		@Override
		public MemberDTO findId(String tel, String birth) {
			logger.info("서비스.findId 호출됨!");
			MemberDTO memberDTO = null;
			memberDTO= mdao.findId(tel, birth);
			return memberDTO;
		}
		// 비번찾기
		@Override
		public MemberDTO findPw(String id, String tel, String birth) {
			MemberDTO memberDTO = null;
			memberDTO= mdao.findPw(id, tel, birth);
			return memberDTO;
		}

}
