package com.greensumers.carbonbudget.comparison.dao;

import org.apache.ibatis.annotations.Mapper;

import com.greensumers.carbonbudget.comparison.vo.ComparisonVO;

@Mapper
public interface IComparisonDAO {

	// 사용정보 불러오기
	public ComparisonVO checkInUsageData(ComparisonVO vo);
}
