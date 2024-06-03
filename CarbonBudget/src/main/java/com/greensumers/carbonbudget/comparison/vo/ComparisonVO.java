package com.greensumers.carbonbudget.comparison.vo;

import lombok.Data;

@Data
public class ComparisonVO {

	private String addressId;
	private String gasUsage;
	private String elctrUsage;
	private String useYm;
	
	public String getGasUsage() {
        return gasUsage != null ? gasUsage : "0.0";
    }
	
	public String getElctrUsage() {
        return elctrUsage != null ? elctrUsage : "0.0";
    }
}
