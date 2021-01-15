package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.PlaceDto;

public interface PlaceDao {

	String NAMESPACE = "place.";
		
	public int insert(PlaceDto dto);

	public List<PlaceDto> placeSelect();

}
