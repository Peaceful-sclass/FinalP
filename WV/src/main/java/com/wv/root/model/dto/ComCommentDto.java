package com.wv.root.model.dto;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.wv.root.model.util.CustomDateSerializer;

public class ComCommentDto {
	private int comcmtno;
	private int comcmtgroupno;
	private int comcmtgrpno;
	private String comcomment;
	private Date regdate;
	private int cno;
	private int member_no;
	private String member_id;
	
	public ComCommentDto() {
		super();
	}

	public ComCommentDto(int comcmtno, int comcmtgroupno, int comcmtgrpno, String comcomment, Date regdate, int cno,
			int member_no, String member_id) {
		super();
		this.comcmtno = comcmtno;
		this.comcmtgroupno = comcmtgroupno;
		this.comcmtgrpno = comcmtgrpno;
		this.comcomment = comcomment;
		this.regdate = regdate;
		this.cno = cno;
		this.member_no = member_no;
		this.member_id = member_id;
	}

	public int getComcmtno() {
		return comcmtno;
	}

	public void setComcmtno(int comcmtno) {
		this.comcmtno = comcmtno;
	}

	public int getComcmtgroupno() {
		return comcmtgroupno;
	}

	public void setComcmtgroupno(int comcmtgroupno) {
		this.comcmtgroupno = comcmtgroupno;
	}

	public int getComcmtgrpno() {
		return comcmtgrpno;
	}

	public void setComcmtgrpno(int comcmtgrpno) {
		this.comcmtgrpno = comcmtgrpno;
	}

	public String getComcomment() {
		return comcomment;
	}

	public void setComcomment(String comcomment) {
		this.comcomment = comcomment;
	}
	@JsonSerialize(using = CustomDateSerializer.class)
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
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

	@Override
	public String toString() {
		return "ComCommentDto [comcmtno=" + comcmtno + ", comcmtgroupno=" + comcmtgroupno + ", comcmtgrpno="
				+ comcmtgrpno + ", comcomment=" + comcomment + ", regdate=" + regdate + ", cno=" + cno + ", member_no="
				+ member_no + ", member_id=" + member_id + "]";
	}




	
	
	
	
}