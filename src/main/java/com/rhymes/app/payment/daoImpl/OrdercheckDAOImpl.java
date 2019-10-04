package com.rhymes.app.payment.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.payment.dao.OrdercheckDAO;
import com.rhymes.app.payment.model.PaymentDTO;

@Repository
public class OrdercheckDAOImpl implements OrdercheckDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private String p = "payment.";

	@Override
	public List<PaymentDTO> getOrdercheck() {
		
		List<PaymentDTO> ordercheck_list = sqlsession.selectList(p + "getOrdercheck");
		
		return ordercheck_list;
	}

}
