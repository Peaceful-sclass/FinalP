package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.TeamDao;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Service
public class TeamBizImpl implements TeamBiz {

//	   @Inject
//	   private JavaMailSender mailSender;
	
	   @Autowired
	   private TeamDao dao;
	   

//	   public void regist(TeamDto dto) throws Exception {
//	        
//	        System.out.println("서비스레지스");
//
//	        String encPassword = passwordEncoder.encode(dto.getMemberPassword());
//	        dto.setMemberPassword(encPassword);
//	        //System.out.println("암호화된 비밀번호 : "+user.getUserPassword());
//
//	        dao.insertUser(dto);
//	        System.out.println(dto);
//	        System.out.println("///////////////////////  찍히");
//	        String key = new TempKey().getKey(50,false);  // 인증키 생성
//
//	        dao.createAuthKey(dto.getMemberEmail(),key); //인증키 db 저장
//	        //메일 전송
//	        MailHandler sendMail = new MailHandler(mailSender);
//	        sendMail.setSubject("FAINT  서비스 이메일 인증]");
//	        sendMail.setText(
//	                new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/user
//			/emailConfirm?userEmail=").
//			append(dto.getMemberEmail()).
//			append("&memberAuthKey=").append(key).
//			append("' target='_blank'>이메일 인증 확인</a>").toString());
//	        sendMail.setFrom("sososososo@gmail.com", "서어비스센터 ");
//
//
//	        sendMail.setTo(dto.getMemberEmail());
//	        sendMail.send();
//	    }
//
//	    //이메일 인증 키 검증
//	    public TeamDto userAuth(TeamDto user) throws Exception {
//	        TeamDto dto =new TeamDto();
//	        System.out.println(user+"user");
//	        dto=dao.chkAuth(user);
//	   
//	        if(dto!=null){
//	            try{
//	                System.out.println(dto+"dto");
//	                dao.userAuth(user);
//	                dao.successAuth(dto);
//	            }catch (Exception e) {
//	                e.printStackTrace();
//	            }}
//	        return dto;
//	    }

		public int createTeam(TeamMemberDto dto) {
			int res = dao.createTeam(dto);
			return res;
		}

		public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto) {
			return dao.getTeamInfo(dto);
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
