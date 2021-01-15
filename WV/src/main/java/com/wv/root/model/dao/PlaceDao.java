package com.wv.root.model.dao;

import com.wv.root.model.dto.PlaceDto;

public interface PlaceDao {

	String NAMESPACE = "place.";
		
	int insert(PlaceDto dto);

}
