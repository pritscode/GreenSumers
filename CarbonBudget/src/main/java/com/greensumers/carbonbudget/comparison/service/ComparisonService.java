package com.greensumers.carbonbudget.comparison.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greensumers.carbonbudget.comparison.dao.IComparisonDAO;
import com.greensumers.carbonbudget.comparison.vo.ComparisonVO;

@Service
public class ComparisonService {

	@Autowired
	IComparisonDAO dao;
	
	// 사용자 사용량조회
	public List<ComparisonVO> checkInUsageData(ComparisonVO vo) {
		return dao.checkInUsageData(vo);
	}
	
	// 전체 사용자 사용량 조회
	public List<ComparisonVO> userData(ComparisonVO vo) {
		return dao.userData(vo);
	}
	
}
