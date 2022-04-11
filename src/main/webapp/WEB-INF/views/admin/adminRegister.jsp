<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- css, js 파일포함 -->
<%@include file="/WEB-INF/views/admin/include/header_info.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">
<script>
	let msg = '${msg}';
	if(msg == "success"){
		alert("관리자로 등록됨.");
	}else if(msg == "fail"){
		alert("관리자 등록실패.");
	}
</script>
<div class="wrapper">

  <!-- Main Header -->
  <%@include file="/WEB-INF/views/admin/include/header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="/WEB-INF/views/admin/include/left_menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h5 style="font-weight:bold;">관리자기능<small style="margin-left:10px;">관리자회원추가</small></h5>
      <ol class="breadcrumb">
        <li><a href="/admin/main"><i class="fa fa-dashboard"></i>관리자 메인페이지</a></li>
        <li class="active">관리자회원추가</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

	<form action="/admin/adminRegister" method="post" id="adminForm">
		<div class="form-row">
		    <div class="col-md-5">
		      <label for="ad_userid">관리자 ID</label>
		      <input type="text" class="form-control" id="ad_userid" name="ad_userid">
		    </div>
		    <div class="col-md-5">
		      <label for="ad_userpw">관리자 PW</label>
		      <input type="password" class="form-control" id="ad_userpw" name="ad_userpw">
		    </div>
		    <div class="col-md-2">
		      <label for="ad_user">&nbsp;</label>
		      <input type="submit" class="form-control" id="ad_user" value="관리자 등록">
		    </div>
	   </div>
   </form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer (기타 footer태그밑에 소스포함)-->
  <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/admin/include/plugin_js.jsp" %>

</body>
</html>
