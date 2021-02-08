package com.wv.root.model.biz;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import com.wv.root.model.dto.TeamDto.Email;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

public interface TeamBiz {
	
	public int createTeam(TeamMemberDto dto);
	public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto);
	public List<TeamMemberDto> getTeamMember(TeamMemberDto dto);
	public void invite(Email edto) throws MessagingException, UnsupportedEncodingException;
	public int chkISidinTeam(Email edto);
	public int chkteamLD(Email edto);
	public int emailConfirm(Email edto);
	public int teamManageConfirm(List list);
	
	
	
	
	
	
	
	
	
	
	
}
