package com.wv.root;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.ExcelBiz;
import com.wv.root.model.biz.ShareCalendarBiz;
import com.wv.root.model.dao.ExcelDao;
import com.wv.root.model.dao.ExcelDaoImpl;
import com.wv.root.model.dto.ExcelDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExcelController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

	@Autowired
	private ExcelBiz biz;
	@Autowired
	private ShareCalendarBiz calbiz;
	
	@Autowired
	HttpSession session;
	
	
	//공유 문서 값 가져오기
	@RequestMapping(value = "/shareDocumentList.do", method = RequestMethod.GET)
	public String shareDocumentList(Locale locale, Model model,HttpServletRequest httpServletRequest) {
		logger.info("Excel List");
		
		
		model.addAttribute("callist", calbiz.selectEvent(1));
		//팀 넘버가 1일 경우
		model.addAttribute("list", biz.selectCol(1));
		

		return "shareDocumentList";
	}
	
	
	
	//공유문서 값 넣기
	@RequestMapping(value = "/shareDocumentInsert.do", method = RequestMethod.POST)
	public String shareDocumentInsert(HttpServletRequest httpServletRequest) {
		logger.info("Excel Insert");
		List<ExcelDto> list = new ArrayList<ExcelDto>();
		
		ExcelDto row1 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 1, httpServletRequest.getParameter("A1"), httpServletRequest.getParameter("B1"), 
				httpServletRequest.getParameter("C1"),httpServletRequest.getParameter("D1"), httpServletRequest.getParameter("E1"),
				httpServletRequest.getParameter("F1"),httpServletRequest.getParameter("G1"), httpServletRequest.getParameter("H1"),
				httpServletRequest.getParameter("I1"),httpServletRequest.getParameter("J1"));
		
		ExcelDto row2 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 2, httpServletRequest.getParameter("A2"), httpServletRequest.getParameter("B2"), 
				httpServletRequest.getParameter("C2"),httpServletRequest.getParameter("D2"), httpServletRequest.getParameter("E2"),
				httpServletRequest.getParameter("F2"),httpServletRequest.getParameter("G2"), httpServletRequest.getParameter("H2"),
				httpServletRequest.getParameter("I2"),httpServletRequest.getParameter("J2"));
		
		ExcelDto row3 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 3, httpServletRequest.getParameter("A3"), httpServletRequest.getParameter("B3"), 
				httpServletRequest.getParameter("C3"),httpServletRequest.getParameter("D3"), httpServletRequest.getParameter("E3"),
				httpServletRequest.getParameter("F3"),httpServletRequest.getParameter("G3"), httpServletRequest.getParameter("H3"),
				httpServletRequest.getParameter("I3"),httpServletRequest.getParameter("J3"));
		
		ExcelDto row4 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 4, httpServletRequest.getParameter("A4"), httpServletRequest.getParameter("B4"), 
				httpServletRequest.getParameter("C4"),httpServletRequest.getParameter("D4"), httpServletRequest.getParameter("E4"),
				httpServletRequest.getParameter("F4"),httpServletRequest.getParameter("G4"), httpServletRequest.getParameter("H4"),
				httpServletRequest.getParameter("I4"),httpServletRequest.getParameter("J4"));
		
		ExcelDto row5 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 5, httpServletRequest.getParameter("A5"), httpServletRequest.getParameter("B5"), 
				httpServletRequest.getParameter("C5"),httpServletRequest.getParameter("D5"), httpServletRequest.getParameter("E5"),
				httpServletRequest.getParameter("F5"),httpServletRequest.getParameter("G5"), httpServletRequest.getParameter("H5"),
				httpServletRequest.getParameter("I5"),httpServletRequest.getParameter("J5"));
		
		ExcelDto row6 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 6, httpServletRequest.getParameter("A6"), httpServletRequest.getParameter("B6"), 
				httpServletRequest.getParameter("C6"),httpServletRequest.getParameter("D6"), httpServletRequest.getParameter("E6"),
				httpServletRequest.getParameter("F6"),httpServletRequest.getParameter("G6"), httpServletRequest.getParameter("H6"),
				httpServletRequest.getParameter("I6"),httpServletRequest.getParameter("J6"));
		
		ExcelDto row7 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 7, httpServletRequest.getParameter("A7"), httpServletRequest.getParameter("B7"), 
				httpServletRequest.getParameter("C7"),httpServletRequest.getParameter("D7"), httpServletRequest.getParameter("E7"),
				httpServletRequest.getParameter("F7"),httpServletRequest.getParameter("G7"), httpServletRequest.getParameter("H7"),
				httpServletRequest.getParameter("I7"),httpServletRequest.getParameter("J7"));
		
		ExcelDto row8 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 8, httpServletRequest.getParameter("A8"), httpServletRequest.getParameter("B8"), 
				httpServletRequest.getParameter("C8"),httpServletRequest.getParameter("D8"), httpServletRequest.getParameter("E8"),
				httpServletRequest.getParameter("F8"),httpServletRequest.getParameter("G8"), httpServletRequest.getParameter("H8"),
				httpServletRequest.getParameter("I8"),httpServletRequest.getParameter("J8"));
		
		ExcelDto row9 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 9, httpServletRequest.getParameter("A9"), httpServletRequest.getParameter("B9"), 
				httpServletRequest.getParameter("C9"),httpServletRequest.getParameter("D9"), httpServletRequest.getParameter("E9"),
				httpServletRequest.getParameter("F9"),httpServletRequest.getParameter("G9"), httpServletRequest.getParameter("H9"),
				httpServletRequest.getParameter("I9"),httpServletRequest.getParameter("J9"));
		
		ExcelDto row10 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 10, httpServletRequest.getParameter("A10"), httpServletRequest.getParameter("B10"), 
				httpServletRequest.getParameter("C10"),httpServletRequest.getParameter("D10"), httpServletRequest.getParameter("E10"),
				httpServletRequest.getParameter("F10"),httpServletRequest.getParameter("G10"), httpServletRequest.getParameter("H10"),
				httpServletRequest.getParameter("I10"),httpServletRequest.getParameter("J10"));

		
		
		list.add(row1);list.add(row2);list.add(row3);list.add(row4);list.add(row5);
		list.add(row6);list.add(row7);list.add(row8);list.add(row9);list.add(row10);
		
		
		biz.insertExcel(list.get(0));biz.insertExcel(list.get(1));biz.insertExcel(list.get(2));biz.insertExcel(list.get(3));biz.insertExcel(list.get(4));
		biz.insertExcel(list.get(5));biz.insertExcel(list.get(6));biz.insertExcel(list.get(7));biz.insertExcel(list.get(8));biz.insertExcel(list.get(9));


		return "redirect:shareDocumentList.do";
	}
	
	//공유문서 값 수정
	@RequestMapping(value = "/shareDocumentUpdateForm.do", method = RequestMethod.GET)
	public String shareDocumentUpdateForm(HttpServletRequest httpServletRequest,Locale locale, Model model) {
		logger.info("Excel UpdateForm");		
		
		//체크값 넘기기
		model.addAttribute("check",httpServletRequest.getParameter("checkVal"));
		
		ExcelDto row1 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 1, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row2 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 2, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row3 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 3, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row4 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 4, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row5 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 5, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row6 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 6, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row7 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 7, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row8 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 8, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row9 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 9, null,null,null,null,null,null,null,null,null,null);
		ExcelDto row10 = new ExcelDto(0,Integer.parseInt(httpServletRequest.getParameter("teamNo")), 10, null,null,null,null,null,null,null,null,null,null);

		
		
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

		return "shareDocumentList";
	}
	
	
	//공유문서 값 tnwjd
	@RequestMapping(value = "/shareDocumentUpdate.do", method = RequestMethod.POST)
	public String shareDocumentUpdate(HttpServletRequest httpServletRequest,Locale locale, Model model) {
		logger.info("Excel Update");
		
		
		ExcelDto row1 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 1, httpServletRequest.getParameter("A1"), httpServletRequest.getParameter("B1"), 
				httpServletRequest.getParameter("C1"),httpServletRequest.getParameter("D1"), httpServletRequest.getParameter("E1"),
				httpServletRequest.getParameter("F1"),httpServletRequest.getParameter("G1"), httpServletRequest.getParameter("H1"),
				httpServletRequest.getParameter("I1"),httpServletRequest.getParameter("J1"));
		
		ExcelDto row2 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 2, httpServletRequest.getParameter("A2"), httpServletRequest.getParameter("B2"), 
				httpServletRequest.getParameter("C2"),httpServletRequest.getParameter("D2"), httpServletRequest.getParameter("E2"),
				httpServletRequest.getParameter("F2"),httpServletRequest.getParameter("G2"), httpServletRequest.getParameter("H2"),
				httpServletRequest.getParameter("I2"),httpServletRequest.getParameter("J2"));
		
		ExcelDto row3 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 3, httpServletRequest.getParameter("A3"), httpServletRequest.getParameter("B3"), 
				httpServletRequest.getParameter("C3"),httpServletRequest.getParameter("D3"), httpServletRequest.getParameter("E3"),
				httpServletRequest.getParameter("F3"),httpServletRequest.getParameter("G3"), httpServletRequest.getParameter("H3"),
				httpServletRequest.getParameter("I3"),httpServletRequest.getParameter("J3"));
		
		ExcelDto row4 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 4, httpServletRequest.getParameter("A4"), httpServletRequest.getParameter("B4"), 
				httpServletRequest.getParameter("C4"),httpServletRequest.getParameter("D4"), httpServletRequest.getParameter("E4"),
				httpServletRequest.getParameter("F4"),httpServletRequest.getParameter("G4"), httpServletRequest.getParameter("H4"),
				httpServletRequest.getParameter("I4"),httpServletRequest.getParameter("J4"));
		
		ExcelDto row5 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 5, httpServletRequest.getParameter("A5"), httpServletRequest.getParameter("B5"), 
				httpServletRequest.getParameter("C5"),httpServletRequest.getParameter("D5"), httpServletRequest.getParameter("E5"),
				httpServletRequest.getParameter("F5"),httpServletRequest.getParameter("G5"), httpServletRequest.getParameter("H5"),
				httpServletRequest.getParameter("I5"),httpServletRequest.getParameter("J5"));
		
		ExcelDto row6 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 6, httpServletRequest.getParameter("A6"), httpServletRequest.getParameter("B6"), 
				httpServletRequest.getParameter("C6"),httpServletRequest.getParameter("D6"), httpServletRequest.getParameter("E6"),
				httpServletRequest.getParameter("F6"),httpServletRequest.getParameter("G6"), httpServletRequest.getParameter("H6"),
				httpServletRequest.getParameter("I6"),httpServletRequest.getParameter("J6"));
		
		ExcelDto row7 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 7, httpServletRequest.getParameter("A7"), httpServletRequest.getParameter("B7"), 
				httpServletRequest.getParameter("C7"),httpServletRequest.getParameter("D7"), httpServletRequest.getParameter("E7"),
				httpServletRequest.getParameter("F7"),httpServletRequest.getParameter("G7"), httpServletRequest.getParameter("H7"),
				httpServletRequest.getParameter("I7"),httpServletRequest.getParameter("J7"));
		
		ExcelDto row8 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 8, httpServletRequest.getParameter("A8"), httpServletRequest.getParameter("B8"), 
				httpServletRequest.getParameter("C8"),httpServletRequest.getParameter("D8"), httpServletRequest.getParameter("E8"),
				httpServletRequest.getParameter("F8"),httpServletRequest.getParameter("G8"), httpServletRequest.getParameter("H8"),
				httpServletRequest.getParameter("I8"),httpServletRequest.getParameter("J8"));
		
		ExcelDto row9 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 9, httpServletRequest.getParameter("A9"), httpServletRequest.getParameter("B9"), 
				httpServletRequest.getParameter("C9"),httpServletRequest.getParameter("D9"), httpServletRequest.getParameter("E9"),
				httpServletRequest.getParameter("F9"),httpServletRequest.getParameter("G9"), httpServletRequest.getParameter("H9"),
				httpServletRequest.getParameter("I9"),httpServletRequest.getParameter("J9"));
		
		ExcelDto row10 = new ExcelDto(0, Integer.parseInt(httpServletRequest.getParameter("teamNo")), 10, httpServletRequest.getParameter("A10"), httpServletRequest.getParameter("B10"), 
				httpServletRequest.getParameter("C10"),httpServletRequest.getParameter("D10"), httpServletRequest.getParameter("E10"),
				httpServletRequest.getParameter("F10"),httpServletRequest.getParameter("G10"), httpServletRequest.getParameter("H10"),
				httpServletRequest.getParameter("I10"),httpServletRequest.getParameter("J10"));
		
		
		
		System.out.println(row1.getColB());
		
		biz.updateExcel(row1);biz.updateExcel(row2);biz.updateExcel(row3);biz.updateExcel(row4);biz.updateExcel(row5);
		biz.updateExcel(row6);biz.updateExcel(row7);biz.updateExcel(row8);biz.updateExcel(row9);biz.updateExcel(row10);


		return "redirect:shareDocumentList.do";

	}
	
	//엑셀 다운
	@RequestMapping(value = "/excelDown.do", method = RequestMethod.GET)
	public String excelDown(HttpServletRequest httpServletRequest, Locale locale, Model model) {
		logger.info("Excel Down");
		
		model.addAttribute("request", httpServletRequest); 
		biz.downExcel(biz.selectCol(1), model);
		
		return "redirect:shareDocumentList.do";
	}
	
	
	
	
	
	
	
}
