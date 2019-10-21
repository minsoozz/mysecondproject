package com.rhymes.app.companyadmin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.companyadmin.dao.ProductManageDao;
import com.rhymes.app.companyadmin.model.ProductManageDto;
import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;

@Service
public class ProductManageServiceImpl implements ProductManageService {

	@Autowired
	ProductManageDao manage;

// 1.상품등록	
	@Override
	public List<Category2Dto> getCate2List(int c1_seq) throws Exception {
		return manage.getCate2List(c1_seq);
	}

	@Override
	public List<Category3Dto> getCate3List(int c2_seq) throws Exception {
		return manage.getCate3List(c2_seq);
	}

	@Override
	public int getPseq() throws Exception {
		return manage.getPseq();
	}

	@Override
	public boolean insertProduct(ProductDto product) throws Exception {
		return manage.insertProduct(product);
	}

	@Override
	public boolean insertStock(StockDto stock) throws Exception {
		return manage.insertStock(stock);
	}

	@Override
	public String getSizeunit(int c2_seq) throws Exception {
		return manage.getSizeunit(c2_seq);
	}

	@Override
	public SellerDTO getCname(SellerDTO seller) throws Exception {
		return manage.getCname(seller);
	}

// 2.상품조회
	@Override
	public List<ProductDto> getProductList(ProductManageDto pParam) throws Exception {
		return manage.getProductList(pParam);
	}

	@Override
	public int getProductCnt(ProductManageDto pParam) throws Exception {
		return manage.getProductCnt(pParam);
	}

	@Override
	public List<StockDto> getStockList(StockDto stock) throws Exception {
		return manage.getStockList(stock);
	}

	@Override
	public boolean productBasicInfoUpdate(ProductDto product) throws Exception {
		return manage.productBasicInfoUpdate(product);
	}

	@Override
	public boolean productImgUpdate(ProductDto product) throws Exception {
		return manage.productImgUpdate(product);
	}

	@Override
	public boolean productSalePriceUpdate(ProductDto product) throws Exception {
		return manage.productSalePriceUpdate(product);
	}

	
	
}
