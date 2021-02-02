package com.wv.root.model.biz;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.TeamDao;
import com.wv.root.model.dto.TeamDto;
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

	        //dao.insertUser(dto);
	        System.out.println("[Biz: invite()] - "+dto);
	        
	        String key = new TempKey().getKey(50,false);  // 인증키 생성

	        //dao.createAuthKey(dto.getMember_email(),key); //인증키 db 저장
	        
	        //메일 전송
	        MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("WV 팀초대 인증메일");
	        sendMail.setText(
	                new StringBuffer().append("<h1>WV 팀초대 이메일 인증</h1>").
	        append("<a href='http://localhost:8787/root/emailConfirm.do?member_email=").
			append(dto.getMember_email()).append("&code=").append(key).
			append("' target='_blank'>이메일 인증 확인</a>").toString());
	        sendMail.setFrom("sjeys14@gmail.com", "서비스센터 ");

	        //sendMail.setTo(dto.getMember_email());
	        sendMail.setTo("sjeys14@gmail.com");
	        sendMail.send();
	    }

	    //이메일 인증 키 검증
	    public TeamDto userAuth(TeamDto user) throws Exception {
	        TeamDto dto =new TeamDto();
	        System.out.println(user+"user");
	        //dto=dao.chkAuth(user);
	   
	        if(dto!=null){
	            try{
	                System.out.println(dto+"dto");
	            //    dao.userAuth(user);
	              //  dao.successAuth(dto);
	            }catch (Exception e) {
	                e.printStackTrace();
	            }}
	        return dto;
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
	
	   
	
	
	
	
	
	
	
	
	
	
	
}
