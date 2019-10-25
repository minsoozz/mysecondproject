package com.rhymes.app.admin.main.dao;

import java.io.Serializable;

import com.rhymes.app.admin.main.model.MainResourceDto;

public interface AdminMainResourceDao extends Serializable{

	public MainResourceDto getmainresource() throws Exception;
	public boolean updatemainresource(MainResourceDto resource) throws Exception;
	public boolean updatemaintext(MainResourceDto resource) throws Exception;
}
