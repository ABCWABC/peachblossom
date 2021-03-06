<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
 <head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
   <meta name="generator" content="Hugo 0.88.1">
   <title>peach blossom</title>

   <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

   <%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
   <%@include file="/WEB-INF/views/include/mypage_css.jsp" %>
   
 </head>
 <body>
    
   <%@include file="/WEB-INF/views/include/header.jsp" %>

  <div class="container">
  
  <div class="titleArea">
    <h2>MYPAGE</h2>
  </div>
  
  <!-- 회원가입 폼 작업 -->
  <h6>기본정보</h6>
  <p class="required">
  	<img alt="" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"> 필수입력사항
  </p>
  <form action="/member/modify" method="post" id="modifyForm">
  	<div>
  		<table class="table table-bordered">
  			<colgroup>
				<col style="width:150px;">
				<col style="width:auto;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">아이디 
						<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
						<input type="text" id="mb_id" name="mb_id" value='<c:out value="${memberVO.mb_id }" />' readonly> (영문소문자/숫자, 4~16자) &nbsp
					</td>
				</tr>
				<tr>
					<th scope="row">이름 
						<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
						<input type="text" name="mb_name" id="mb_name" value='<c:out value="${memberVO.mb_name }" />' readonly>
					</td>
				</tr>
				<tr>
					<th scope="row">이메일 
						<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
						<input type="text" id="mb_email" name="mb_email" value='<c:out value="${memberVO.mb_email }" />'>
					</td>
				</tr>
				<tr class="">
					<th scope="row">주소 
						<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
						<input type="text" id="mb_zipcode" name="mb_zipcode" style="margin-bottom:5px" value='<c:out value="${memberVO.mb_zipcode }" />'>
						<input type="button" class="btnNormal" id="btnPostCode" name="btnPostCode" value="우편번호찾기" onclick="sample2_execDaumPostcode()">
						<br>
						<input type="text" id="mb_addr" name="mb_addr" value='<c:out value="${memberVO.mb_addr }" />' style="margin-bottom:5px; width: 430px"> 기본주소
						<br>
						<input type="text" id="mb_addr_d" name="mb_addr_d" value='<c:out value="${memberVO.mb_addr_d }" />' style="margin-bottom:5px; width: 430px"> 나머지주소
						<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
					</td>
				</tr>
				<tr class="">
					<th scope="row">휴대전화 
						<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
					</th>
					<td>
						<input type="text" id="mb_mobile1" name="mb_mobile1" value='<c:out value="${memberVO.mb_mobile1 }" />'>-
						<input type="text" id="mb_mobile2" name="mb_mobile2" value='<c:out value="${memberVO.mb_mobile2 }" />'>-
						<input type="text" id="mb_mobile3" name="mb_mobile3" value='<c:out value="${memberVO.mb_mobile3 }" />'>
					</td>
				</tr>
				<tr>
					<th scope="row">포인트</th>
					<td>
						<input type="text" name="mb_point" id="mb_point" value='<c:out value="${memberVO.mb_point }" />' readonly>
					</td>
				</tr>
				<tr class="displaynone">
					<th scope="row">메일수신여부</th>
					<td>
						<input type="radio" id="mb_accept_e_Y" name="mb_accept_e" value="Y" <c:out value="${memberVO.mb_accept_e == 'Y' ? 'checked=\"checked\"': '' }" />>
						<label for="mb_accept_e_Y">동의함</label>
						<input type="radio" id="mb_accept_e_N" name="mb_accept_e" value="N" <c:out value="${memberVO.mb_accept_e == 'Y' ? '': 'checked=\"checked\"' }" />>
						<label for="mb_accept_e_N">동의안함</label>
						<!-- 
					 	<div id="checkbox">
					 		<input type="checkbox" class="form-check-input" id="mb_accept_e" name="mb_accept_e" value="Y">
					 	</div>
					 	 -->
					</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 변경하기
					</th>
					<td>
						<input type="password" id="cur_mb_password" name="cur_mb_password" placeholder="현재비밀번호">
						<input type="password" id="change_mb_password" name="change_mb_password" placeholder="변경비밀번호">
						<button type="button" class="btnNormal" id="btnChangePw">비밀번호 변경</button>
					</td>
				</tr>
				<tr>
					<th scope="row">회원탈퇴
					</th>
					<td>
						<input type="password" id="cur_mb_del_password" name="cur_mb_del_password" placeholder="비밀번호">
						<button type="button" id="btnRegDelete">회원 탈퇴</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
  </form>
  
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

	$(document).ready(function(){
	
		//비밀번호 변경
	    $("#btnChangePw").on("click", function(){
	
	      let cur_mb_password = $("#cur_mb_password");
	      let change_mb_password = $("#change_mb_password");
	
	      if(cur_mb_password.val() == "" || cur_mb_password.val() == null){
	        alert("현재비밀번호를 입력하세요.");
	        cur_mb_password.focus();
	        return;
	      }
	      
	      if(change_mb_password.val() == "" || change_mb_password.val() == null){
	          alert("변경비밀번호를 입력하세요.");
	          change_mb_password.focus();
	          return;
	        }
	
	      $.ajax({
	        url: '/member/changePw',
	        type: 'post',
	        dataType: 'text',
	        data: { cur_mb_password : cur_mb_password.val(), change_mb_password : change_mb_password.val() },
	        success: function(data){
	          
	          if(data == "success"){
	            alert("비밀번호 성공.");
	          }else if(data == "noPw"){
	            alert("현재 비밀번호가 다릅니다. 확인하세요.");
	            cur_mb_password.val("");
	            cur_mb_password.focus();
	          }
	        } 
	      });
	    });
		
	  //회원탈퇴
	    $("#btnRegDelete").on("click", function(){
	
	      let cur_mb_del_password = $("#cur_mb_del_password");
	      
	      if(cur_mb_del_password.val() == "" || cur_mb_del_password.val() == null){
	        alert("현재비밀번호를 입력하세요.");
	        cur_mb_del_password.focus();
	        return;
	      }
	      
	      $.ajax({
	        url: '/member/regDelete',
	        type: 'post',
	        dataType: 'text',
	        data: { mb_password : cur_mb_del_password.val()},
	        success: function(data){
	          
	          if(data == "1"){
	            alert("회원삭제가 되었습니다.");
	            location.href = "/";		
	          }else if(data == "0"){
	            alert("현재 비밀번호가 다릅니다. 확인하세요.");
	            mb_password.val("");
	            mb_password.focus();
	          }
	        } 
	      });
	      
	    });
	    
	 });
  </script>


    
  </body>
</html>
