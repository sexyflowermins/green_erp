package com.green.erp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.erp.repository.ErpRepository;
import com.green.erp.repository.UserRepository;

@Service
public class ErpService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ErpRepository erpRepository;
			
}
