package com.rhymes.app.Store.model.category;

public class BasketOrderDto {

	private int stock_seq;
	private int p_quantity;
	public int getStock_seq() {
		return stock_seq;
	}
	public void setStock_seq(int stock_seq) {
		this.stock_seq = stock_seq;
	}
	public int getP_quantity() {
		return p_quantity;
	}
	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}
	@Override
	public String toString() {
		return "BasketOrderDto [stock_seq=" + stock_seq + ", p_quantity=" + p_quantity + "]";
	}
	
	
}
