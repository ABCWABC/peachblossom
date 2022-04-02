<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<!-- REQUIRED JS SCRIPTS -->
	<%@include file="/WEB-INF/views/admin/include/plugin_js.jsp" %>

	<!-- css, js 파일포함 -->
	<%@include file="/WEB-INF/views/admin/include/header_info.jsp" %>

	
	<script>
		
		if("${msg}" == "failId"){
			alert("로그인에 실패하였습니다.\n아이디를 다시 확인해주세요.");
		}else if("${msg}" == "failPw"){
			alert("로그인에 실패하였습니다.\n비밀번호를 다시 확인해주세요.");
		}
	
	</script>

</head>

<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>ADMIN PAGE <small>peach blossom</small></h1>
		</section>

		<%-- Main content --%>
		<section class="content container-fluid">
		<%-- 로그인 안 한 상태 --%>
		<c:if test="${sessionScope.admin == null}">
			<div class="container" style="width: 450px; height:620px; background-color: white; margin-top:30px;">
				<form id="loginForm" class="form-signin" action="/admin/logon" method="post" style="padding:50px 30px;">
					<h2 class="form-signin-heading">Please sign in</h2>
					<br><br>
					<label for="inputId" class="sr-only">Id</label> 
					<input type="text" id="ad_userid" name="ad_userid" class="form-control" style="margin-bottom: 15px" placeholder="Id" required autofocus> 
					<label for="inputPassword" class="sr-only">Password</label> 
					<input type="password" id="ad_userpw" name="ad_userpw" class="form-control" placeholder="Password" required>
					<br><br><br>
					<button type="submit" id="btn_login" class="btn btn-lg btn-primary btn-block">Sign in</button>
				</form>
			</div>
		</c:if>
				
		<%-- 로그인 한 상태 --%>
		<c:if test="${sessionScope.admin != null}">
			<div style="margin-top:80px;">
				<h3>welcome!<br/></h3>
				<h4>This is Admin Main page. <br/> Please click on the menu you want to work on :)</h4>
			</div>
		</c:if>
		</section>
		<!-- /.content -->
		
	</div>

	<!-- ./wrapper -->

	<script>
	
		$(document).ready(function() {
			
			var form = $("#loginForm");
			
			// 로그인 처리
			$("#btn_login").on("click", function(){
				
				var ad_userid = $("#ad_userid");
				var ad_userpw = $("#ad_userpw");
		
				if(ad_userid.val()==null || ad_userid.val()==""){
					alert("아이디를 입력해주세요.");
					ad_userid.focus();
					return;
				} else if(ad_userpw.val()==null || ad_userpw.val()==""){
					alert("비밀번호를 입력해주세요.");
					ad_userpw.focus();
					return;
				} else {
					form.submit();
				}
				
			});
			
		});
		
	</script>
	
</body>
</html>
