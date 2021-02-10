package com.wv.root.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.Email;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Repository
public class TeamDaoImpl implements TeamDao {
	
	@Autowired
	private SqlSessionTemplate session;

	
 
    @Override  //table에 초대정보 업데이트
    public void createCode(Email edto, String code) {
    	Map<String, Object> map = new HashMap<String,Object>();
    	map.put("email", edto);
    	map.put("code", code);
        try {
			session.insert(NameSpace + "createCode", map);
		} catch (Exception e) {
			System.out.println("[teamDao:careteCode] fail");
			e.printStackTrace();
		}
    }
	
    @Override
    public int createTeam(TeamMemberDto dto) {
    	int res = 0; 
    	try {
    		System.out.println("[createTeam dto]: "+dto);
    		res = session.selectOne(NameSpace+"redundantvalidation", dto.getTeam_name());
    		if(res == 1) {//1이라면 중복팀이름
    			return res = 11;
    		}else {
    			res = 22; //아니라면 22 신호를 넣고 insert 진행
    		}
    		session.insert(NameSpace+"createTeam", dto );
		} catch (DataAccessException e) {
			System.out.println("[team create fail]");
			e.printStackTrace();
			throw e;
		}
		return res;
	}
    
    @Override //멤버의 팀리스트
	public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto) {
		List<TeamMemberDto> tmlist = null;
		try {
			tmlist = session.selectList(NameSpace+"memberSteam", dto );
		} catch (Exception e) {
			System.out.println("[getTeamInfo] 읽기 실패!");
			e.printStackTrace();
		}
		return tmlist;
	}

	@Override //팀의 멤버리스트
	public List<TeamMemberDto> getTeamMember(TeamMemberDto dto) {
		List<TeamMemberDto> tmdto = null;
		try {
			tmdto = session.selectList(NameSpace+"teamMember", dto);
		} catch (Exception e) {
			System.out.println("[getTeamMember] 읽기 실패!");
			e.printStackTrace();
		}
		
		return tmdto;
	}
	@Override //팀초대장목록에 id가 있는지부터 확인
	public int chkISidinTeam(Email edto) {
		int res = 0;
		try {
			res = session.selectOne(NameSpace+"chkISmemberInTeam", edto);
			if(res>0) { //이미 팀이면
				System.out.println("[DAO:chkISidinTeam] 이미 팀멤버입니다.");
				return res;
			}
			res = session.selectOne(NameSpace+"chkISidinTeam", edto);
		} catch (Exception e) {
			System.out.println("[DAO:chkISidinTeam] fail load");
			e.printStackTrace();
		}
		
		return res;
	}
	@Override //팀장체크
	public int chkteamLD(Email edto) { //team_no,member_id
		int res = 0;
		try {
			res = session.selectOne(NameSpace+"chkteamLD",edto);
			
			int manager = session.selectOne(NameSpace+"chkteamLD2",edto);
			if(manager==1) {
				return res = 2; //매니저라면 2번 신호로 바꿔서 진행.
			}
			 
		} catch (Exception e) {
			System.out.println("[DAO:chkteamLD] fail load");
			e.printStackTrace();
		}
		return res;
	}
	@Override //invite메소드시 초대할 멤버의 메일정보전달
	public String getIvEmail(Email dto) {
		String email = "";
		try {
			email = session.selectOne(NameSpace+"ivEmailone", dto.getMember_id());
			System.out.println("[DAO:getIvEmail:email] "+email);
		} catch (Exception e) {
			System.out.println("[DAO:getIvEmail] fail load");
			e.printStackTrace();
		}
		return email;
	}

	@Override	//팀초대 email검증
	public int emailConfirm(Email edto) {
		int res = 0;
		try {
			res = session.selectOne(NameSpace+"emailConfirm", edto);
			if(res>0) {
				res = session.update(NameSpace+"teamMemberConfirm", edto);
			}
		} catch (Exception e) {
			System.out.println("[DAO:emailConfirm] fail load");
			e.printStackTrace();
		}
		return res;
	}

	
	//팀 권한 변경
	@Override
	public int teamManageConfirm(List list) {
		int res = 0;
		List<TeamMemberDto> dtoG = (List<TeamMemberDto>)list.get(0);
		List<TeamMemberDto> dtoD = (List<TeamMemberDto>)list.get(1);
		try { 
			res = session.update(NameSpace+"teamManageConfirm1", dtoG);
			if(dtoD.isEmpty()) {
				return res;
			}
			res = session.delete(NameSpace+"teamManageConfirm2", dtoD);
		} catch (Exception e) {
			System.out.println("[dao: teamManageConfirm] fail..");
			e.printStackTrace();
		}
		
		return res;
	}

	//팀탈퇴
	@Override
	public Boolean teamWithdraw(TeamMemberDto dto) {
		int res =0;
		try {
			Email edto = new Email();
			edto.setMember_id(dto.getMember_id());
			edto.setTeam_no(dto.getTeam_no());
			
			int tmp = session.selectOne(NameSpace+"chkteamLD", edto);
			if(tmp == 1) { //팀장인 경우
				System.out.println("[DAO:teamWithdraw 팀장이네] "+dto);
				res = session.delete(NameSpace+"teamWithdraw1", dto);
			} else {
				res = session.delete(NameSpace+"teamWithdraw2", dto);
			}
			
		} catch (Exception e) {
			System.out.println("[DAO:teamWithdraw res]: fail... "+res);
			e.printStackTrace();
		}
		
		
		System.out.println("[DAO:teamWithdraw res]: "+res);
		return (res>0)? true:false;
	}
    
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
