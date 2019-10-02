package com.rhymes.app.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.MemberDAO;
import com.rhymes.app.member.model.AuthoritiesDTO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberdao;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	// 아이디체크
	@Override
	public int getIDCheck(MemberDTO mem) {
		return memberdao.getIDCheck(mem);
	}

	// 회원가입
	@Override
	public void getAddmem(MemBean bean) {
		
		// 공통
		MemberDTO mem = new MemberDTO( 
										bean.getUserid().trim(), 
										passwordEncoder.encode(bean.getUserpw()));
										
		System.out.println("MemberDTO: " + mem.toString());
		
		boolean b = memberdao.getAddmem(mem);
		
		// 추가
		P_MemberDTO pmem = new P_MemberDTO(
											bean.getUserid().trim(), 
											bean.getUsername().trim(),
											bean.getPostcode().trim(),
											bean.getAddress().trim(),
											bean.getDetailAddress().trim(),
											bean.getPhone().trim(),
											bean.getUseremail().trim(),
											bean.getGender().trim(),
											bean.getBirth().trim(),
											bean.getCount());
		
		// 권한
		AuthoritiesDTO amem = new AuthoritiesDTO(bean.getUserid(), bean.getAuthority());
		
		if(b) {
			memberdao.getPAddmem(pmem);
			memberdao.getAuthAddmem(amem);
		}
		
		
		
		
		
	}


	// 사업자번호 체크
	@Override
	public String getCRCheck(SellerCRnumDTO crdto) {
		return memberdao.getCRCheck(crdto);
	}
	// 라임즈에 사업자번호가 등록되어있는지 확인
	@Override
	public int getCRCYN(SellerCRnumDTO crnum) {
		
		String cnum = crnum.getCrnum1()+"-"+crnum.getCrnum2()+"-"+crnum.getCrnum3();
		SellerDTO sdto = new SellerDTO();
		sdto.setC_num(cnum);
		return memberdao.getCRCYN(sdto);
	}

	// 사업자 회원가입
	@Override
	public void getAddSeller(SellerBean sellerbean, MemberDTO memdto) {
		System.out.println("getAddSeller Service도착");

		// 공통
		MemberDTO mem = new MemberDTO(memdto.getUserid(), 
										passwordEncoder.encode(memdto.getUserpw()));
		System.out.println("getAddSeller mem: " + mem.toString());
		
		// 사업자 추가정보
		
		// 사업자번호
		String c_num = sellerbean.getCrnum1()+"-"+sellerbean.getCrnum2()+"-"+sellerbean.getCrnum3();
		// 담당자이메일
		String ic_email = sellerbean.getIc_email1()+"@"+sellerbean.getIc_email2();
		
		SellerDTO sel = new SellerDTO(
										memdto.getUserid(),
										sellerbean.getC_name(),
										c_num,
										sellerbean.getP_name(),
										sellerbean.getC_postcode(),
										sellerbean.getC_address(),
										sellerbean.getC_detailAddress(),
										sellerbean.getC_cond(),
										sellerbean.getC_type(),
										sellerbean.getIc_name(),
										sellerbean.getTo(),
										ic_email,
										sellerbean.getS_postcode(),
										sellerbean.getS_address(),
										sellerbean.getS_detailAddress(),
										sellerbean.getR_postcode(),
										sellerbean.getR_address(),
										sellerbean.getR_detailAddress(),
										sellerbean.getC_code());
		System.out.println("getAddSeller sel: " + sel.toString());
		
		// 권한
		AuthoritiesDTO amem = new AuthoritiesDTO(memdto.getUserid(), sellerbean.getAuthority());
		System.out.println("getAddSeller amem: " + amem.toString());
		
		boolean b = memberdao.getAddmem(mem);
		
		if(b) {
			memberdao.getAddSeller_C(sel);
			memberdao.getAuthAddmem(amem);
		}

	}

	// id찾기
	@Override
	public String getFindID(MemBean mbean) {
		
		String foundId = "";	
		
		String eID = memberdao.getFindID_E(mbean);		// email를 넣어서 id를 뽑아냄
		MemberDTO mem = new MemberDTO(eID, null);
		System.out.println("memberservice 아이디찾기 mem:  " + mem.toString());
		
		String getuserpw = memberdao.getFindID_P(mem);	// db에 저장되어있는 pw를 뽑아냄
		
		System.out.println("memberservice 아이디찾기 getuserpw:  " + getuserpw);
		
		boolean b = passwordEncoder.matches(mbean.getUserpw(), getuserpw);
		if(b) {
			foundId = eID;
		}else {
			foundId = "N";
		}		

		return foundId;
	}





	








}
