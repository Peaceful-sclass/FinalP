package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.TeamDto.TeamMemberDto;

public interface TeamDao {
	String NameSpace = "wvteam.";
	
	public int createTeam(TeamMemberDto dto);
	public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto); 
	
	
	
}
