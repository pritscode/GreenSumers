package com.greensumers.carbonbudget.commons.utils;

import java.text.ParseException;
import java.util.List;

import com.greensumers.carbonbudget.comparison.vo.ComparisonVO;

public class CarbonCalculator {
	
	public static double calculateGasRate(List<ComparisonVO> userCheckIn, List<ComparisonVO> totalData) throws ParseException {
		if (userCheckIn.isEmpty() || totalData.isEmpty()) {
			throw new IllegalArgumentException("The lists must not be empty.");
		}
		
		ComparisonVO lastUserData = userCheckIn.get(userCheckIn.size() - 1);
		ComparisonVO lastTotalData = totalData.get(totalData.size() - 1);
		
		double gasRate = lastUserData.getGasUsage()/lastTotalData.getGasUsage()*100;
		
		if (gasRate == 0) {
			throw new IllegalArgumentException("Rate must not be zero.");
		}
		
		java.text.DecimalFormat df = new java.text.DecimalFormat("#.0");
		
		return df.parse(df.format(gasRate)).doubleValue();
	}
	
	public static double calculateElctrRate(List<ComparisonVO> userCheckIn, List<ComparisonVO> totalData) throws ParseException {
		if (userCheckIn.isEmpty() || totalData.isEmpty()) {
			throw new IllegalArgumentException("The lists must not be empty.");
		}
		
		ComparisonVO lastUserData = userCheckIn.get(userCheckIn.size() - 1);
		ComparisonVO lastTotalData = totalData.get(totalData.size() - 1);
		
		double elctrRate = lastUserData.getElctrUsage()/lastTotalData.getElctrUsage()*100;
		
		if (elctrRate == 0) {
			throw new IllegalArgumentException("Rate must not be zero.");
		}
		
		java.text.DecimalFormat df = new java.text.DecimalFormat("#.0");
		
		return df.parse(df.format(elctrRate)).doubleValue();
	}
	
	public static double calculateCarbonRate(List<ComparisonVO> userCheckIn, List<ComparisonVO> totalData) throws ParseException {
        if (userCheckIn.isEmpty() || totalData.isEmpty()) {
            throw new IllegalArgumentException("The lists must not be empty.");
        }

        ComparisonVO lastUserData = userCheckIn.get(userCheckIn.size() - 1);
        ComparisonVO lastTotalData = totalData.get(totalData.size() - 1);

        double carbonRate = lastUserData.getEmissions()/lastTotalData.getEmissions()*100;

        if (carbonRate == 0) {
            throw new IllegalArgumentException("Rate must not be zero.");
        }
        
        java.text.DecimalFormat df = new java.text.DecimalFormat("#.0");
        
        return df.parse(df.format(carbonRate)).doubleValue();
    }
}
