package com.rhymes.app.Store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.Store.dao.PurchaseDao;
import com.rhymes.app.Store.model.BasketDto;
import com.rhymes.app.Store.model.BasketListDto;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.StockDto;
import com.rhymes.app.Store.model.WishlistDto;
import com.rhymes.app.Store.service.PurchaseService;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	PurchaseDao purchase;
	
	@Override
	public ProductDto getProductDetail(int p_seq) throws Exception {
		return purchase.getProductDetail(p_seq);
	}

	@Override
	public List<StockDto> getSizeList(int p_seq) throws Exception {
		return purchase.getSizeList(p_seq);
	}

	@Override
	public boolean insertBasket(BasketDto basket) throws Exception {
		return purchase.insertBasket(basket);
	}

	@Override
	public boolean chkBasket(BasketDto basket) throws Exception {
		return purchase.chkBasket(basket);
	}

	@Override
	public List<BasketListDto> getBasketList(String id) throws Exception {
		return purchase.getBasketList(id);
	}

	@Override
	public void deleteBasket(int b_seq) throws Exception {
		purchase.deleteBasket(b_seq);
	}

	@Override
	public int updateBaksetQ(BasketDto basket) throws Exception {
		return purchase.updateBaksetQ(basket);
	}

	@Override
	public int deleteBasektAll(BasketDto basket) throws Exception {
		return purchase.deleteBasektAll(basket);
	}

	@Override
	public boolean insertWishlist(WishlistDto wish) throws Exception {
		return purchase.insertWishlist(wish);
	}

	@Override
	public boolean chkWishlist(WishlistDto wish) throws Exception {
		return purchase.chkWishlist(wish);
	}

	@Override
	public boolean deleteWishlist(WishlistDto wish) throws Exception {
		return purchase.deleteWishlist(wish);
	}
}
