package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.TeamDto.Email;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

public interface TeamDao {
	String NameSpace = "wvteam.";
	
	public int createTeam(TeamMemberDto dto);
	public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto);
	public List<TeamMemberDto> getTeamMember(TeamMemberDto dto);
	public void createCode(Email dto, String key);
	public int chkISidinTeam(Email edto);
	public int chkteamLD(Email edto);
	public String getIvEmail(Email dto);
	public int emailConfirm(Email edto);
	
	
	
}
