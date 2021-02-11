package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.PlaceDto;
import com.wv.root.model.dto.Place_commentDto;
import com.wv.root.model.dto.Place_likeDto;

public interface PlaceBiz {
	public int insert(PlaceDto dto);
	public List<PlaceDto> placeSelect();
	public PlaceDto placeDetail(int pno);
	public int likecheck(Place_likeDto dto);
	public int likeinsert(Place_likeDto dto);
	public int likecancel(Place_likeDto dto);
	public int likeupdate(Place_likeDto dto);
	public int commentinsert(Place_commentDto dto);
	public List<Place_commentDto> pcommentlist(int pno);
	public int commentupdate(Place_commentDto dto);
	public int commentdelete(int pcno);
	public int deletePlace(int pno);
	public int updatePlace(PlaceDto dto);
	public List<PlaceDto> placecate(PlaceDto dto);
}
