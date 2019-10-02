package com.rhymes.app.used.model;

import java.io.Serializable;

import javax.annotation.Generated;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SellerDto implements Serializable {
	private int seq;		// 시퀀스
	private String s_id;	//  아이디
	private String lat;		// 위도
	private String lng;		// 경도
}

/*
create table rhy_used_seller(
seq int(20) not null auto_increment,
s_id varchar(1000),
lat varchar(1000),
lng varchar(1000),
primary key (seq),
foreign key(s_id) references rhy_mem(id))
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
*/