package com.rhymes.app.admin.chart.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
//매출 통계 낼 때 검색된 날짜 받는다
public class AdminChartSearchDTO implements Serializable {
	private int search_year;
	private int search_month;
	private int search_day;

	private String year_month;
	private String year_month_day;
	
	private int key_year;
	private int key_month;
	private int key_day;
}
