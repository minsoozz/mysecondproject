package com.rhymes.app.Store.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



public class StockDto {
	
	private int stock_seq;		// 재고번호(사이즈별 구분)
	private int p_seq;			// 상품 번호
	private String p_size;		// 상품 사이즈
	private int p_quantity;		// 수량
	
	private String p_quantity2;		// jsp->controller
	
	private String size;
	private int quantity;
	
	public StockDto() {
	}


	public int getStock_seq() {
		return stock_seq;
	}


	public void setStock_seq(int stock_seq) {
		this.stock_seq = stock_seq;
	}


	public int getP_seq() {
		return p_seq;
	}


	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}


	public String getP_size() {
		return p_size;
	}


	public void setP_size(String p_size) {
		this.p_size = p_size;
	}



	public int getP_quantity() {
		return p_quantity;
	}


	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}


	public String getP_quantity2() {
		return p_quantity2;
	}



	public void setP_quantity2(String p_quantity2) {
		this.p_quantity2 = p_quantity2;
	}


	public String getSize() {
		return size;
	}



	public void setSize(String size) {
		this.size = size;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	

	
	
	
	
	

	
	
}
