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
public class AdminChartSalaryParam implements Serializable {
	private int year;
	private int month;
	private int day;
}
