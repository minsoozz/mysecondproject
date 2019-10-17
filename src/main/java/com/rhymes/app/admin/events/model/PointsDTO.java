package com.rhymes.app.admin.events.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**적립금 이력을 조회하기 위한 DTO
  * @author minhj
  */
@Getter
@Setter
@ToString
public class PointsDTO {
	
	private int rnum;	//순서
	private int seq;	//id
	private String id;	//사용자id
	private String comment;	//적립내용
	private String coup_code;	//쿠폰사용한경우 코드
	private int amount;		//적립금액
	private String rdate;	//적립일
	private String expdate;	//만료일
	private String used_date;	//사용일
	private int used_amount;	//총 사용금액
	
	
	/**잔액을 리턴하는 메소드
	 * @return
	 */
	public int getTotalAmount() {
		return amount - used_amount;
	}
	
}
