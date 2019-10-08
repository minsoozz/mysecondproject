package com.rhymes.app.Store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.Store.dao.StoreDao;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.ProductParam;
import com.rhymes.app.Store.service.StoreService;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao store;
	
	@Override
	public List<String> getCompnayList() throws Exception {
		return store.getCompanyList();
	}

	@Override
	public List<ProductDto> getProductList(ProductParam param) throws Exception {
		return store.getProductList(param);
	}

	@Override
	public int getProductCnt(ProductParam param) throws Exception {
		return store.getProductCnt(param);
	}

	
}
