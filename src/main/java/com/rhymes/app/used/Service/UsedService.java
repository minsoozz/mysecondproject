package com.rhymes.app.used.Service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.rhymes.app.used.model.ProductsDto;

public interface UsedService {
	public boolean UsedWrite(ProductsDto dto);

}
