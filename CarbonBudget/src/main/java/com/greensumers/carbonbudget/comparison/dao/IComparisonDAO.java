package com.greensumers.carbonbudget.comparison.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greensumers.carbonbudget.comparison.vo.ComparisonVO;

@Mapper
public interface IComparisonDAO {

	// 사용자 정보 불러오기
	public List<ComparisonVO> checkInUsageData(ComparisonVO vo);
	
	// 전체 사용자 정보 불러오기
	public List<ComparisonVO> userData(ComparisonVO vo);
}
