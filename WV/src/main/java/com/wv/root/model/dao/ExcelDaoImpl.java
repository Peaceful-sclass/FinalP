package com.wv.root.model.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.wv.root.model.dto.ExcelDto;

@Repository
public class ExcelDaoImpl implements ExcelDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<ExcelDto> selectCol(int teamno) {
		List<ExcelDto> list = new ArrayList<ExcelDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectRow", teamno);
		} catch (Exception e) {
			System.out.println("[error]: selectCol");
			e.printStackTrace();
		}
		System.out.println("list값: " + list);
		
		return list;
	}


	@Override
	public int insertExcel(ExcelDto dto) {
		int res = 0;
		System.out.println("dto값 확인"+dto);
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertExcel", dto);
			
		} catch (Exception e) {
			System.out.println("[error]: insertExcel");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public ExcelDto selectRow(ExcelDto dto) {
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectRowOne", dto);
			
		} catch (Exception e) {
			System.out.println("[error]: selectExcelOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateExcel(ExcelDto dto) {
		int res = 0;
		System.out.println("dto값 확인"+dto.getColA()+dto.getColB());
		
		try {
			res=sqlSession.update(NAMESPACE+"updateExcel", dto);
		} catch (Exception e) {
			System.out.println("[error]: updateExcel");
			e.printStackTrace();
		}
		
		System.out.println("update값 확인 "+dto.getColA()+" "+dto.getColB()+" "+dto.getColC());
		
		return res;
	}


	
	@Override
	public int downExcel(List<ExcelDto> dto, Model model) {
		@SuppressWarnings("resource")
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet();
		
		sheet.setColumnWidth(0, 2560);
		sheet.setColumnWidth(1, 2560);
		
		for(int i=0; i<10; i++) {
			Row row = sheet.createRow(i);
			row.createCell(0).setCellValue(dto.get(i).getColA());
			row.createCell(1).setCellValue(dto.get(i).getColB());
			row.createCell(2).setCellValue(dto.get(i).getColC());
			row.createCell(3).setCellValue(dto.get(i).getColD());
			row.createCell(4).setCellValue(dto.get(i).getColE());
			row.createCell(5).setCellValue(dto.get(i).getColF());
			row.createCell(6).setCellValue(dto.get(i).getColG());
			row.createCell(7).setCellValue(dto.get(i).getColH());
			row.createCell(8).setCellValue(dto.get(i).getColI());
			row.createCell(9).setCellValue(dto.get(i).getColJ());
		}
		
		
		
		File file = new File("C:\\Users\\user\\Desktop\\excel.xlsx");
		try {
			file.createNewFile();
			FileOutputStream outputStream = new FileOutputStream(file, false);
			wb.write(outputStream);
			outputStream.close();
		} catch (IOException e) {
			System.out.println("ExcelDown Error");
			e.printStackTrace();
		}

		
		return 1;
	}











	

}
