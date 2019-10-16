package com.rhymes.app.used.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.used.dao.MyUsedDao;
import com.rhymes.app.used.model.NotesDto;

@Repository
public class MyUsedDaoImpl implements MyUsedDao {
	@Autowired
	SqlSession sqlSession;

	String ns = "MyUsed.";

	@Override
	public List<String> getMemberid(Map<String, Object> map) { // 멤버 아이디를 배열로 가져온다
		List<String> Member = sqlSession.selectList(ns + "getMemberid", map);
		return Member;
	}

	@Override
	public boolean getsubscribe(Map<String, Object> map) {
		int count = sqlSession.selectOne(ns + "getsubscribe", map);
		return count > 0 ? true : false;
	}

	@Override
	public boolean deletesubscribe(Map<String, Object> map) {
		int count = sqlSession.update(ns + "deletesubscribe", map);

		return count > 0 ? true : false;

	}

	@Override
	public boolean addsubscribe(Map<String, Object> map) {
		int count = sqlSession.update(ns + "addsubscribe", map);
		return count > 0 ? true : false;

	}

	@Override
	public int idcheck(String id) {
		int count = sqlSession.selectOne(ns + "idcheck", id);
		return count;
	}

	@Override
	public boolean sendnotes(NotesDto ndto) {
		int count = sqlSession.insert(ns + "sendnotes", ndto);
		return count > 0 ? true : false;
	}



	@Override
	public List<NotesDto> getsendnotes(String name) {
		List<NotesDto> slist = sqlSession.selectList(ns + "getsendnotes", name);
		return slist;
	}

	@Override
	public List<NotesDto> getrecvnotes(String name) {
		List<NotesDto> rlist = sqlSession.selectList(ns + "getrecvnotes", name);
		return rlist;
	}

	@Override
	public NotesDto getnotesdetail(String seq) {
		NotesDto ndto = sqlSession.selectOne(ns + "getnotesdetail", seq);
		
		return ndto;
	}

	@Override
	public boolean notesdelete(NotesDto ndto) {
		int count = sqlSession.update(ns + "notesdelete", ndto);
		
		return count > 0 ? true : false;
	}
	
	@Override
	public boolean notesdelete2(NotesDto ndto) {
		int count = sqlSession.update(ns + "notesdelete2", ndto);
		
		return count > 0 ? true : false;
	}
	
}
