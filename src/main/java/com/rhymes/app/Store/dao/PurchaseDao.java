package com.rhymes.app.Store.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.rhymes.app.Store.model.BasketDto;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.StockDto;

public interface PurchaseDao extends Serializable {

	public List<ProductDto> getProductList() throws Exception;
	public ProductDto getProductDetail(int p_seq) throws Exception;
	public List<StockDto> getSizeList(int p_seq) throws Exception;
	public boolean insertBasket(BasketDto basket) throws Exception; 

}
