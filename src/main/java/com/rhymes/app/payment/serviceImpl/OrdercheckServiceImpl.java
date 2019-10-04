package com.rhymes.app.payment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.payment.dao.OrdercheckDAO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.service.OrdercheckService;

@Service
public class OrdercheckServiceImpl implements OrdercheckService {
	
	@Autowired
	OrdercheckDAO OrdercheckDao;

	@Override
	public List<PaymentDTO> getOrdercheck() {
		return OrdercheckDao.getOrdercheck();
	}

}
