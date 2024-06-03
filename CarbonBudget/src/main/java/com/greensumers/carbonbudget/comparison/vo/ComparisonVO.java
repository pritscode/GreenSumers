package com.greensumers.carbonbudget.comparison.vo;

import lombok.Data;

@Data
public class ComparisonVO {

	private String addressId;
	private Double gasUsage;
	private Double elctrUsage;
	private String useYm;
	private Double emissions;
	
	public Double getGasUsage() {
        return gasUsage != null ? gasUsage : 0.0;
    }
	
	public Double getElctrUsage() {
        return elctrUsage != null ? elctrUsage : 0.0;
    }
}
