package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.PlaceDao;
import com.wv.root.model.dto.PlaceDto;
import com.wv.root.model.dto.Place_commentDto;
import com.wv.root.model.dto.Place_likeDto;

@Service
public class PlaceBizImpl implements PlaceBiz{
	
	@Autowired
	private PlaceDao dao; 
	
	@Override
	public int insert(PlaceDto dto) {
		return dao.insert(dto);
	}

	@Override
	public List<PlaceDto> placeSelect() {		
		return dao.placeSelect();
	}

	@Override
	public PlaceDto placeDetail(int pno) {
		return dao.placeDetail(pno);
	}

	@Override
	public int likecheck(Place_likeDto dto) {
		return dao.likecheck(dto);
	}

	@Override
	public int likeinsert(Place_likeDto dto) {
		int res = dao.likeinsert(dto);
		if(res>0) {
			dao.likeup(dto.getPno());
		}
		return res;
	}

	@Override
	public int likecancel(Place_likeDto dto) {
		int res = dao.likecancel(dto);
		if(res>0) {
			dao.likedown(dto.getPno());
		}
		return res;
	}

	@Override
	public int likeupdate(Place_likeDto dto) {
		int res = dao.likeupdate(dto);
		if(res>0) {
			dao.likeup(dto.getPno());
		}
		return res;
	}

	@Override
	public int commentinsert(Place_commentDto dto) {
		return dao.commentinsert(dto);
	}

	@Override
	public List<Place_commentDto> pcommentlist(int pno) {
		return dao.pcommentlist(pno);
	}

	@Override
	public int commentupdate(Place_commentDto dto) {
		return dao.commentupdate(dto);
	}

	@Override
	public int commentdelete(int pcno) {
		return dao.commentdelete(pcno);
	}

	@Override
	public int deletePlace(int pno) {
		return dao.deletePlace(pno);
	}

	@Override
	public int updatePlace(PlaceDto dto) {
		return dao.updatePlace(dto);
	}

}
