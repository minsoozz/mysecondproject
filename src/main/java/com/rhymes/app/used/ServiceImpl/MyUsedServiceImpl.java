package com.rhymes.app.used.ServiceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.used.Service.MyUsedService;
import com.rhymes.app.used.dao.MyUsedDao;
import com.rhymes.app.used.model.NotesDto;

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


	@Override
	public int idcheck(String id) {
		// TODO Auto-generated method stub
		return myUsedDao.idcheck(id);
	}


	@Override
	public boolean sendnotes(NotesDto ndto) {
		
		return myUsedDao.sendnotes(ndto);
	}

	@Override
	public List<NotesDto> getsendnotes(String name) {
		// TODO Auto-generated method stub
		return myUsedDao.getsendnotes(name);
	}


	@Override
	public List<NotesDto> getrecvnotes(String name) {
		// TODO Auto-generated method stub
		return myUsedDao.getrecvnotes(name);
	}


	@Override
	public NotesDto getnotesdetail(String seq) {
		// TODO Auto-generated method stub
		return myUsedDao.getnotesdetail(seq);
	}


	@Override
	public boolean notesdelete(NotesDto ndto) {
		// TODO Auto-generated method stub
		return myUsedDao.notesdelete(ndto);
	}
	
	
	@Override
	public boolean notesdelete2(NotesDto ndto) {
		// TODO Auto-generated method stub
		return myUsedDao.notesdelete2(ndto);
	}
	
}
