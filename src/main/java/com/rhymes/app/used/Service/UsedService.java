package com.rhymes.app.used.Service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.rhymes.app.used.model.ProductsDto;

public interface UsedService {
	public boolean UsedWrite(ProductsDto dto);

	public List<ProductsDto> getUsedList();

	public ProductsDto getUsedDetail(int seq);

}
