package com.rhymes.app.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.MypageOrderlogDAO;
import com.rhymes.app.member.dao.MypageReviewDAO;
import com.rhymes.app.member.model.mypage.MemberOrderDetailDTO;
import com.rhymes.app.member.service.MypageReviewService;

@Service
public class MypageReviewServiceImpl implements MypageReviewService {

	@Autowired
	private MypageReviewDAO mypageReviewDAO;
	
	@Autowired
	private MypageOrderlogDAO mypageOrderlogDAO;
	
	/**매개변수로 받은 유저ID가 갖고있는 모든 주문번호를 가져옴
	 * @param userid
	 * @return
	 */
	@Override
	public List<String> getPaymentCodesByUserid(String userid) {
		// TODO Auto-generated method stub
		return mypageReviewDAO.getPaymentCodesByUserid(userid);
	}

	/**리뷰 작성 여부에 따라 Map에 데이터를 저장해서 리턴
	 * key:true, value:리뷰가작성된 주문이력 Map
	 * key:false, value:리뷰가 작성되지 않은 주문이력 Map
	 * 
	 * 주문이력 Map
	 * key:주문번호, value: 디테일
	 * @param userid
	 * @return
	 */
	@Override
	public Map<Boolean, Map<String, List<MemberOrderDetailDTO>>> getTwoMapsSeperatedByWhetherReviewWritten(List<String> payment_codes) {

		Map<Boolean, Map<String, List<MemberOrderDetailDTO>>> reviewItems = new HashMap<Boolean, Map<String, List<MemberOrderDetailDTO>>>();

		reviewItems.put(true, new HashMap<String, List<MemberOrderDetailDTO>>());
		reviewItems.put(false, new HashMap<String, List<MemberOrderDetailDTO>>());
		
		for(String payment_code : payment_codes) {
			List<MemberOrderDetailDTO> detailList = mypageOrderlogDAO.getOrderlogDetailsByPaymentCode(payment_code);
			for( MemberOrderDetailDTO dto : detailList ) {
				if( "TRUE".equals(dto.getReview_written()) == true ) {//리뷰가 작성된 경우
					reviewItems.get(true).put(payment_code, new ArrayList<MemberOrderDetailDTO>());					
					reviewItems.get(true).get(payment_code).add(dto);
				}else {							//리뷰가 작성되지 않은 경우
					reviewItems.get(false).put(payment_code, new ArrayList<MemberOrderDetailDTO>());					
					reviewItems.get(false).get(payment_code).add(dto);
				}
			}
		}	
		
		return reviewItems;
	}
	
	
}
