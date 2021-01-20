package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.PlaceDto;
import com.wv.root.model.dto.Place_likeDto;

public interface PlaceDao {

	String NAMESPACE = "place.";
	String NAMESPACE2 = "like.";
		
	public int insert(PlaceDto dto);

	public List<PlaceDto> placeSelect();

	public PlaceDto placeDetail(int pno);

	public int likecheck(Place_likeDto dto);

	public int likeinsert(Place_likeDto dto);

	public int likeup(int pno);
	
	public int likedown(int pno);

	public int likecancel(Place_likeDto dto);

	public int likeupdate(Place_likeDto dto);

	

}
