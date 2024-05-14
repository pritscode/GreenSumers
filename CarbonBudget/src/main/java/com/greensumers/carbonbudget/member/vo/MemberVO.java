package com.greensumers.carbonbudget.member.vo;

import lombok.Data;

@Data
public class MemberVO {	
	private String memId;
	private String memPw;
	private String memNm;
	private String memAls;
	private String useYn;
	private String memTel;
	private String memLotnoAddr;
	private String memKornRoadNm;
	private String memAddrId;
	private String memDtlAddr;
	private String memExtAddr;
	private String memEmail;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getMemAls() {
		return memAls;
	}
	public void setMemAls(String memAls) {
		this.memAls = memAls;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemLotnoAddr() {
		return memLotnoAddr;
	}
	public void setMemLotnoAddr(String memLotnoAddr) {
		this.memLotnoAddr = memLotnoAddr;
	}
	public String getMemKornRoadNm() {
		return memKornRoadNm;
	}
	public void setMemKornRoadNm(String memKornRoadNm) {
		this.memKornRoadNm = memKornRoadNm;
	}
	public String getMemAddrId() {
		return memAddrId;
	}
	public void setMemAddrId(String memAddrId) {
		this.memAddrId = memAddrId;
	}
	public String getMemDtlAddr() {
		return memDtlAddr;
	}
	public void setMemDtlAddr(String memDtlAddr) {
		this.memDtlAddr = memDtlAddr;
	}
	public String getMemExtAddr() {
		return memExtAddr;
	}
	public void setMemExtAddr(String memExtAddr) {
		this.memExtAddr = memExtAddr;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + ", memAls=" + memAls + ", useYn="
				+ useYn + ", memTel=" + memTel + ", memLotnoAddr=" + memLotnoAddr + ", memKornRoadNm=" + memKornRoadNm
				+ ", memAddrId=" + memAddrId + ", memDtlAddr=" + memDtlAddr + ", memExtAddr=" + memExtAddr
				+ ", memEmail=" + memEmail + "]";
	}
	
	
	
}
