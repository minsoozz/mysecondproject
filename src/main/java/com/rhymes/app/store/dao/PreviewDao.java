package com.rhymes.app.store.dao;

import java.util.List;

import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PreviewDto;

public interface PreviewDao {

	//Preview list가져오기
	public List<PreviewDto> getPreviewList(DetailParam param);
	
	//Preview count
	public int getPreviewCount(DetailParam param);
}