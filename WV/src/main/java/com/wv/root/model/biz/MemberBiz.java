package com.wv.root.model.biz;

import org.springframework.stereotype.Service;

import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;

@Service
public interface MemberBiz {
	public void register(MemberDto dto) throws Exception;
	
	public MemberDto login(MemberDto dto) throws Exception;
	
	public void memberUpdate(MemberDto dto) throws Exception;
	
	public void memberDelete(MemberDto dto) throws Exception;

    public TeamDto teamInfo(int member_no);

	public int passChk(MemberDto dto) throws Exception;
	
    public int idChk(MemberDto dto) throws Exception;   
}
