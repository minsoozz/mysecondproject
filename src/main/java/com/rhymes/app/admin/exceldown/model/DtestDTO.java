package com.rhymes.app.admin.exceldown.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DtestDTO implements Serializable {
	private String id;
	private String name;
	private String address;
	private String email;
	private String phone;
	private String gender;
	private String birth;
	private String count;
}
