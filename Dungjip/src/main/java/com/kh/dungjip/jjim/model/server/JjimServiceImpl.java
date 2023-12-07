package com.kh.dungjip.jjim.model.server;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.jjim.model.dao.JjimDao;

@Service
public class JjimServiceImpl implements JjimService{

	@Autowired
	private JjimDao jjimDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
