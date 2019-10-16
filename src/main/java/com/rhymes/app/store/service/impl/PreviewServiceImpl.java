package com.rhymes.app.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.store.dao.PreviewDao;
import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PreviewDto;
import com.rhymes.app.store.service.PreviewService;

@Service
public class PreviewServiceImpl implements PreviewService {

	@Autowired
	private PreviewDao PreviewDao;
	
	//preview list
	@Override
	public List<PreviewDto> getPreviewList(DetailParam param) {
		
		return PreviewDao.getPreviewList(param);
	}

	//preview count
	@Override
	public int getPreviewCount(DetailParam param) {
		
		return PreviewDao.getPreviewCount(param);
	}

}
