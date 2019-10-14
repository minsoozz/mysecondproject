package com.rhymes.app.used.Service;

import java.util.List;
import java.util.Map;

public interface MyUsedService {

	List<String> getMemberid(Map<String, Object> map);

	boolean getsubscribe(Map<String, Object> map);

	boolean deletesubscribe(Map<String, Object> map);

	boolean addsubscribe(Map<String, Object> map);

}
