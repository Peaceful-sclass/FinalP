package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.PlaceDto;

public interface PlaceBiz {
	public int insert(PlaceDto dto);
	public List<PlaceDto> placeSelect();
}
