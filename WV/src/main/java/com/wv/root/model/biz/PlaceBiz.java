package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.PlaceDto;
import com.wv.root.model.dto.Place_likeDto;

public interface PlaceBiz {
	public int insert(PlaceDto dto);
	public List<PlaceDto> placeSelect();
	public PlaceDto placeDetail(int pno);
	public int likecheck(Place_likeDto dto);
	public int likeinsert(Place_likeDto dto);
	public int likecancel(Place_likeDto dto);
	public int likeupdate(Place_likeDto dto);
}
