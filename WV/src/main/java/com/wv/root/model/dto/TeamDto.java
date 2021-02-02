package com.wv.root.model.dto;

import java.util.List;

public class TeamDto {
	
	private int team_no;
	private String team_name;
	private String team_intro;
	private TeamMemberDto tmdto; 
	private List<TeamMemberDto> tmlist; 
	
	public TeamDto() {
		super();
	}
	public TeamDto(int team_no, String team_name, String team_intro, TeamMemberDto tmdto, List<TeamMemberDto> tmlist) {
		super();
		this.team_no = team_no;
		this.team_name = team_name;
		this.team_intro = team_intro;
		this.tmdto = tmdto;
		this.tmlist = tmlist;
	}

	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getTeam_intro() {
		return team_intro;
	}
	public void setTeam_intro(String team_intro) {
		this.team_intro = team_intro;
	}
	public TeamMemberDto getTmdto() {
		return tmdto;
	}
	public void setTmdto(TeamMemberDto tmdto) {
		this.tmdto = tmdto;
	}
	public List<TeamMemberDto> getTmlist() {
		return tmlist;
	}
	public void setTmlist(List<TeamMemberDto> tmlist) {
		this.tmlist = tmlist;
	}

	@Override
	public String toString() {
		return "TeamDto [team_no=" + team_no + ", team_name=" + team_name + ", team_intro=" + team_intro + ", tmdto="
				+ tmdto + ", tmlist=" + tmlist + "]";
	}

	public static class TeamMemberDto {
		
		private int teammember_no;
		private int team_no;
		private String team_name;
		private String team_intro;
		private int member_no;
		private String member_id;
		private String grade_inteam;
		
		public TeamMemberDto() {
			super();
		}
		public TeamMemberDto(int teammember_no, int team_no, String team_name, String team_intro, int member_no,
				String member_id, String grade_inteam) {
			super();
			this.teammember_no = teammember_no;
			this.team_no = team_no;
			this.team_name = team_name;
			this.team_intro = team_intro;
			this.member_no = member_no;
			this.member_id = member_id;
			this.grade_inteam = grade_inteam;
		}
		

		public String getTeam_intro() {
			return team_intro;
		}
		public void setTeam_intro(String team_intro) {
			this.team_intro = team_intro;
		}
		public int getTeammember_no() {
			return teammember_no;
		}

		public void setTeammember_no(int teammember_no) {
			this.teammember_no = teammember_no;
		}

		public int getTeam_no() {
			return team_no;
		}

		public void setTeam_no(int team_no) {
			this.team_no = team_no;
		}

		public String getTeam_name() {
			return team_name;
		}

		public void setTeam_name(String team_name) {
			this.team_name = team_name;
		}

		public int getMember_no() {
			return member_no;
		}

		public void setMember_no(int member_no) {
			this.member_no = member_no;
		}

		public String getMember_id() {
			return member_id;
		}

		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}

		public String getGrade_inteam() {
			return grade_inteam;
		}

		public void setGrade_inteam(String grade_inteam) {
			this.grade_inteam = grade_inteam;
		}

		@Override
		public String toString() {
			return "TeamMemberDto [teammember_no=" + teammember_no + ", team_no=" + team_no + ", team_name=" + team_name
					+ ", member_no=" + member_no + ", member_id=" + member_id + ", grade_inteam=" + grade_inteam + "]";
		}
		
		
	}
	
	public static class Email {
		private int teamcode_no;
		private String member_id;
		private int team_no;
		private String code;
		private String member_email;
		public Email() {
			super();
		}
		public Email(int teamcode_no, String member_id, int team_no, String code, String member_email) {
			super();
			this.teamcode_no = teamcode_no;
			this.member_id = member_id;
			this.team_no = team_no;
			this.code = code;
			this.member_email = member_email;
		}
		public int getTeamcode_no() {
			return teamcode_no;
		}
		public void setTeamcode_no(int teamcode_no) {
			this.teamcode_no = teamcode_no;
		}
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		public int getTeam_no() {
			return team_no;
		}
		public void setTeam_no(int team_no) {
			this.team_no = team_no;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public String getMember_email() {
			return member_email;
		}
		public void setMember_email(String member_email) {
			this.member_email = member_email;
		}
		@Override
		public String toString() {
			return "Email [teamcode_no=" + teamcode_no + ", member_id=" + member_id + ", team_no=" + team_no + ", code="
					+ code + ", member_email=" + member_email + "]";
		}
		
		
	}
	
}