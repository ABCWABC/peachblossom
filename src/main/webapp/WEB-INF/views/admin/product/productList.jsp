<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
	<!-- css, js 파일포함 -->
	<%@include file="/WEB-INF/views/admin/include/header_info.jsp" %>
	
	<style>
		.productListBody {
			font-size: 13px;
			color: black;
		}
		img[name="proudctImage"] {
			width: 50px;
			height: auto;
		}
	</style>
	
	<script>
	
		let msg = '${msg}';
		
		if(msg == "insertOk") {
			alert("상품등록 성공");
		}else if(msg == "modifyOk") {
			alert("상품수정 성공");
		}else if(msg == "deleteOk") {
			alert("상품삭제성공");
		}
	
	</script>
</head>

<body class="hold-transition skin-blue sidebar-mini productListBody">

<div class="wrapper">

  <!-- Main Header -->
  <%@include file="/WEB-INF/views/admin/include/header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="/WEB-INF/views/admin/include/left_menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h5 style="font-weight:bold;">상품등록 관리<small style="margin-left:10px;">상품리스트</small></h5>
      <ol class="breadcrumb">
        <li><a href="/admin/main"><i class="fa fa-dashboard"></i>관리자 메인페이지</a></li>
        <li class="active">상품리스트</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
	
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6"></div>
								<div class="col-sm-6"></div>
							</div>
							
							<div class="row">
								<div class="col-sm-12">
									<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
										<thead>
											<tr role="row">
												<th><input type="checkbox" id="checkAll" name="checkAll"></th>
												<th>번호</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">상품명</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">등록일</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">가격</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">재고</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">진열</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">수정</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${productList }" var="productVO" varStatus="status">
												<tr role="row">
													<td>
														<input type="checkbox" class="check" value='<c:out value="${productVO.pro_num }"></c:out>'>
														<input type="hidden" name="pro_img" value='<c:out value="${productVO.pro_img }"></c:out>'>
														<input type="hidden" name="pro_uploadpath" value='<c:out value="${productVO.pro_uploadpath }"></c:out>'>
													</td>
													<td><c:out value="${productVO.pro_num }"></c:out></td>
													<td>
													<a href="<c:out value="${productVO.pro_num }"></c:out>">
														<!-- 
														<img name="proudctImage" src="/admin/product/displayFile?fileName=s_<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
														 -->
														<img name="proudctImage" src="/admin/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
													</a>
														<span> <c:out value="${productVO.pro_name }"></c:out></span>
														<input type="hidden" style="width:200px;" value='<c:out value="${productVO.pro_name }"></c:out>'>
													</td>
													
													<td><fmt:formatDate value="${productVO.pro_date }" pattern="yyyy-MM-dd" /><br><fmt:formatDate value="${productVO.pro_date }" pattern="hh:mm:ss" /></td>
													<td>
														<span><c:out value="${productVO.pro_price }"></c:out></span>
														<input type="hidden" value='<c:out value="${productVO.pro_price }"></c:out>'></td>
													<td>
														<span><c:out value="${productVO.pro_amount }"></c:out></span>
														<input type="hidden" value='<c:out value="${productVO.pro_amount }"></c:out>'>
													</td>
													<td>
														<input type="checkbox" value="<c:out value="${productVO.pro_buy }"></c:out>" 
															<c:out value="${productVO.pro_buy == 'Y' ? 'checked': '' }"></c:out>>
													</td>
													<td><input type="button" name="btnProductModify" value="수정" data-pro_num='<c:out value="${productVO.pro_num }"></c:out>'></td>
													<td><input type="button" name="btnProductDelete" value="삭제" data-pro_num='<c:out value="${productVO.pro_num }"></c:out>'></td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-4 dataTables_info">
							
									<form id="searchForm" action="/admin/product/productList" method="get">
										<select name="type">
											<option value=""
												<c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--</option>
											<option value="N"
												<c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
											<option value="P"
												<c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>거래처</option>
										</select>
										<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}" />">
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
										<button class="btn btn-primary">Search</button>
									</form>
								</div>
								
								<div class="col-sm-6">
									<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
										<ul class="pagination">
										<c:if test="${pageMaker.prev }">
											<li class='paginate_button previous ${pageMaker.prev ? "": "disabled" }' id="example2_previous">
												<a href="${pageMaker.startPage - 1}" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
											</li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">	
											<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
												<a href="${num}" aria-controls="example2" data-dt-idx="1" tabindex="0">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next }">	
											<li class="paginate_button next" id="example2_next">
												<a href="${pageMaker.endPage + 1}" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a>
											</li>
										</c:if>
										</ul>
									</div>
								</div>
								
								<div class="col-sm-2">
									<div>
										<input type="button" id="btnCheckDelete" value="선택삭제">
									</div>
								</div>
								
								<!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
								<form id="actionForm" action="/admin/product/productList" method="get">
									<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
									<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
									<input type="hidden" name="type" value="${pageMaker.cri.type}">
									<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
									<!--글번호추가-->
								</form>


							</div>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
			</div>
			<!-- /.col -->
		</div>
	
	
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

<script>

	$(document).ready(function(){

		let isCheck = true;
		
		$("#checkAll").on("click", function(){
			$(".check").prop("checked", this.checked);

			isCheck = this.checked;
		});

		$(".check").on("click", function(){
			$("#checkAll").prop("checked", this.checked);

				$(".check").each(function(){
				if(!$(this).is(":checked")) {		// 체크박스중 하나라도 해제된 상태라면  false
					$("#checkAll").prop("checked", false);
				}
			});
		});

		let actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){  //페이지번호 클릭시 : 선택한 페이지번호, 페이징정보, 검색정보
			e.preventDefault();
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));  //기존 페이지번호를 사용자가 선택한 페이지번호로 변경
			actionForm.submit();
		});

		$("#btnCheckDelete").on("click", function(){
			if($(".check:checked").length == 0){
				alert("삭제할 상품을 선택하세요.");
				return;
			}

			let isDel = confirm("선택한 상품을 삭제하시겠습니까?");

			if(!isDel) return;

			//자바스크립트 배열
			let pro_numArr = []; //상품코드 배열
			let pro_imgArr = []; //상품이미지 배열
			let pro_uploadpathArr = []; //날짜폴더이름 

			//선택된 체크박스 일 경우
			$(".check:checked").each(function(){
				let pro_num = $(this).val();
				let pro_img = $(this).next().val();
				let pro_uploadpath = $(this).next().next().val();

				pro_numArr.push(pro_num);
				pro_imgArr.push(pro_img);
				pro_uploadpathArr.push(pro_uploadpath);
			})

			$.ajax({
				url: '/admin/product/checkDelete',
				type:'post',
				dataType: 'text',
				data:  {
					pro_numArr : pro_numArr,
					pro_imgArr : pro_imgArr,
					pro_uploadpathArr : pro_uploadpathArr
				},
				success: function(data){
					if(data == "success") {
						alert("선택된 상품이 삭제됨");
						console.log($(".check:checked").length);
						
						$(".check:checked").each(function(){      //테이블의 행을 의미하는 <tr>태그 제거.
							$(this).parent().parent().remove();
						});
					}
				}
			});
		});
		
		//수정버튼 클릭시
		$("input[name='btnProductModify']").on("click", function(){

			let pro_num = $(this).data("pro_num");
			
			actionForm.attr("action", "/admin/product/productModify");
			actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
			actionForm.submit();

		});
		
		//삭제버튼 클릭시
		$("input[name='btnProductDelete']").on("click", function(){

			if(!confirm("삭제하시겠습니까?")) return;

			let pro_num = $(this).data("pro_num");

			actionForm.attr("action", "/admin/product/productDelete");
			actionForm.attr("method", "post");
			actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
			actionForm.submit();

		});

	});

</script>
</body>
</html>
