package com.rhymes.app.Store.dao;

import java.io.Serializable;
import java.util.List;

import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.SizeunitDto;
import com.rhymes.app.Store.model.StockDto;
import com.rhymes.app.Store.model.category.Category1Dto;
import com.rhymes.app.Store.model.category.Category2Dto;
import com.rhymes.app.Store.model.category.Category3Dto;
import com.rhymes.app.member.model.SellerDTO;

public interface RegisterDao extends Serializable {

	
	public List<Category2Dto> getCate2List(int c1_seq) throws Exception;
	public List<Category3Dto> getCate3List(int c2_seq) throws Exception;
	
	public int getPseq() throws Exception;
	
	public boolean insertProduct(ProductDto product) throws Exception;
	public boolean insertStock(StockDto stock) throws Exception;
	
	public String getSizeunit(int c2_seq) throws Exception;
	
	public SellerDTO getCname(SellerDTO seller) throws Exception;
	
	
	
}
