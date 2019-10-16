package com.rhymes.app.used.dao;

import java.util.List;
import java.util.Map;

import com.rhymes.app.used.model.NotesDto;

public interface MyUsedDao {

	List<String>getMemberid(Map<String, Object> map);

	boolean getsubscribe(Map<String, Object> map);

	boolean deletesubscribe(Map<String, Object> map);

	boolean addsubscribe(Map<String, Object> map);

	int idcheck(String id);

	boolean sendnotes(NotesDto ndto);

	List<NotesDto> getsendnotes(String name);

	List<NotesDto> getrecvnotes(String name);

	NotesDto getnotesdetail(Map<String, Object> map);

	boolean notesdelete(NotesDto ndto);

	boolean notesdelete2(NotesDto ndto);

}
