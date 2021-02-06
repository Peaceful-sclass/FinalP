package com.wv.root.model.biz;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.TeamDao;
import com.wv.root.model.dto.TeamDto.Email;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;
import com.wv.root.model.util.MailHandler;
import com.wv.root.model.util.TempKey;

@Service
public class TeamBizImpl implements TeamBiz {

	@Inject
	private JavaMailSender mailSender;

	@Autowired
	private TeamDao dao;


	public void invite(Email dto) throws MessagingException, UnsupportedEncodingException {
		//String encPassword = passwordEncoder.encode(dto.getMemberPassword());
		//dto.setMemberPassword(encPassword);
		//System.out.println("암호화된 비밀번호 : "+user.getUserPassword());

		System.out.println("[Biz: invite()] - "+dto);//member_id,team_no

		String key = new TempKey().getKey(50,false);  // 인증키 생성

		dao.createCode(dto,key); //인증키 db 저장 /member_id,team_no,code

		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("WV 팀초대 인증메일");
		sendMail.setText(
		new StringBuffer().append("<h1>").append(dto.getMember_id()).append("님에 대한 WV 팀초대 이메일 인증</h1>").
		append("<a href='http://localhost:8787/root/emailConfirm.do?member_id=").
		append(dto.getMember_id()).append("&code=").append(key).append("&team_no=").append(dto.getTeam_no()).
		append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("sjeys14@gmail.com", "WV-SERVICE ");

		sendMail.setTo(dao.getIvEmail(dto)); //초대할ID의 email조회
		//sendMail.setTo("sjeys14@gmail.com");
		sendMail.send();
	}

	@Override
	public int createTeam(TeamMemberDto dto) {
		int res = dao.createTeam(dto);
		return res;
	}

	@Override
	public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto) {
		return dao.getTeamInfo(dto);
	}

	@Override
	public List<TeamMemberDto> getTeamMember(TeamMemberDto dto) {
		return dao.getTeamMember(dto);
	}

	@Override
	public int chkISidinTeam(Email edto) {
		return dao.chkISidinTeam(edto);
	}

	@Override
	public int chkteamLD(Email edto) {
		return dao.chkteamLD(edto);
	}

	@Override
	public int emailConfirm(Email edto) {
		return dao.emailConfirm(edto);
	}

	@Override
	public int teamManageConfirm(List list) {
		
		return dao.teamManageConfirm(list);
	}













}
