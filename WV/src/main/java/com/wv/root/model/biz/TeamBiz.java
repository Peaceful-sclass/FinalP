package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.TeamDto.TeamMemberDto;

public interface TeamBiz {
	
	public int createTeam(TeamMemberDto dto);
	public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto);
	public List<TeamMemberDto> getTeamMember(TeamMemberDto dto);
	
	
	
	
	
	
	
	
	
	
	
}
