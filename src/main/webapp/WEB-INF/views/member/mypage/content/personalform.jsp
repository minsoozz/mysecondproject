<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String ctx = request.getContextPath() + ""; %>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="/css/member/mypage/content/personalform.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/personalform.js"></script>

<!-- 
params
${param.role } : 권한
${param.userid }
${param.username}
${param.postcode}
${param.address}
${param.detailAddress}
${param.phone}
${param.useremail}
${param.usergender}
${param.userbirth}
${param.count}
 --> 

<c:choose>
	<c:when test="${param.role eq 'member' }">		
		<!-- 일반회원인 경우 -->
		<div class="mem_p_wrap">
		<div class="form-group confirm_frm_wrap">
			<div class="form_head_info" align="left">
				<div class="form-row">
					<div class="col-md-12">
						<h3>기본정보</h3>
					</div>
				</div>			
				<div class="form-row"><div class="col-md-12"><hr/></div></div>
				<div class="form-row">
					<label for="_id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-md-6">						
		      			<input type="text" class="form-control" id="_userid" value="${param.userid }" readonly="readonly">
					</div>
				</div>
				<div class="form-row">
					<label for="_userpw" class="col-sm-2 col-form-label">새 비밀번호</label>
					<div class="col-md-6"><!-- <label for="_userpw">비밀번호</label> -->						
		      			<input type="password" class="form-control" name="userpw" id="_userpw" placeholder="새로운 비밀번호를 입력해 주세요.">
					</div>					
				</div>
				<div class="form-row">
					<label for="_userpwConfirm" class="col-sm-2 col-form-label">새 비밀번호 확인</label>					
					<div class="col-md-6"><!-- <label for="_userpwConfirm">비밀번호 확인</label> -->
		      			<input type="password" class="form-control" name="userpwConfirm" id="_userpwConfirm" placeholder="비밀번호를 한번 더 입력해 주세요.">
					</div>
				</div>
				<div class="form-row">
					<label for="_username" class="col-sm-2 col-form-label">이름</label>
					<div class="col-md-6"><!-- <label for="_username">이름</label> -->
					<input type="text" class="form-control" name="username" id="_username" value="${param.username }">
					</div>
				</div>
				<div class="form-row">
					<label for="_postcode" class="col-sm-2 col-form-label">주소</label>				
					<div class="col-md-6"><!-- <label for="_postcode">주소</label> -->						
		      			<input type="text" class="form-control" name="postcode" id="_postcode" value="${param.postcode }">		      			
					</div>
				</div>
				<div class="form-row row_address">
					<label for="_address" class="col-sm-2 col-form-label">  </label>				
					<div class="col-md-6"><!-- <label for="_postcode">주소</label> -->						
		      			<input type="text" class="form-control" name="address" id="_address" value="${param.address }">		      			
					</div>
				</div>
				<div class="form-row row_address">
					<label for="_detailAddress" class="col-sm-2 col-form-label"> </label>				
					<div class="col-md-6"><!-- <label for="_postcode">주소</label> -->						
		      			<input type="text" class="form-control" name="detailAddress" id="_detailAddress" value="${param.detailAddress}">		      			
					</div>
				</div>
				<div class="form-row">
					<label for="form_phone_wrap" class="col-sm-2 col-form-label">전화번호</label>
					<div class="col-md-8"><!-- <label for="_phone_1">전화번호</label> -->						
		      			<input type="hidden" class="form-control" name="phone" id="_phone" value="${param.phone }">
		      			<div class="_form_phone_wrap" id="form_phone_wrap">		      			
			      			<input type="text" class="form-control" id="_phone_1" value="" size="3">
			      			<a>-</a>
			      			<input type="text" class="form-control" id="_phone_2" value="" size="3">
			      			<a>-</a>
			      			<input type="text" class="form-control" id="_phone_3" value="" size="3">
		      			</div>
		      		</div>
				</div>
				<div class="form-row">
					<label for="_useremail" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-md-6"><!-- <label for="_useremail">이메일</label> -->						
		      			<input type="text" class="form-control" name="useremail" id="_useremail" value="${param.useremail }">		      					      			
					</div>					
				</div>
				<div class="form-row">
					<div class="col-md-12">
						<br><h3>추가정보</h3>
					</div>
				</div>	
				<div class="form-row"><div class="col-md-12"><hr/></div></div>
				<div class="form-row">
					<label for="form_gender_wrap" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-md-6"><!-- <label for="_gender">성별</label> -->
						<input type="hidden" id="origin_gender" value="${param.usergender }">
						<div class="_form_gender_wrap" id="form_gender_wrap">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="_gen_male" name="gender" class="custom-control-input" value="male">
								<label class="custom-control-label" for="_gen_male">남성</label>
							</div>							
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="_gen_female" name="gender" class="custom-control-input" value="femail">
								<label class="custom-control-label" for="_gen_female">여성</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="_gen_none" name="gender" class="custom-control-input" value="none">
								<label class="custom-control-label" for="_gen_none">선택 안함</label>
							</div>
						</div>		      			
					</div>
					<script type="text/javascript">
						//성별 초기값 선택
						var gen = $("#origin_gender").val();
						console.log("gen:"+gen);
						switch(gen){
							case 'male' : $("#_gen_male").attr('checked', 'checked'); break;
							case 'female' : $("#_gen_female").attr('checked', 'checked'); break;
							case 'none' : $("#_gen_none").attr('checked', 'checked'); break;
							default: break;
						}
					</script>			
				</div>
				
				<div class="form-row">
					<label for="form_gender_wrap" class="col-sm-2 col-form-label" style="margin-top: 12px;">생일</label>
					<div class="col-md-6"><!-- <label for="_birth">생일</label> -->
						<div class="_form_birth_wrap" id="form_birth_wrap">
							<input type="hidden" class="form-control" name="birth" id="_birth" value="${param.userbirth }">
							<input type="text" class="form-control birth_txt" id="_birth_txt_1" placeholder="yyyy">
							<input type="text" class="form-control birth_txt" id="_birth_txt_2" placeholder="mm">
							<input type="text" class="form-control birth_txt" id="_birth_txt_3" placeholder="dd">
						</div>		      					      			
					</div>				
				</div>
			</div>			
		</div>
		</div>
	</c:when>
	<c:otherwise>
		기업회원입니다.
	</c:otherwise>
</c:choose>



</html>