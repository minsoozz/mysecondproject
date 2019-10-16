package com.rhymes.app.store.model;



public class ProductDto {

	private int p_seq; 				// 상품 번호
	private String c_name;			// Company Name
	private String p_name;			// 상품명
	private String p_title;			// 상품 부가설명
	private String cp_code;			// 상품 부가설명
	private int p_price;			// 단가
	private String p_color;			// 상품 색상
	
	private String c1_name; 		// 1차 카테고리 이름
	private String c2_name;			// 2차 카테고리 이름
	private String c3_name;			// 3차 카테고리 이름
	
	private String nation;			// 제품 원산지
	private String mdate;			// 제조년월(6자리)
	private String detail;			// 제품 상세
	private String photo1_file;		// 이미지1(메인)
	private String photo2_file;		// 이미지2
	private String photo3_file;		// 이미지3
	private String photo4_file;		// 이미지4
	private String photo5_file;		// 이미지5
	private String rdate;			// 제품등록 날짜
	
	private String p_price2;		// 원화 단위로 변환
	
	private int rnum;				// 관리자쪽에서 확인하기 위한 순번
	private int sum;				// 관리자쪽에서 확인하기 위한 총합 : 해당P_SEQ에 대한 STOCK 총합
	private int wish;				// 관리자쪽에서 확인하기 위한 찜cnt
	
	public String getP_price2() {
		return p_price2;
	}

	public void setP_price2(String p_price2) {
		this.p_price2 = p_price2;
	}

	public ProductDto() {
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getCp_code() {
		return cp_code;
	}

	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_color() {
		return p_color;
	}

	public void setP_color(String p_color) {
		this.p_color = p_color;
	}

	public String getC1_name() {
		return c1_name;
	}

	public void setC1_name(String c1_name) {
		this.c1_name = c1_name;
	}

	public String getC2_name() {
		return c2_name;
	}

	public void setC2_name(String c2_name) {
		this.c2_name = c2_name;
	}

	public String getC3_name() {
		return c3_name;
	}

	public void setC3_name(String c3_name) {
		this.c3_name = c3_name;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPhoto1_file() {
		return photo1_file;
	}

	public void setPhoto1_file(String photo1_file) {
		this.photo1_file = photo1_file;
	}

	public String getPhoto2_file() {
		return photo2_file;
	}

	public void setPhoto2_file(String photo2_file) {
		this.photo2_file = photo2_file;
	}

	public String getPhoto3_file() {
		return photo3_file;
	}

	public void setPhoto3_file(String photo3_file) {
		this.photo3_file = photo3_file;
	}

	public String getPhoto4_file() {
		return photo4_file;
	}

	public void setPhoto4_file(String photo4_file) {
		this.photo4_file = photo4_file;
	}

	public String getPhoto5_file() {
		return photo5_file;
	}

	public void setPhoto5_file(String photo5_file) {
		this.photo5_file = photo5_file;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getWish() {
		return wish;
	}

	public void setWish(int wish) {
		this.wish = wish;
	}
	

	
	
}
