package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**주문내역 상세내역을 저장하기 위한 클래스
 * @author minhj
 *
 */
@Getter
@Setter
@ToString
public class MemberOrderDetailDTO {

	private int seq;	//디테일ID(seq)
	private String img;	//대표이미지
	private String p_name;	//상품이름
	private int p_price;	//상품가격
	private int ea;		//구매수량
	private String payment_status;	//결제상태
	private String delivery_status;	//배송상태
	private String delivery_post_code;	//송장번호
	private String review_written;	//리뷰작성여부
}