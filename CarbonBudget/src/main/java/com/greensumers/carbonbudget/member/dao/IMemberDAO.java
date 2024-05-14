package com.greensumers.carbonbudget.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.greensumers.carbonbudget.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	// 회원 가입
	public int registMember(MemberVO vo);
	// 회원 수정
	public int updateMember(MemberVO vo);
	// 로그인
	public MemberVO loginMember(MemberVO vo);
	// 닉네임 중복 체크
	public int aliasCheck(MemberVO vo);
}
