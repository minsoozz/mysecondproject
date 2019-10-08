package com.rhymes.app.Store.service;

import java.io.Serializable;
import java.util.List;

import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.ProductParam;

public interface StoreService extends Serializable {
	public List<String> getCompnayList() throws Exception;
	public List<ProductDto> getProductList(ProductParam param) throws Exception;
	public int getProductCnt(ProductParam param) throws Exception;
}
