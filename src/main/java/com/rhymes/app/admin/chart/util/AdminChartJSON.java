package com.rhymes.app.admin.chart.util;

import java.util.List;

import com.rhymes.app.admin.chart.model.AdminChartDTO;

public class AdminChartJSON {
	AdminChartplus0 minus = new AdminChartplus0();

	public String jsonchangmonthPrice(List<AdminChartDTO> list) {
		//list -> json : 월별 총 매출
		String jsonmonth = "";
		for(AdminChartDTO a : list){
			jsonmonth += a.getY() + ", ";
		}
		jsonmonth = jsonmonth.substring(0, jsonmonth.lastIndexOf(","));
		//맨 끝에 ,만 빼고 다 가져와라
		jsonmonth += "";
		
		return jsonmonth;
	}
	
	public String jsonchangmonthNum(List<AdminChartDTO> list) {
		//list -> json : 월별 총 판매 상품 개수
		String jsonmonth = "";
		for(AdminChartDTO a : list){
			jsonmonth += a.getY() + ", ";
		}
		jsonmonth = jsonmonth.substring(0, jsonmonth.lastIndexOf(","));
		//맨 끝에 ,만 빼고 다 가져와라
		jsonmonth += "";

		return jsonmonth;
	}
	
	public String jsonchangday(List<AdminChartDTO> list) {
		//list -> json : 일별 통계
		String jsonday = "[";
		for(AdminChartDTO a : list){
			jsonday += a.getY() + ",";
		}
		jsonday = jsonday.substring(0, jsonday.lastIndexOf(","));
		//맨 끝에 ,만 빼고 다 가져와라
		jsonday += "]";
		
		return jsonday;
	}
	
}


