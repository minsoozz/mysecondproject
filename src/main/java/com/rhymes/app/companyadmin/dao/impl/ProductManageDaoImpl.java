package com.rhymes.app.companyadmin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.companyadmin.dao.ProductManageDao;
import com.rhymes.app.companyadmin.model.ProductManageDto;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;

@Repository
public class ProductManageDaoImpl implements ProductManageDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "productmanage.";

// 1. 상품등록	
	@Override
	public List<Category2Dto> getCate2List(int c1_seq) throws Exception {
		return sqlSession.selectList(ns + "getCate2List", c1_seq);
	}

	@Override
	public List<Category3Dto> getCate3List(int c2_seq) throws Exception {
		return sqlSession.selectList(ns + "getCate3List", c2_seq);
	}

	@Override
	public int getPseq() throws Exception {
		return sqlSession.selectOne(ns + "getPseq");
	}

	@Override
	public boolean insertProduct(ProductDto product) throws Exception {
		int n = sqlSession.insert(ns + "insertProduct", product);
		return n>0?true:false;
	}

	@Override
	public boolean insertStock(StockDto stock) throws Exception {
		int n = sqlSession.insert(ns + "insertStock", stock);
		return n>0?true:false;
	}

	@Override
	public String getSizeunit(int c2_seq) throws Exception {
		return sqlSession.selectOne(ns + "getSizeunit", c2_seq);
	}

	@Override
	public SellerDTO getCname(SellerDTO seller) throws Exception {
		return sqlSession.selectOne(ns + "getCname", seller);
	}
	
//2.상품조회	
	@Override
	public List<ProductDto> getProductList(ProductManageDto pParam) throws Exception {
		return sqlSession.selectList(ns + "getAdminProductList", pParam); 
	}

	@Override
	public int getProductCnt(ProductManageDto pParam) throws Exception {
		return sqlSession.selectOne(ns + "getAdminProductCnt", pParam);
	}
	//stocklist
	@Override
	public List<StockDto> getStockList(StockDto stock) throws Exception {
		return sqlSession.selectList(ns + "getAdminStockList", stock);
	}

	// 상품 기본정보 수정
	@Override
	public boolean productBasicInfoUpdate(ProductDto product) throws Exception {
		int n = sqlSession.update(ns + "cAdminProductBasicinfoUpdate", product);
		return n>0?true:false;
	}

	@Override
	public boolean productImgUpdate(ProductDto product) throws Exception {
		int n = sqlSession.update(ns + "cAdminProductImgUpdate", product);
		return n>0?true:false;
	}

	@Override
	public boolean productSalePriceUpdate(ProductDto product) throws Exception {
		int n = sqlSession.update(ns + "cAdminProductSalePriceUpdate", product);
		return n>0?true:false;
	}

	@Override
	public boolean productSalePriceUpdateCancel(ProductDto product) throws Exception {
		int n = sqlSession.update(ns + "cAdminProductSalePriceUpdateCancel", product);
		return false;
	}

	
	
	
}
