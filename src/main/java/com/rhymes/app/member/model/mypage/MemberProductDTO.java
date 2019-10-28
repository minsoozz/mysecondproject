package com.rhymes.app.member.model.mypage;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Setter
@ToString
@Entity
@Table(name = "rhyStoreProduct")//카멜표기법은 자동으로 스네이크 표기법으로 변환(ex rhy_store_product)
public class MemberProductDTO {

	@Id
	@GeneratedValue
	private int pSeq;

	private String cName;
	private String pName;
	private String pTitle;
	private String cpCode;
	
	private int pPrice;
	private int bfsPrice;
	
	private String pColor;
	private String c1Name;
	private String c2Name;
	private String c3Name;
	private String nation;
	
	private String mdate;
	private String detail;
	
}
