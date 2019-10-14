package com.rhymes.app.used.dao;

import java.util.List;
import java.util.Map;

public interface MyUsedDao {

	List<String>getMemberid(Map<String, Object> map);

	boolean getsubscribe(Map<String, Object> map);

	boolean deletesubscribe(Map<String, Object> map);

	boolean addsubscribe(Map<String, Object> map);

}
