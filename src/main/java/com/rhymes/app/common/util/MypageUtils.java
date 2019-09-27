package com.rhymes.app.common.util;

import java.util.Random;

public class MypageUtils {

	
	/**랜덤 쿠폰번호를 콘솔에 출력하는 메소드
	 * 
	 */
	public static void printRandCoupsUpdate(int cnt, int scale, int seq) {
		Random rnd =new Random();
		
		for(int j = 0 ; j < cnt ; j++ ) {
			StringBuffer buf =new StringBuffer();
			buf.append("UPDATE RHY_MEM_COUPON_DETAIL SET COUP_CODE='");
			for(int i = 0 ; i < scale ; i++){
				if(i%4 == 0 && i != 0) {
			    	buf.append("-");
			    }
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			    
			}
			buf.append("' WHERE SEQ=" + j +  " ;");
			System.out.println(buf);
		}
	}
	
	public static void printRandCoupsInsert(int cnt, int scale, int seq) {
		Random rnd =new Random();
		
		for(int j = 0 ; j < cnt ; j++ ) {
			StringBuffer buf =new StringBuffer();
			buf.append("INSERT RHY_MEM_COUPON_DETAIL (C_SEQ, COUP_CODE ) VALUES( 2, '");
			for(int i = 0 ; i < scale ; i++){
				if(i%4 == 0 && i != 0) {
			    	buf.append("-");
			    }
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			    
			}
			buf.append("') ;");
			System.out.println(buf);
		}
	}
}
