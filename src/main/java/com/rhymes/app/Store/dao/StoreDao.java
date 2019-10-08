package com.rhymes.app.Store.dao;

import java.io.Serializable;
import java.util.List;

import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.ProductParam;
import com.rhymes.app.Store.model.category.Category2Dto;

public interface StoreDao extends Serializable {

	public List<String> getCompanyList() throws Exception;
	public List<Category2Dto> getCate2List(Category2Dto dto) throws Exception;
	// 상품 리스트
	public List<ProductDto> getProductList(ProductParam param) throws Exception;
	// 리스트 상품갯수 
	public int getProductCnt(ProductParam param) throws Exception;
	
}
