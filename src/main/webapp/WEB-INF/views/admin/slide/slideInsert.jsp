<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<!-- css, js 파일포함 -->
<%@include file="/WEB-INF/views/admin/include/header_info.jsp" %>
<script src="/bower_components/ckeditor/ckeditor.js"></script>

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
	      <ol class="breadcrumb">
	        <li><a href="/admin/slide/slideList"><i class="fa fa-dashboard"></i> slide list</a></li>
	        <li class="active">Here</li>
	      </ol>
	    </section>
	
	    <!-- Main content -->
	    <section class="content container-fluid">
	
		<h3>슬라이드 등록</h3>
		  <form action="slideInsert" method="post" id="joinForm" enctype="multipart/form-data">
			 <div class="form-row">
			    <div class="col-md-3">
				    <label for="slide_num">슬라이드 코드</label>
				    <input type="text" class="form-control" id="slide_num" name="slide_num" placeholder="자동순번입력">
				</div>
				<div class="col-md-6">
				    <label for="slide_name">슬라이드 이미지명</label>
				    <input type="text" class="form-control" id="slide_name" name="slide_name">
				</div>
				<div class="col-md-3">
				    <label for="slide_turn">슬라이드 순번</label>
				    <select class="form-control" id="slide_turn" name="slide_turn">
				    	<option value="N">게시안함</option>
				    	<option value="1">1</option>
				    	<option value="2">2</option>
				    	<option value="3">3</option>
				    </select>
				</div>
			  </div>
			  <div class="form-row" style="background-color: pink;">
			      <div class="col-md-4">
			        <label for="upload">상품이미지</label>
			        <input type="file" id="upload" name="upload">
			  	  </div>
				  <div class="col-md-8">
				      <label for="upload">미리보기</label>
				      <img alt="" src="" id="previewImage">
				  </div>
			  </div>
			  
			  <div class="form-row">
			   <div class="col-md-2">
			      <button type="submit" id="btnProductInsert" class="form-control">상품등록</button>
			   </div>
			   <div class="col-md-10">
			      <label for=""></label>
			      <input type="hidden" class="form-control" id="" name="">
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

<!-- 상품이미지 미리보기 -->
<script>
    function readImage(input) {
      if (input.files && input.files[0]) {
          
        //let imgPath = input.files[0].value;
        let imgPath = $("#upload").val();
        alert(imgPath);
        //return;
        let ext = imgPath.substring(imgPath.lastIndexOf(".")+1).toLowerCase();
        alert(ext);
        if(typeof(FileReader) == "undefined") {
          alert("브라우저가 작업을 지원안합니다.");
          return;
        }

        if(ext == "gif" || ext == "png" || ext == "jpg" || ext == "jpeg" ) {
          
          const reader = new FileReader();
          

          //이벤트 설정. reader객체가 이미지파일을 성공적으로 읽어들였을 때 발생하는 이벤트
          reader.onload = (e) => {
              //alert("onload");
              const previewImage = document.getElementById('previewImage');
              previewImage.src = e.target.result;
          }

          // reader객체가 파일을 읽어들이는 작업
          reader.readAsDataURL(input.files[0]);
        }else{
          $("#upload").val("");
          alert("이미지 파일을 선택하세요.");
        }
      }
    }
    // 이벤트 리스너
    document.getElementById('upload').addEventListener('change', (e) => {
        readImage(e.target);
    })

</script>

<script>
	$(document).ready(function(){
		
		let ckeditor_config = {
			resize_enabled : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			toolbarCanCollapse : true,
			removePlugins : "elementspath",
			
			filebrowserUploadUrl : "editor/imageUpload"  // /editor/imageUpload. 이미지 업로드시 업로드탭 보기
				
		};
		
		CKEDITOR.replace('pro_content', ckeditor_config);
		
	});
</script>

</body>
</html>
