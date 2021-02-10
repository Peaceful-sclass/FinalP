package com.wv.root.model.biz;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.TeamDao;
import com.wv.root.model.dto.TeamDto.Email;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;
import com.wv.root.model.util.MailHandler;
import com.wv.root.model.util.TempKey;

@Service
public class TeamBizImpl implements TeamBiz {

	@Inject
	private JavaMailSender mailSender;

	@Autowired
	private TeamDao dao;


	public void invite(Email dto) throws MessagingException, UnsupportedEncodingException {
		//String encPassword = passwordEncoder.encode(dto.getMemberPassword());
		//dto.setMemberPassword(encPassword);
		//System.out.println("암호화된 비밀번호 : "+user.getUserPassword());

		System.out.println("[Biz: invite()] - "+dto);//member_id,team_no

		String key = new TempKey().getKey(50,false);  // 인증키 생성

		dao.createCode(dto,key); //인증키 db 저장 /member_id,team_no,code

		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[WV] 팀초대 인증메일");
		sendMail.setText(
		new StringBuffer().append("	<table align=\"center\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"\r\n" + 
				"		border=\"0\" bgcolor=\"#ffffff\"\r\n" + 
				"		style=\"max-width: 640px; margin: 0 auto; border: 1px solid #cccccc;\">\r\n" + 
				"		<tbody>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"				<td width=\"88%\" height=\"25\" bgcolor=\"#DB631F\"><h1\r\n" + 
				"						style=\"font-size: 2rem; letter-spacing: 0.125em; font-weight: 300; font-family: 'Lexend Mega', sans-serif; color: #fff;\">WORKING\r\n" + 
				"						VILLAGE</h1></td>\r\n" + 
				"				<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"				<td width=\"88%\"\r\n" + 
				"					style=\"font-size: 18px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; font-weight: bold; color: #1e1e1e\">")
		.append(dto.getMember_id()+" 님에 대한 WV 팀초대 이메일 인증 입니다").
		append("</td>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"25\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"				<td width=\"88%\"\r\n" + 
				"					style=\"font-size: 14px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"				</td>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"				<td width=\"88%\">\r\n" + 
				"\r\n" + 
				"					<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
				"					style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; 								letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"\r\n" + 
				"						<tbody>\r\n" + 
				"							<tr>\r\n" + 
				"								<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td width=\"100%\" height=\"25\" colspan=\"5\"></td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td valign=\"top\" width=\"100%\"\r\n" + 
				"									style=\"font-size: 14px; font-weight: bold; word-break: break-all; text-align: center;\">").
		append("<a style='background-color: #DB631F; padding: 15px; position: relative; font-size: 15px; text-decoration: none; color: #fff; border: solid 1px #DB631F; border-radius: 5px;' href='http://localhost:8787/root/emailConfirm.do?member_id=").
		append(dto.getMember_id()).append("&code=").append(key).append("&team_no=").append(dto.getTeam_no()).
		append("' target='_blank'>이메일 인증하기</a>").
		append("</td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td width=\"100%\" height=\"8\" colspan=\"5\"></td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td width=\"3%\"></td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td width=\"100%\" height=\"27\" colspan=\"5\"></td>\r\n" + 
				"							</tr>\r\n" + 
				"							<tr>\r\n" + 
				"								<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
				"							</tr>\r\n" + 
				"						</tbody>\r\n" + 
				"\r\n" + 
				"					</table>\r\n" + 
				"\r\n" + 
				"				</td>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"30\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"				<td width=\"88%\">\r\n" + 
				"\r\n" + 
				"					<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
				"						bgcolor=\"#f8f8f8\"\r\n" + 
				"						style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"					</table>\r\n" + 
				"\r\n" + 
				"				</td>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"24\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"58\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"1\" colspan=\"3\" bgcolor=\"#e6e6e6\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"16\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"				<td width=\"88%\"\r\n" + 
				"					style=\"font-size: 12px; line-height: 18px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '돋움', Dotum; letter-spacing: -1px; color: #767676\">\r\n" + 
				"\r\n" + 
				"					본 메일은 발신전용입니다.</td>\r\n" + 
				"				<td width=\"6%\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"			<tr>\r\n" + 
				"				<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
				"			</tr>\r\n" + 
				"		</tbody>\r\n" + 
				"\r\n" + 
				"	</table>")
		.toString());
		sendMail.setFrom("sjeys14@gmail.com", "WV-SERVICE ");

		sendMail.setTo(dao.getIvEmail(dto)); //초대할ID의 email조회
		//sendMail.setTo("sjeys14@gmail.com");
		sendMail.send();
	}

	@Override
	public int createTeam(TeamMemberDto dto) {
		int res = dao.createTeam(dto);
		return res;
	}

	@Override
	public List<TeamMemberDto> getTeamInfo(TeamMemberDto dto) {
		return dao.getTeamInfo(dto);
	}

	@Override
	public List<TeamMemberDto> getTeamMember(TeamMemberDto dto) {
		return dao.getTeamMember(dto);
	}

	@Override
	public int chkISidinTeam(Email edto) {
		return dao.chkISidinTeam(edto);
	}

	@Override
	public int chkteamLD(Email edto) {
		return dao.chkteamLD(edto);
	}

	@Override
	public int emailConfirm(Email edto) {
		return dao.emailConfirm(edto);
	}

	@Override
	public int teamManageConfirm(List list) {
		
		return dao.teamManageConfirm(list);
	}

	@Override
	public Boolean teamWithdraw(TeamMemberDto dto) {
		return dao.teamWithdraw(dto);
	}













}
