package com.rhymes.app.member.dao;

import java.util.List;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;

public interface MypagePersonalDAO {

	/**매개변수로 받은 ID의 암호화된 비밀번호를 리턴
	 * @param id
	 * @return
	 */
	public String getOnePwById(String id);
	
	/**매개변수로 받은 ID가 갖는 권한 리턴
	 * @param id
	 * @return
	 */
	public List<String> getAuthorities(String id);
	
	/**개인회원 상세 정보 리턴(RHY_MEM_P)
	 * @param id
	 * @return
	 */
	public P_MemberDTO getOnePersonalMemberById(String id);
	
	/**기업회원 상세 정보 리턴(RHY_MEM_C)
	 * @param id
	 * @return
	 */
	public SellerDTO getOneSellerMemberById(String id);
}
