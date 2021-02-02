package com.wv.root.model.biz;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wv.root.model.dao.ShareBoardDao;
import com.wv.root.model.dto.ShareBoardDto;
import com.wv.root.model.util.FileUtils;
import com.wv.root.model.util.SearchCriteria;

@Service
public class ShareBoardBizImpl implements ShareBoardBiz{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private ShareBoardDao dao;

	@Override
	public int write(ShareBoardDto boardDto,MultipartHttpServletRequest mpRequest) {
		// TODO Auto-generated method stub
		int res = dao.write(boardDto);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(boardDto, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
		return res;
	}

	@Override
	public List<ShareBoardDto> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	
	//@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ShareBoardDto selectOne(int bno) {
		// TODO Auto-generated method stub
		dao.SBViews(bno);
		return dao.selectOne(bno);
	}

	@Override
	public int update(ShareBoardDto dto, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) {
		// TODO Auto-generated method stub
		int res = dao.update(dto);
		
		List<Map<String, Object>> list;
		try {
			list = fileUtils.parseUpdateFileInfo(dto, files, fileNames, mpRequest);
			Map<String, Object> tempMap = null;
			int size = list.size();
			for(int i = 0; i<size; i++) {
				tempMap = list.get(i);
				if(tempMap.get("IS_NEW").equals("Y")) {
					dao.insertFile(tempMap);
				}else {
					dao.updateFile(tempMap);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int bno) {
		// TODO Auto-generated method stub
		return dao.delete(bno);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}


}
