package com.rhymes.app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.rhymes.app.member.dao.MemberDAO;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

/**DB에서 사용자 정보를 가져오는 역할
 * @author minhj
 *
 */
@Slf4j
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberDAO memDAO;
	
	@Autowired
	private BCryptPasswordEncoder bc;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserId : " + username);
		
		MemberDTO dto = memDAO.getOneMemberByMemberId(username);
		
		//log.warn("queried by member mapper: " + dto);
		//log.info("minp == " + bc.encode("minp"));
		
		return dto == null ? null : new CustomUser(dto);
	}	
}
