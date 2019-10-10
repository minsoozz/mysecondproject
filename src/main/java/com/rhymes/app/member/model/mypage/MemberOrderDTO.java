package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberOrderDTO {

	private int rnum;		//페이징 순서
	private String payment_code;	//고유 주문번호
	private String userid;		//주문자 id
	private int count;			//해당주문이 갖는 아이템 개수
	private String p_name;		//대표상품 이름
	private int totalprice;		//총 주문 금액
	private String payment_status;	//결제상태
	private String img;			//대표이미지
	private String rdate;		//결제일
	private String review_written; //후기작성여부
}
