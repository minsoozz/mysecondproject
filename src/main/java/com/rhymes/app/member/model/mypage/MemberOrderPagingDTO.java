package com.rhymes.app.member.model.mypage;

import com.rhymes.app.common.model.CommonPagingDTO;

import lombok.Getter;
import lombok.Setter;

/**주문내역 페이징, 검색조건(기간)을 갖는 DTO
 * @author minhj
 *
 */
@Getter
@Setter
public class MemberOrderPagingDTO extends CommonPagingDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int recordCountPerPage = 3;
	private String userid;
	
	/* 부모 클래스 생성자 */	
	public MemberOrderPagingDTO(int pageNum, int totalSize) {
		super(pageNum, totalSize);
	}	

	public MemberOrderPagingDTO(int pageNum, int totalSize, int recordCountPerPage) {
		super(pageNum, totalSize, recordCountPerPage);
	}

	public MemberOrderPagingDTO(int cond, String keyword, int pageNum, int totalSize) {
		super(cond, keyword, pageNum, totalSize);
	}
	
	public MemberOrderPagingDTO(int pageNum, int recordCountPerPage, int startSeq, int endSeq, int totalPage, int pageSize,
			int firstNavIndex, int lastNavIndex, int totalSize) {
		super(pageNum, recordCountPerPage, startSeq, endSeq, totalPage, pageSize, firstNavIndex, lastNavIndex, totalSize);
	}
	
	/**매개변수 없는 생성자.
	 * 최초접속에 쓰임
	 */
	public MemberOrderPagingDTO() {
		super(1, 10);
		super.setRecordCountPerPage(recordCountPerPage);
	}
	
	/**자식클래스 생성자. cond=검색조건 keyword=기간
	 * @param cond
	 * @param keyword
	 * @param pageNum
	 * @param totalSize
	 * @param userid
	 */
	public MemberOrderPagingDTO(int cond, String keyword, int pageNum, int totalSize, String userid) {
		super(cond, keyword, pageNum, totalSize);
		this.userid = userid;
		super.setRecordCountPerPage(recordCountPerPage);
	}
	
	public MemberOrderPagingDTO(int pageNum, int recordCountPerPage, int startSeq, int endSeq, int totalPage, int pageSize,
			int firstNavIndex, int lastNavIndex, int totalSize, String userid) {
		super(pageNum, recordCountPerPage, startSeq, endSeq, totalPage, pageSize, firstNavIndex, lastNavIndex, totalSize);
		this.userid = userid;
		super.setRecordCountPerPage(this.recordCountPerPage);
	}

	@Override
	public String toString() {		
		return super.toString().replace(")", "") + " , userid=" + this.userid + ")";
	}	

}
