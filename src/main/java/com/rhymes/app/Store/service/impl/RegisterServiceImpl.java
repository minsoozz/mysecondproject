package com.rhymes.app.Store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.Store.dao.RegisterDao;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.StockDto;
import com.rhymes.app.Store.model.category.Category1Dto;
import com.rhymes.app.Store.model.category.Category2Dto;
import com.rhymes.app.Store.model.category.Category3Dto;
import com.rhymes.app.Store.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	RegisterDao register;
	
	@Override
	public List<Category2Dto> getCate2List(int c1_seq) throws Exception {
		return register.getCate2List(c1_seq);
	}

	@Override
	public List<Category3Dto> getCate3List(int c2_seq) throws Exception {
		return register.getCate3List(c2_seq);
	}

	@Override
	public int getPseq() throws Exception {
		return register.getPseq();
	}

	@Override
	public boolean insertProduct(ProductDto product) throws Exception {
		return register.insertProduct(product);
	}

	@Override
	public boolean insertStock(StockDto stock) throws Exception {
		return register.insertStock(stock);
	}

	@Override
	public String getSizeunit(int c2_seq) throws Exception {
		return register.getSizeunit(c2_seq);
	}

	
	


}
