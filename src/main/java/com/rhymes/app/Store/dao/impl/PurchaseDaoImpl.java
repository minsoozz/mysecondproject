package com.rhymes.app.Store.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.Store.dao.PurchaseDao;
import com.rhymes.app.Store.model.BasketDto;
import com.rhymes.app.Store.model.BasketListDto;
import com.rhymes.app.Store.model.ProductDto;
import com.rhymes.app.Store.model.StockDto;

@Repository
public class PurchaseDaoImpl implements PurchaseDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "purchase.";
	
	@Override
	public List<ProductDto> getProductList() throws Exception {
		return sqlSession.selectList(ns + "getProductList");
	}

	@Override
	public ProductDto getProductDetail(int p_seq) throws Exception {
		return sqlSession.selectOne(ns + "getProductDetail", p_seq);
	}

	@Override
	public List<StockDto> getSizeList(int p_seq) throws Exception {
		return sqlSession.selectList(ns + "getSizeList", p_seq);
	}

	@Override
	public boolean insertBasket(BasketDto basket) throws Exception {
		int n = sqlSession.insert(ns + "insertBakset", basket);
		return n>0?true:false;
	}

	@Override
	public boolean chkBasket(BasketDto basket) throws Exception {
		int n = sqlSession.selectOne(ns + "chkBasket", basket);
		return n>0?true:false;
	}

	@Override
	public List<BasketListDto> getBasketList(String id) throws Exception {
		return sqlSession.selectList(ns + "getBasketList", id);
	}

	@Override
	public void deleteBasket(int b_seq) throws Exception {
		sqlSession.delete(ns + "deleteBasket", b_seq);
	}

	
	
	
	
}
