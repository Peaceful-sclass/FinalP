package com.wv.root;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.ExcelBiz;
import com.wv.root.model.dto.ExcelDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExcelController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

	@Autowired
	private ExcelBiz biz;
	
	
	//공유 문서 값 가져오기
	@RequestMapping(value = "/shareDocumentList.do", method = RequestMethod.GET)
	public String shareDocumentList(Locale locale, Model model,HttpServletRequest httpServletRequest) {
		logger.info("Excel List"); 
		
		HttpSession session = httpServletRequest.getSession();
		
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		System.out.println("팀넘버"+team_no);
		
		//팀 넘버가 team_no일 경우
		model.addAttribute("list", biz.selectCol(team_no));

		return "shareDocumentList";
	}
	
	
	
	//공유문서 값 넣기
	@RequestMapping(value = "/shareDocumentInsert.do", method = RequestMethod.POST)
	public String shareDocumentInsert(HttpServletRequest httpServletRequest) {
		logger.info("Excel Insert");
		HttpSession session = httpServletRequest.getSession();
		
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		
		List<ExcelDto> list = new ArrayList<ExcelDto>();
		
		ExcelDto row1 = new ExcelDto(0, team_no, 1, httpServletRequest.getParameter("A1"), httpServletRequest.getParameter("B1"), 
				httpServletRequest.getParameter("C1"),httpServletRequest.getParameter("D1"), httpServletRequest.getParameter("E1"),
				httpServletRequest.getParameter("F1"),httpServletRequest.getParameter("G1"), httpServletRequest.getParameter("H1"),
				httpServletRequest.getParameter("I1"),httpServletRequest.getParameter("J1"));
		
		ExcelDto row2 = new ExcelDto(0, team_no, 2, httpServletRequest.getParameter("A2"), httpServletRequest.getParameter("B2"), 
				httpServletRequest.getParameter("C2"),httpServletRequest.getParameter("D2"), httpServletRequest.getParameter("E2"),
				httpServletRequest.getParameter("F2"),httpServletRequest.getParameter("G2"), httpServletRequest.getParameter("H2"),
				httpServletRequest.getParameter("I2"),httpServletRequest.getParameter("J2"));
		
		ExcelDto row3 = new ExcelDto(0, team_no, 3, httpServletRequest.getParameter("A3"), httpServletRequest.getParameter("B3"), 
				httpServletRequest.getParameter("C3"),httpServletRequest.getParameter("D3"), httpServletRequest.getParameter("E3"),
				httpServletRequest.getParameter("F3"),httpServletRequest.getParameter("G3"), httpServletRequest.getParameter("H3"),
				httpServletRequest.getParameter("I3"),httpServletRequest.getParameter("J3"));
		
		ExcelDto row4 = new ExcelDto(0, team_no, 4, httpServletRequest.getParameter("A4"), httpServletRequest.getParameter("B4"), 
				httpServletRequest.getParameter("C4"),httpServletRequest.getParameter("D4"), httpServletRequest.getParameter("E4"),
				httpServletRequest.getParameter("F4"),httpServletRequest.getParameter("G4"), httpServletRequest.getParameter("H4"),
				httpServletRequest.getParameter("I4"),httpServletRequest.getParameter("J4"));
		
		ExcelDto row5 = new ExcelDto(0, team_no, 5, httpServletRequest.getParameter("A5"), httpServletRequest.getParameter("B5"), 
				httpServletRequest.getParameter("C5"),httpServletRequest.getParameter("D5"), httpServletRequest.getParameter("E5"),
				httpServletRequest.getParameter("F5"),httpServletRequest.getParameter("G5"), httpServletRequest.getParameter("H5"),
				httpServletRequest.getParameter("I5"),httpServletRequest.getParameter("J5"));
		
		ExcelDto row6 = new ExcelDto(0, team_no, 6, httpServletRequest.getParameter("A6"), httpServletRequest.getParameter("B6"), 
				httpServletRequest.getParameter("C6"),httpServletRequest.getParameter("D6"), httpServletRequest.getParameter("E6"),
				httpServletRequest.getParameter("F6"),httpServletRequest.getParameter("G6"), httpServletRequest.getParameter("H6"),
				httpServletRequest.getParameter("I6"),httpServletRequest.getParameter("J6"));
		
		ExcelDto row7 = new ExcelDto(0, team_no, 7, httpServletRequest.getParameter("A7"), httpServletRequest.getParameter("B7"), 
				httpServletRequest.getParameter("C7"),httpServletRequest.getParameter("D7"), httpServletRequest.getParameter("E7"),
				httpServletRequest.getParameter("F7"),httpServletRequest.getParameter("G7"), httpServletRequest.getParameter("H7"),
				httpServletRequest.getParameter("I7"),httpServletRequest.getParameter("J7"));
		
		ExcelDto row8 = new ExcelDto(0, team_no, 8, httpServletRequest.getParameter("A8"), httpServletRequest.getParameter("B8"), 
				httpServletRequest.getParameter("C8"),httpServletRequest.getParameter("D8"), httpServletRequest.getParameter("E8"),
				httpServletRequest.getParameter("F8"),httpServletRequest.getParameter("G8"), httpServletRequest.getParameter("H8"),
				httpServletRequest.getParameter("I8"),httpServletRequest.getParameter("J8"));
		
		ExcelDto row9 = new ExcelDto(0, team_no, 9, httpServletRequest.getParameter("A9"), httpServletRequest.getParameter("B9"), 
				httpServletRequest.getParameter("C9"),httpServletRequest.getParameter("D9"), httpServletRequest.getParameter("E9"),
				httpServletRequest.getParameter("F9"),httpServletRequest.getParameter("G9"), httpServletRequest.getParameter("H9"),
				httpServletRequest.getParameter("I9"),httpServletRequest.getParameter("J9"));
		
		ExcelDto row10 = new ExcelDto(0, team_no, 10, httpServletRequest.getParameter("A10"), httpServletRequest.getParameter("B10"), 
				httpServletRequest.getParameter("C10"),httpServletRequest.getParameter("D10"), httpServletRequest.getParameter("E10"),
				httpServletRequest.getParameter("F10"),httpServletRequest.getParameter("G10"), httpServletRequest.getParameter("H10"),
				httpServletRequest.getParameter("I10"),httpServletRequest.getParameter("J10"));
		
		//여기부터
		ExcelDto row11 = new ExcelDto(0, team_no, 11, httpServletRequest.getParameter("A11"), httpServletRequest.getParameter("B11"), 
				httpServletRequest.getParameter("C11"),httpServletRequest.getParameter("D11"), httpServletRequest.getParameter("E11"),
				httpServletRequest.getParameter("F11"),httpServletRequest.getParameter("G11"), httpServletRequest.getParameter("H11"),
				httpServletRequest.getParameter("I11"),httpServletRequest.getParameter("J11"));
		
		ExcelDto row12 = new ExcelDto(0, team_no, 12, httpServletRequest.getParameter("A12"), httpServletRequest.getParameter("B12"), 
				httpServletRequest.getParameter("C12"),httpServletRequest.getParameter("D12"), httpServletRequest.getParameter("E12"),
				httpServletRequest.getParameter("F12"),httpServletRequest.getParameter("G12"), httpServletRequest.getParameter("H12"),
				httpServletRequest.getParameter("I12"),httpServletRequest.getParameter("J12"));
		
		ExcelDto row13 = new ExcelDto(0, team_no, 13, httpServletRequest.getParameter("A13"), httpServletRequest.getParameter("B13"), 
				httpServletRequest.getParameter("C13"),httpServletRequest.getParameter("D13"), httpServletRequest.getParameter("E13"),
				httpServletRequest.getParameter("F13"),httpServletRequest.getParameter("G13"), httpServletRequest.getParameter("H13"),
				httpServletRequest.getParameter("I13"),httpServletRequest.getParameter("J13"));
		
		ExcelDto row14 = new ExcelDto(0, team_no, 14, httpServletRequest.getParameter("A14"), httpServletRequest.getParameter("B14"), 
				httpServletRequest.getParameter("C14"),httpServletRequest.getParameter("D14"), httpServletRequest.getParameter("E14"),
				httpServletRequest.getParameter("F14"),httpServletRequest.getParameter("G14"), httpServletRequest.getParameter("H14"),
				httpServletRequest.getParameter("I14"),httpServletRequest.getParameter("J14"));
		
		ExcelDto row15 = new ExcelDto(0, team_no, 15, httpServletRequest.getParameter("A15"), httpServletRequest.getParameter("B15"), 
				httpServletRequest.getParameter("C15"),httpServletRequest.getParameter("D15"), httpServletRequest.getParameter("E15"),
				httpServletRequest.getParameter("F15"),httpServletRequest.getParameter("G15"), httpServletRequest.getParameter("H15"),
				httpServletRequest.getParameter("I15"),httpServletRequest.getParameter("J15"));
		
		ExcelDto row16 = new ExcelDto(0, team_no, 16, httpServletRequest.getParameter("A16"), httpServletRequest.getParameter("B16"), 
				httpServletRequest.getParameter("C16"),httpServletRequest.getParameter("D16"), httpServletRequest.getParameter("E16"),
				httpServletRequest.getParameter("F16"),httpServletRequest.getParameter("G16"), httpServletRequest.getParameter("H16"),
				httpServletRequest.getParameter("I16"),httpServletRequest.getParameter("J16"));
		
		ExcelDto row17 = new ExcelDto(0, team_no, 17, httpServletRequest.getParameter("A17"), httpServletRequest.getParameter("B17"), 
				httpServletRequest.getParameter("C17"),httpServletRequest.getParameter("D17"), httpServletRequest.getParameter("E17"),
				httpServletRequest.getParameter("F17"),httpServletRequest.getParameter("G17"), httpServletRequest.getParameter("H17"),
				httpServletRequest.getParameter("I17"),httpServletRequest.getParameter("J17"));
		
		ExcelDto row18 = new ExcelDto(0, team_no, 18, httpServletRequest.getParameter("A18"), httpServletRequest.getParameter("B18"), 
				httpServletRequest.getParameter("C18"),httpServletRequest.getParameter("D18"), httpServletRequest.getParameter("E18"),
				httpServletRequest.getParameter("F18"),httpServletRequest.getParameter("G18"), httpServletRequest.getParameter("H18"),
				httpServletRequest.getParameter("I18"),httpServletRequest.getParameter("J18"));
		
		ExcelDto row19 = new ExcelDto(0, team_no, 19, httpServletRequest.getParameter("A19"), httpServletRequest.getParameter("B19"), 
				httpServletRequest.getParameter("C19"),httpServletRequest.getParameter("D19"), httpServletRequest.getParameter("E19"),
				httpServletRequest.getParameter("F19"),httpServletRequest.getParameter("G19"), httpServletRequest.getParameter("H19"),
				httpServletRequest.getParameter("I19"),httpServletRequest.getParameter("J19"));
		
		ExcelDto row20 = new ExcelDto(0, team_no, 20, httpServletRequest.getParameter("A20"), httpServletRequest.getParameter("B20"), 
				httpServletRequest.getParameter("C20"),httpServletRequest.getParameter("D20"), httpServletRequest.getParameter("E20"),
				httpServletRequest.getParameter("F20"),httpServletRequest.getParameter("G20"), httpServletRequest.getParameter("H20"),
				httpServletRequest.getParameter("I20"),httpServletRequest.getParameter("J20"));
		
		
		list.add(row1);list.add(row2);list.add(row3);list.add(row4);list.add(row5);
		list.add(row6);list.add(row7);list.add(row8);list.add(row9);list.add(row10);
		list.add(row11);list.add(row12);list.add(row13);list.add(row14);list.add(row15);
		list.add(row16);list.add(row17);list.add(row18);list.add(row19);list.add(row20);
		
		biz.insertExcel(list.get(0));biz.insertExcel(list.get(1));biz.insertExcel(list.get(2));biz.insertExcel(list.get(3));biz.insertExcel(list.get(4));
		biz.insertExcel(list.get(5));biz.insertExcel(list.get(6));biz.insertExcel(list.get(7));biz.insertExcel(list.get(8));biz.insertExcel(list.get(9));
		
		biz.insertExcel(list.get(10));biz.insertExcel(list.get(11));biz.insertExcel(list.get(12));biz.insertExcel(list.get(13));biz.insertExcel(list.get(14));
		biz.insertExcel(list.get(15));biz.insertExcel(list.get(16));biz.insertExcel(list.get(17));biz.insertExcel(list.get(18));biz.insertExcel(list.get(19));

		return "redirect:shareDocumentList.do";
	}
	
	//공유문서 값 수정
	@RequestMapping(value = "/shareDocumentUpdateForm.do", method = RequestMethod.GET)
	public String shareDocumentUpdateForm(HttpServletRequest httpServletRequest,Locale locale, Model model) {
		logger.info("Excel UpdateForm");		
		
		HttpSession session = httpServletRequest.getSession();
		
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		
		//체크값 넘기기
		model.addAttribute("check",httpServletRequest.getParameter("checkVal"));
		
		ExcelDto row1 = new ExcelDto(0,team_no, 1, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row2 = new ExcelDto(0,team_no, 2, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row3 = new ExcelDto(0,team_no, 3, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row4 = new ExcelDto(0,team_no, 4, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row5 = new ExcelDto(0,team_no, 5, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row6 = new ExcelDto(0,team_no, 6, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row7 = new ExcelDto(0,team_no, 7, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row8 = new ExcelDto(0,team_no, 8, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row9 = new ExcelDto(0,team_no, 9, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row10 = new ExcelDto(0,team_no, 10, null,null,null,null,null,null,null,null,null,null);
		
		ExcelDto row11 = new ExcelDto(0,team_no, 11, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row12 = new ExcelDto(0,team_no, 12, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row13 = new ExcelDto(0,team_no, 13, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row14 = new ExcelDto(0,team_no, 14, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row15 = new ExcelDto(0,team_no, 15, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row16 = new ExcelDto(0,team_no, 16, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row17 = new ExcelDto(0,team_no, 17, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row18 = new ExcelDto(0,team_no, 18, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row19 = new ExcelDto(0,team_no, 19, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row20 = new ExcelDto(0,team_no, 20, null,null,null,null,null,null,null,null,null,null);
		
		
		model.addAttribute("row1",biz.selectRow(row1));
		model.addAttribute("row2",biz.selectRow(row2));
		model.addAttribute("row3",biz.selectRow(row3));
		model.addAttribute("row4",biz.selectRow(row4));
		model.addAttribute("row5",biz.selectRow(row5));
		model.addAttribute("row6",biz.selectRow(row6));
		model.addAttribute("row7",biz.selectRow(row7));
		model.addAttribute("row8",biz.selectRow(row8));
		model.addAttribute("row9",biz.selectRow(row9));
		model.addAttribute("row10",biz.selectRow(row10));		
		
		model.addAttribute("row11",biz.selectRow(row11));
		model.addAttribute("row12",biz.selectRow(row12));
		model.addAttribute("row13",biz.selectRow(row13));
		model.addAttribute("row14",biz.selectRow(row14));
		model.addAttribute("row15",biz.selectRow(row15));
		model.addAttribute("row16",biz.selectRow(row16));
		model.addAttribute("row17",biz.selectRow(row17));
		model.addAttribute("row18",biz.selectRow(row18));
		model.addAttribute("row19",biz.selectRow(row19));
		model.addAttribute("row20",biz.selectRow(row20));	
		
		return "shareDocumentList";
	}
	
	
	//공유문서 값 tnwjd
	@RequestMapping(value = "/shareDocumentUpdate.do", method = RequestMethod.POST)
	public String shareDocumentUpdate(HttpServletRequest httpServletRequest,Locale locale, Model model) {
		logger.info("Excel Update");
		HttpSession session = httpServletRequest.getSession();
		
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		ExcelDto row1 = new ExcelDto(0, team_no, 1, httpServletRequest.getParameter("A1"), httpServletRequest.getParameter("B1"), 
				httpServletRequest.getParameter("C1"),httpServletRequest.getParameter("D1"), httpServletRequest.getParameter("E1"),
				httpServletRequest.getParameter("F1"),httpServletRequest.getParameter("G1"), httpServletRequest.getParameter("H1"),
				httpServletRequest.getParameter("I1"),httpServletRequest.getParameter("J1"));
		
		ExcelDto row2 = new ExcelDto(0, team_no, 2, httpServletRequest.getParameter("A2"), httpServletRequest.getParameter("B2"), 
				httpServletRequest.getParameter("C2"),httpServletRequest.getParameter("D2"), httpServletRequest.getParameter("E2"),
				httpServletRequest.getParameter("F2"),httpServletRequest.getParameter("G2"), httpServletRequest.getParameter("H2"),
				httpServletRequest.getParameter("I2"),httpServletRequest.getParameter("J2"));
		
		ExcelDto row3 = new ExcelDto(0, team_no, 3, httpServletRequest.getParameter("A3"), httpServletRequest.getParameter("B3"), 
				httpServletRequest.getParameter("C3"),httpServletRequest.getParameter("D3"), httpServletRequest.getParameter("E3"),
				httpServletRequest.getParameter("F3"),httpServletRequest.getParameter("G3"), httpServletRequest.getParameter("H3"),
				httpServletRequest.getParameter("I3"),httpServletRequest.getParameter("J3"));
		
		ExcelDto row4 = new ExcelDto(0, team_no, 4, httpServletRequest.getParameter("A4"), httpServletRequest.getParameter("B4"), 
				httpServletRequest.getParameter("C4"),httpServletRequest.getParameter("D4"), httpServletRequest.getParameter("E4"),
				httpServletRequest.getParameter("F4"),httpServletRequest.getParameter("G4"), httpServletRequest.getParameter("H4"),
				httpServletRequest.getParameter("I4"),httpServletRequest.getParameter("J4"));
		
		ExcelDto row5 = new ExcelDto(0, team_no, 5, httpServletRequest.getParameter("A5"), httpServletRequest.getParameter("B5"), 
				httpServletRequest.getParameter("C5"),httpServletRequest.getParameter("D5"), httpServletRequest.getParameter("E5"),
				httpServletRequest.getParameter("F5"),httpServletRequest.getParameter("G5"), httpServletRequest.getParameter("H5"),
				httpServletRequest.getParameter("I5"),httpServletRequest.getParameter("J5"));
		
		ExcelDto row6 = new ExcelDto(0, team_no, 6, httpServletRequest.getParameter("A6"), httpServletRequest.getParameter("B6"), 
				httpServletRequest.getParameter("C6"),httpServletRequest.getParameter("D6"), httpServletRequest.getParameter("E6"),
				httpServletRequest.getParameter("F6"),httpServletRequest.getParameter("G6"), httpServletRequest.getParameter("H6"),
				httpServletRequest.getParameter("I6"),httpServletRequest.getParameter("J6"));
		
		ExcelDto row7 = new ExcelDto(0, team_no, 7, httpServletRequest.getParameter("A7"), httpServletRequest.getParameter("B7"), 
				httpServletRequest.getParameter("C7"),httpServletRequest.getParameter("D7"), httpServletRequest.getParameter("E7"),
				httpServletRequest.getParameter("F7"),httpServletRequest.getParameter("G7"), httpServletRequest.getParameter("H7"),
				httpServletRequest.getParameter("I7"),httpServletRequest.getParameter("J7"));
		
		ExcelDto row8 = new ExcelDto(0, team_no, 8, httpServletRequest.getParameter("A8"), httpServletRequest.getParameter("B8"), 
				httpServletRequest.getParameter("C8"),httpServletRequest.getParameter("D8"), httpServletRequest.getParameter("E8"),
				httpServletRequest.getParameter("F8"),httpServletRequest.getParameter("G8"), httpServletRequest.getParameter("H8"),
				httpServletRequest.getParameter("I8"),httpServletRequest.getParameter("J8"));
		
		ExcelDto row9 = new ExcelDto(0, team_no, 9, httpServletRequest.getParameter("A9"), httpServletRequest.getParameter("B9"), 
				httpServletRequest.getParameter("C9"),httpServletRequest.getParameter("D9"), httpServletRequest.getParameter("E9"),
				httpServletRequest.getParameter("F9"),httpServletRequest.getParameter("G9"), httpServletRequest.getParameter("H9"),
				httpServletRequest.getParameter("I9"),httpServletRequest.getParameter("J9"));
		
		ExcelDto row10 = new ExcelDto(0, team_no, 10, httpServletRequest.getParameter("A10"), httpServletRequest.getParameter("B10"), 
				httpServletRequest.getParameter("C10"),httpServletRequest.getParameter("D10"), httpServletRequest.getParameter("E10"),
				httpServletRequest.getParameter("F10"),httpServletRequest.getParameter("G10"), httpServletRequest.getParameter("H10"),
				httpServletRequest.getParameter("I10"),httpServletRequest.getParameter("J10"));
		
		ExcelDto row11 = new ExcelDto(0, team_no, 11, httpServletRequest.getParameter("A11"), httpServletRequest.getParameter("B11"), 
				httpServletRequest.getParameter("C11"),httpServletRequest.getParameter("D11"), httpServletRequest.getParameter("E11"),
				httpServletRequest.getParameter("F11"),httpServletRequest.getParameter("G11"), httpServletRequest.getParameter("H11"),
				httpServletRequest.getParameter("I11"),httpServletRequest.getParameter("J11"));
		
		ExcelDto row12 = new ExcelDto(0, team_no, 12, httpServletRequest.getParameter("A12"), httpServletRequest.getParameter("B12"), 
				httpServletRequest.getParameter("C12"),httpServletRequest.getParameter("D12"), httpServletRequest.getParameter("E12"),
				httpServletRequest.getParameter("F12"),httpServletRequest.getParameter("G12"), httpServletRequest.getParameter("H12"),
				httpServletRequest.getParameter("I12"),httpServletRequest.getParameter("J12"));
		
		ExcelDto row13 = new ExcelDto(0, team_no, 13, httpServletRequest.getParameter("A13"), httpServletRequest.getParameter("B13"), 
				httpServletRequest.getParameter("C13"),httpServletRequest.getParameter("D13"), httpServletRequest.getParameter("E13"),
				httpServletRequest.getParameter("F13"),httpServletRequest.getParameter("G13"), httpServletRequest.getParameter("H13"),
				httpServletRequest.getParameter("I13"),httpServletRequest.getParameter("J13"));
		
		ExcelDto row14 = new ExcelDto(0, team_no, 14, httpServletRequest.getParameter("A14"), httpServletRequest.getParameter("B14"), 
				httpServletRequest.getParameter("C14"),httpServletRequest.getParameter("D14"), httpServletRequest.getParameter("E14"),
				httpServletRequest.getParameter("F14"),httpServletRequest.getParameter("G14"), httpServletRequest.getParameter("H14"),
				httpServletRequest.getParameter("I14"),httpServletRequest.getParameter("J14"));
		
		ExcelDto row15 = new ExcelDto(0, team_no, 15, httpServletRequest.getParameter("A15"), httpServletRequest.getParameter("B15"), 
				httpServletRequest.getParameter("C15"),httpServletRequest.getParameter("D15"), httpServletRequest.getParameter("E15"),
				httpServletRequest.getParameter("F15"),httpServletRequest.getParameter("G15"), httpServletRequest.getParameter("H15"),
				httpServletRequest.getParameter("I15"),httpServletRequest.getParameter("J15"));
		
		ExcelDto row16 = new ExcelDto(0, team_no, 16, httpServletRequest.getParameter("A16"), httpServletRequest.getParameter("B16"), 
				httpServletRequest.getParameter("C16"),httpServletRequest.getParameter("D16"), httpServletRequest.getParameter("E16"),
				httpServletRequest.getParameter("F16"),httpServletRequest.getParameter("G16"), httpServletRequest.getParameter("H16"),
				httpServletRequest.getParameter("I16"),httpServletRequest.getParameter("J16"));
		
		ExcelDto row17 = new ExcelDto(0, team_no, 17, httpServletRequest.getParameter("A17"), httpServletRequest.getParameter("B17"), 
				httpServletRequest.getParameter("C17"),httpServletRequest.getParameter("D17"), httpServletRequest.getParameter("E17"),
				httpServletRequest.getParameter("F17"),httpServletRequest.getParameter("G17"), httpServletRequest.getParameter("H17"),
				httpServletRequest.getParameter("I17"),httpServletRequest.getParameter("J17"));
		
		ExcelDto row18 = new ExcelDto(0, team_no, 18, httpServletRequest.getParameter("A18"), httpServletRequest.getParameter("B18"), 
				httpServletRequest.getParameter("C18"),httpServletRequest.getParameter("D18"), httpServletRequest.getParameter("E18"),
				httpServletRequest.getParameter("F18"),httpServletRequest.getParameter("G18"), httpServletRequest.getParameter("H18"),
				httpServletRequest.getParameter("I18"),httpServletRequest.getParameter("J18"));
		
		ExcelDto row19 = new ExcelDto(0, team_no, 19, httpServletRequest.getParameter("A19"), httpServletRequest.getParameter("B19"), 
				httpServletRequest.getParameter("C19"),httpServletRequest.getParameter("D19"), httpServletRequest.getParameter("E19"),
				httpServletRequest.getParameter("F19"),httpServletRequest.getParameter("G19"), httpServletRequest.getParameter("H19"),
				httpServletRequest.getParameter("I19"),httpServletRequest.getParameter("J19"));
		
		ExcelDto row20 = new ExcelDto(0, team_no, 20, httpServletRequest.getParameter("A20"), httpServletRequest.getParameter("B20"), 
				httpServletRequest.getParameter("C20"),httpServletRequest.getParameter("D20"), httpServletRequest.getParameter("E20"),
				httpServletRequest.getParameter("F20"),httpServletRequest.getParameter("G20"), httpServletRequest.getParameter("H20"),
				httpServletRequest.getParameter("I20"),httpServletRequest.getParameter("J20"));
		
		
		System.out.println(row1.getColB());
		
		biz.updateExcel(row1);biz.updateExcel(row2);biz.updateExcel(row3);biz.updateExcel(row4);biz.updateExcel(row5);
		biz.updateExcel(row6);biz.updateExcel(row7);biz.updateExcel(row8);biz.updateExcel(row9);biz.updateExcel(row10);
		
		biz.updateExcel(row11);biz.updateExcel(row12);biz.updateExcel(row13);biz.updateExcel(row14);biz.updateExcel(row15);
		biz.updateExcel(row16);biz.updateExcel(row17);biz.updateExcel(row18);biz.updateExcel(row19);biz.updateExcel(row20);

		return "redirect:shareDocumentList.do";

	}
	
	//엑셀 다운
	@RequestMapping(value = "/excelDown.do", method = RequestMethod.GET)
	public String excelDown(HttpServletRequest httpServletRequest, Locale locale, Model model, RedirectAttributes redi) {
		logger.info("Excel Down");
		
		HttpSession session = httpServletRequest.getSession();
		
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		model.addAttribute("teamNo",team_no);
		model.addAttribute("request", httpServletRequest); 
		biz.downExcel(biz.selectCol(team_no), model, team_no);

		
		System.out.println("팀넘버"+team_no);
		
		//팀 넘버가 team_no일 경우
		model.addAttribute("list", biz.selectCol(team_no));
		model.addAttribute("result", biz.downresult());
		System.out.println("값:"+biz.downresult());
		
		return "shareDocumentList";
		
		
	}
	
	
	
	
	
	
	
}
