package com.rhymes.app.admin.main.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.main.dao.AdminMainResourceDao;
import com.rhymes.app.admin.main.model.MainResourceDto;
import com.rhymes.app.admin.main.service.AdminMainService;

@Service
public class AdminMainServiceImpl implements AdminMainService {

	@Autowired AdminMainResourceDao resourceDao;
	
	@Override
	public MainResourceDto getmainresource() throws Exception {
		return resourceDao.getmainresource();
	}

	@Override
	public boolean updatemainresource(MainResourceDto resource) throws Exception {
		return resourceDao.updatemainresource(resource);
	}

}
