package com.rhymes.app.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.common.dao.CommonDAO;
import com.rhymes.app.common.service.CommonService;
import com.rhymes.app.member.model.AuthoritiesDTO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDAO commondao;

	
}
