package com.rhymes.app.used.dao;

import java.util.List;
import java.util.Map;

import com.rhymes.app.used.model.ProductsDto;

public interface UsedDao {

	boolean UsedWrite(ProductsDto dto);

	List<ProductsDto> getUsedList();

	ProductsDto getUsedDetail(int seq);
	
}
