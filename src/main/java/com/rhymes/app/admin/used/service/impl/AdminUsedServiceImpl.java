package com.rhymes.app.admin.used.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.used.dao.AdminUsedDao;
import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.admin.used.service.AdminUsedService;
import com.rhymes.app.used.model.ProductsDto;

@Service
public class AdminUsedServiceImpl implements AdminUsedService {

	@Autowired
	AdminUsedDao adminUsedDao;
	
	@Override
	public List<ProductsDto> getAdminUsedlist(ProductsDto pDto) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminUsedlist(pDto);
	}

	@Override
	public int getAdminBbsCount(AdminBbsParam adparam) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminBbsCount(adparam);
	}
	
	
}
