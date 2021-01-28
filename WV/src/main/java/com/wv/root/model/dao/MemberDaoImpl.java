package com.wv.root.model.dao;

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
}


  

