<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<!-- css, js 파일포함 -->
	<%@include file="/WEB-INF/views/admin/include/header_info.jsp" %>

	<script type="text/javascript" src="/resources/js/admin/logon.js"></script>
	
	<script>
		let msg = '${msg}'
		
		if("${msg}"=="logonSuccess"){
			alert("로그인 되었습니다.\n환영합니다!");
			
		} else if("${msg}"=="failId"){
			alert("로그인에 실패하였습니다.\n아이디를 다시 확인해주세요.");
		} else if("${msg}"=="failPw"){
			alert("로그인에 실패하였습니다.\n비밀번호를 다시 확인해주세요.");
		} else if("${msg}"=="LOGOUT_SUCCESS"){
			alert("로그아웃 되었습니다.");
		} 
	</script>

</head>

<body class="hold-transition skin-blue sidebar-mini">

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
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
	<!-- /.content-wrapper -->

	<!-- Main Footer -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab"
				data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li>
				<a href="#control-sidebar-settings-tab" data-toggle="tab">
					<i class="fa fa-gears"></i>
				</a>
			</li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:;">
						<i class="menu-icon fa fa-birthday-cake bg-red"></i>
							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

								<p>Will be 23 on April 24th</p>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li>
						<a href="javascript:;">
							<h4 class="control-sidebar-subheading">Custom Template Design <span class="pull-right-container">
									<span class="label label-danger pull-right">70%</span>
								</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
						</a>
					</li>
				</ul>
				<!-- /.control-sidebar-menu -->

			</div>
			<!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
			<!-- /.tab-pane -->
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel usage <input type="checkbox" class="pull-right" checked>
						</label>
						<p>Some information about this general settings option</p>
					</div>
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
	</aside>
	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
	<!-- ./wrapper -->


</body>
</html>
