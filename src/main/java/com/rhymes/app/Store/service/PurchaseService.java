package com.rhymes.app.Store.service;

import java.util.List;

import com.rhymes.app.Store.model.BasketDto;
import com.rhymes.app.Store.model.BasketListDto;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.StockDto;

public interface PurchaseService {

	public List<ProductDto> getProductList() throws Exception;
	public ProductDto getProductDetail(int p_seq) throws Exception;
	public List<StockDto> getSizeList(int p_seq) throws Exception;
	public boolean insertBasket(BasketDto basket) throws Exception;
	public boolean chkBasket(BasketDto basket) throws Exception;
	public List<BasketListDto> getBasketList(String id) throws Exception;
	public void deleteBasket(int b_seq) throws Exception;
}
