package com.rhymes.app.used.ServiceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.used.Service.UsedService;
import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.ProductsDto;

@Service
public class UsedServiceImpl implements UsedService {
	@Autowired UsedDao usedDao;

	@Override
	public boolean UsedWrite(ProductsDto dto) {
		// TODO Auto-generated method stub
		return usedDao.UsedWrite(dto);
	}

	@Override
	public List<ProductsDto> getUsedList() {
		// TODO Auto-generated method stub
		return usedDao.getUsedList();
	}

	@Override
	public ProductsDto getUsedDetail(int seq) {
		// TODO Auto-generated method stub
		return usedDao.getUsedDetail(seq);
	}
	
	
}
