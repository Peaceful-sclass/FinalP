package com.wv.root.model.biz;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.MemberDao;
import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.util.MailHandler;

@Service
public class MemberBizImpl implements MemberBiz{
    
	@Inject
	MemberDao dao;
	
	@Inject
	private JavaMailSender mailSender;

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

	@Override
	public List <String> findid(String member_email) {
		List <String> res = dao.findid(member_email);
		return res;
	}

	@Override
	public String findpw(MemberDto dto) {
		String res = dao.findpw(dto);
 		return res;
	}

	@Override
	public void sendid(String member_email, List<String> res) throws MessagingException, UnsupportedEncodingException{
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[WV] 계정 아이디 찾기 ");
		sendMail.setText(
		new StringBuffer().append("<table align=\"center\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"\r\n" + 
				"				border=\"0\" bgcolor=\"#ffffff\"\r\n" + 
				"				style=\"max-width: 640px; margin: 0 auto; border: 1px solid #cccccc;\"><link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n" + 
				"<link href=\"https://fonts.googleapis.com/css2?family=Lexend+Mega&display=swap\" rel=\"stylesheet\">\r\n" + 
				"\r\n" + 
				"				<tbody>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"						<td width=\"88%\" height=\"25\" bgcolor=\"#DB631F\"><h1 style=\"font-size: 2rem;letter-spacing: 0.125em;font-weight: 300;font-family: 'Lexend Mega', sans-serif;color:#fff;\">WORKING VILLAGE</h1></td>\r\n" + 
				"						<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\"\r\n" + 
				"							style=\"font-size: 18px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; font-weight: bold; color: #1e1e1e\">"+member_email+" 으로 가입된 회원님의 아이디는 총 "+res.size()+"개 입니다.</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"25\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\"\r\n" + 
				"							style=\"font-size: 14px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"						</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\">\r\n" + 
				"\r\n" + 
				"							<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
				"								style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"\r\n" + 
				"								<tbody>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"25\" colspan=\"5\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"3%\"></td>\r\n" + 
				"										<th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\"\r\n" + 
				"											width=\"22%\" style=\"font-size: 14px; font-weight: normal\">아이디</th>\r\n" + 
				"										<td width=\"2%\"></td>\r\n" + 
				"										<td valign=\"top\" width=\"70%\"\r\n" + 
				"											style=\"font-size: 14px; font-weight: bold; word-break: break-all\">"+res+"</td>\r\n" + 
				"										<td width=\"3%\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"8\" colspan=\"5\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"3%\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"27\" colspan=\"5\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"								</tbody>\r\n" + 
				"\r\n" + 
				"							</table>\r\n" + 
				"\r\n" + 
				"						</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"30\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\">\r\n" + 
				"\r\n" + 
				"							<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
				"								bgcolor=\"#f8f8f8\"\r\n" + 
				"								style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"							</table>\r\n" + 
				"\r\n" + 
				"						</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"24\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"58\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"1\" colspan=\"3\" bgcolor=\"#e6e6e6\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"16\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\"\r\n" + 
				"							style=\"font-size: 12px; line-height: 18px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '돋움', Dotum; letter-spacing: -1px; color: #767676\">\r\n" + 
				"\r\n" + 
				"							본 메일은 발신전용입니다.</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"				</tbody>\r\n" + 
				"\r\n" + 
				"			</table>").toString());		
		sendMail.setFrom("sjeys14@gmail.com", "WV-SERVICE ");		
		sendMail.setTo(member_email); //초대할ID의 email조회
		sendMail.send();
		
	}

	@Override
	public void sendpw(MemberDto dto, String pw) throws MessagingException, UnsupportedEncodingException {
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[WV] 비밀번호 찾기 ");
		sendMail.setText(new StringBuffer().append("<table align=\"center\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#ffffff\" style=\"max-width: 640px; margin: 0 auto; border: 1px solid #cccccc;\">\r\n" + 
		   		"		<tbody>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
		   		"				<td width=\"88%\" height=\"25\" bgcolor=\"#DB631F\"><h1 style=\"font-size: 2rem; letter-spacing: 0.125em; font-weight: 300; font-family: 'Lexend Mega', sans-serif; color: #fff;\">WORKING VILLAGE</h1></td>\r\n" + 
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
		   		"				<td width=\"88%\" style=\"font-size: 18px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; font-weight: bold; color: #1e1e1e\">회원님의 비밀번호 입니다.</td>\r\n" + 
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
		   		"					<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
		   		"						<tbody>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"100%\" height=\"25\" colspan=\"5\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"3%\"></td>\r\n" + 
		   		"								<th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" width=\"22%\" style=\"font-size: 14px; font-weight: normal\">비밀번호</th>\r\n" + 
		   		"								<td width=\"2%\"></td>\r\n" + 
		   		"								<td valign=\"top\" width=\"70%\" style=\"font-size: 14px; font-weight: bold; word-break: break-all\">"+pw+"</td>\r\n" + 
		   		"								<td width=\"3%\"></td>\r\n" + 
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
		   		"					</table>\r\n" + 
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
		   		"					</table>\r\n" + 
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
		   		"				<td width=\"88%\" style=\"font-size: 12px; line-height: 18px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '돋움', Dotum; letter-spacing: -1px; color: #767676\">\r\n" + 
		   		"				본 메일은 발신전용입니다.</td>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"		</tbody>\r\n" + 
		   		"\r\n" + 
		   		"	</table>").toString());
		sendMail.setFrom("sjeys14@gmail.com", "WV-SERVICE ");
		sendMail.setTo(dto.getMember_email()); //초대할ID의 email조회
		sendMail.send();
		
	}
	

	//아이디 중복체크
	@Override
	public int idChk(MemberDto dto) throws Exception {
		int result = dao.idChk(dto);
		return result;
	}
	
	
	
}
