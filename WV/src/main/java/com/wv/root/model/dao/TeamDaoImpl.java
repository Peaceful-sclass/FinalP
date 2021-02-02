package com.wv.root.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Repository
public class TeamDaoImpl implements TeamDao {
	
	@Autowired
	private SqlSessionTemplate session;

	
    //회원 정보 입력
    public void insertUser(TeamDto vo) throws Exception {
        System.out.println("회원등록완료 !!!");
        session.insert(NameSpace+".insertUser",vo);
        System.out.println("//////////////////////////////////");
        System.out.println("회원등록완료 !!!");
    }
    //email 중복 확인
    public TeamDto authenticate(String str) throws Exception {
        return session.selectOne(NameSpace+".checkdupl", str);
    }
 
    @Override  //table에 초대정보 업데이트
    public void createCode(String member_email, String code) {
    	Map<String, String> map = new HashMap();
    	map.put("member_email", member_email);
    	map.put("code", code);
        try {
			session.insert(NameSpace + "createCode", map);
		} catch (Exception e) {
			System.out.println("[teamDao:careteCode] fail");
			e.printStackTrace();
		}
    }
    //이메일 인증 코드 확인
    public TeamDto chkAuth(TeamDto vo) throws Exception {
        return session.selectOne(NameSpace + ".chkAuth", vo);
    }
    //인증 후 계정 활성화
    public void userAuth(TeamDto vo) throws Exception {
        System.out.println("인증하나요??");
        
        session.update(NameSpace + ".userAuth", vo);
        System.out.println(vo.getUserState());
    }
	
    
    public int createTeam(TeamMemberDto dto) {
    	int res = 0; 
    	try {
    		System.out.println("[createTeam dto]: "+dto);
    		res = session.selectOne(NameSpace+"redundantvalidation", dto.getTeam_name());
    		if(res == 1) {//1이라면 중복팀이름
    			return res = 11;
    		}
			res = session.insert(NameSpace+"createTeam", dto );
			if(res == 1) {
				res = 22;
			}
		} catch (DataAccessException e) {
			System.out.println("[team create fail]");
			e.printStackTrace();
			throw e;
		}
		return res;
	}
    
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

	@Override
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
    
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
