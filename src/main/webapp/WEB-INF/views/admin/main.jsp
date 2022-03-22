<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- css, js 파일포함 -->
<%@include file="/WEB-INF/views/admin/include/header_info.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

	  <!-- Main Header -->
	  <%@include file="/WEB-INF/views/admin/include/header.jsp" %>
	  <!-- Left side column. contains the logo and sidebar -->
	  <%@include file="/WEB-INF/views/admin/include/left_menu.jsp" %>

	  <!-- Content Wrapper. Contains page content -->
	  <div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <!-- 쇼핑몰현황 추가 -->
	    </section>
	
	    <!-- Main content -->
	    <section class="content container-fluid">
	
	
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