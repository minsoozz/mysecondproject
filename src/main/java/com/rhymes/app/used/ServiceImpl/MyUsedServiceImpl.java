package com.rhymes.app.used.ServiceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.used.Service.MyUsedService;
import com.rhymes.app.used.dao.MyUsedDao;

@Service
public class MyUsedServiceImpl implements MyUsedService {
	@Autowired MyUsedDao myUsedDao;
	
	
	@Override
	public List<String> getMemberid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.getMemberid(map);
	}


	@Override
	public boolean getsubscribe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.getsubscribe(map);
	}


	@Override
	public boolean deletesubscribe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.deletesubscribe(map);
	}


	@Override
	public boolean addsubscribe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myUsedDao.addsubscribe(map);
	}

}
