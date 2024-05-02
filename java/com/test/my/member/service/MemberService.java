package com.test.my.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.my.member.dao.IMemberDAO;

@Service
public class MemberService {

	@Autowired
	IMemberDAO dao;
	
}
