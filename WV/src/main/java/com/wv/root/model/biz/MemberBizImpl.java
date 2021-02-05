package com.wv.root.model.biz;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wv.root.model.dao.MemberDao;
import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;

@Service
public class MemberBizImpl implements MemberBiz{
    
	@Inject
	MemberDao dao;

	@Override
	public void register(MemberDto dto) throws Exception {
		dao.register(dto);
	}

	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void memberUpdate(MemberDto dto) throws Exception {
        
		//받은 DTO를 DAO로 보내준다.
		dao.memberUpdate(dto);
	}

	@Override
	public void memberDelete(MemberDto dto) throws Exception {
         dao.memberDelete(dto);        
	}

	@Override
	public TeamDto teamInfo(int member_no) {
		return dao.teamInfo(member_no);
	}
  
	//탈퇴비번체크
	@Override
	public int passChk(MemberDto dto) throws Exception {
		int result = dao.passChk(dto);
		return result;

	}
	

	//아이디 중복체크
	@Override
	public int idChk(MemberDto dto) throws Exception {
		int result = dao.idChk(dto);
		return result;
	}
	
	
	
}
