package com.wv.root.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject SqlSession sql;
	// 회원가입

	public void register(MemberDto dto) throws Exception {
		sql.insert("register", dto);
	}

	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		return sql.selectOne("login", dto);
	}
    
	//서비스에서 보낸 피라미턷르을 memberUpdate(MemberDto dto)에 담는다.
	@Override
	public void memberUpdate(MemberDto dto) throws Exception {
      		// vo에 담긴 피라미터들은 memberMapper.xml에 memberMapper라는 namespace에
		    // 아이디가 memberUpdate인 쿼리에 피라미터들을 넣어준다.
		sql.update("memberUpdate", dto);
	}

	@Override
	public void memberDelete(MemberDto dto) throws Exception {
             // MemberDto에 담긴 값들을 보내줍니다.
		     // xml에서 memberMapper.memberDelete에 보시면
		     // #{userId}, #{userPass}에 피라미터값이 매칭이 된다.
		     sql.delete("memberDelete", dto);
	}

	@Override
	public TeamDto teamInfo(int member_no) {
		TeamDto res = new TeamDto();
		try {
			List<TeamMemberDto> list = sql.selectList("wvteam.memberSteam", member_no);
			res.setTmlist(list);
		} catch (Exception e) {
			System.out.println("[teamInfo] 팀정보 불러오기 실패!");
			e.printStackTrace();
		}
		
		return res;
	}

	//탈퇴 비번체크
	@Override
	public int passChk(MemberDto dto) throws Exception {
        int result = sql.selectOne("passChk", dto);
		return result;
	}
  
	//아이디 중복체크
		@Override
		public int idChk(MemberDto dto) throws Exception {
			System.out.println(dto);
			int result = sql.selectOne("idChk", dto);
			return result;
		}

	@Override
	public List <String> findid(String member_email) {
		List <String> res = new ArrayList<String>();
		try {
			res = sql.selectList("findid", member_email);
		} catch (Exception e) {
			System.out.println("findid error");
			e.printStackTrace();
		}		
		return res;
	}

	@Override
	public String findpw(MemberDto dto) {
		String res = null;
		try {
			res = sql.selectOne("findpw", dto);
		} catch (Exception e) {
			System.out.println("findpw error");
			e.printStackTrace();
		}	
		return res;
	}

}


  

