package com.rhymes.app.Store.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto implements Serializable {
	
	private String id;
	private int stock_seq;
	private int p_quantity;

}
