package com.greensumers.carbonbudget.comparison.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greensumers.carbonbudget.comparison.dao.IComparisonDAO;
import com.greensumers.carbonbudget.comparison.vo.ComparisonVO;

@Service
public class ComparisonService {

	@Autowired
	IComparisonDAO dao;
	
	// 사용량조회
	public ComparisonVO checkInUsageData(ComparisonVO vo) {
		return dao.checkInUsageData(vo);
	}
	
}
