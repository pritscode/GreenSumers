package com.greensumers.carbonbudget.commons.utils;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.greensumers.carbonbudget.comparison.service.ComparisonService;
import com.greensumers.carbonbudget.comparison.vo.ComparisonVO;

public class CarbonCalculator {
	
	public static double elctrCarbon(double data) {
		double elctrCarbonEmissions = data*0.4781;
		
		java.text.DecimalFormat df = new java.text.DecimalFormat("#.0");
		
		// 포맷팅된 결과를 다시 double 타입으로 변환
        try {
            return df.parse(df.format(elctrCarbonEmissions)).doubleValue();
        } catch (ParseException e) {
            e.printStackTrace();
            return 0.0; // 파싱에 실패한 경우 0.0 반환 (필요시 다른 예외 처리 로직으로 변경 가능)
        }
	}
	
	public static double gasCarbon(double data) {
		double gasCarbonEmissions = data*2.176;
		
		java.text.DecimalFormat df = new java.text.DecimalFormat("#.0");
		
		try {
			return df.parse(df.format(gasCarbonEmissions)).doubleValue();
		} catch (ParseException e) {
			e.printStackTrace();
			return 0.0;
		}
		
	}
	
	public static double calculatingCarbon(double gasData, double elctrData) throws Exception {
		double result = gasData + elctrData;
		return result;
	}
	
	public static double calculateCarbonRate(List<ComparisonVO> userCheckIn, List<ComparisonVO> totalData) {
        if (userCheckIn.isEmpty() || totalData.isEmpty()) {
            throw new IllegalArgumentException("The lists must not be empty.");
        }

        ComparisonVO lastUserData = userCheckIn.get(userCheckIn.size() - 1);
        ComparisonVO lastTotalData = totalData.get(totalData.size() - 1);

        double carbonRate = lastUserData.getEmissions()/lastTotalData.getEmissions();

        if (carbonRate == 0) {
            throw new IllegalArgumentException("Total emissions must not be zero.");
        }
        
        System.out.println(carbonRate);

        return carbonRate;
    }
}
