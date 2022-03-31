<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- css, js 파일포함 -->
	<%@include file="/WEB-INF/views/admin/include/header_info.jsp" %>
	
	<style>
		.productListBody {
			font-size: 13px;
			color: black;
		}
	</style>
	
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
      <h5 style="font-weight:bold;">주문 관리<small style="margin-left:10px;">주문리스트</small></h5>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
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
												<th>주문일</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">주문번호</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">주문자명</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">주문방법</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">주문금액</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">주문상태</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">기능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orderList }" var="orderVO" varStatus="status">
												<tr role="row" class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
													<td><input type="checkbox" class="check" value='<c:out value="${orderVO.ord_code }"></c:out>'></td>
													<td class="sorting_1"><fmt:formatDate value="${orderVO.ord_regdate }" pattern="yyyy-MM-dd mm:hh" /></td>
													<td><a class="move" href="<c:out value="${orderVO.ord_code }"></c:out>">${orderVO.ord_code } </a></td>
													<td><span><c:out value="${orderVO.ord_name }" /></span></td>
													<td>주문방법</td>
													<td><span><c:out value="${orderVO.ord_price }"></c:out></span></td>
													<td>
														<select name="ord_state">
															<option value=""          <c:out value="${orderVO.ord_state == null?         'selected':'' }" />>주문상태 선택</option>
															<option value="주문접수"   <c:out value="${orderVO.ord_state eq '주문접수'?   'selected':'' }" />>주문접수</option>
															<option value="결제완료"   <c:out value="${orderVO.ord_state eq '결제완료'?   'selected':'' }" />>결제완료</option>
															<option value="배송준비중" <c:out value="${orderVO.ord_state eq '배송준비중'? 'selected':'' }" />>배송준비중</option>
															<option value="배송처리"   <c:out value="${orderVO.ord_state eq '배송처리'?   'selected':'' }" />>배송처리</option>
															<option value="배송완료"   <c:out value="${orderVO.ord_state eq '배송완료'?   'selected':'' }" />>배송완료</option>
															<option value="주문취소"   <c:out value="${orderVO.ord_state eq '주문취소'?   'selected':'' }" />>주문취소</option>
															<option value="취소요청"   <c:out value="${orderVO.ord_state eq '취소요청'?   'selected':'' }" />>취소요청</option>
															<option value="취소완료"   <c:out value="${orderVO.ord_state eq '취소완료'?   'selected':'' }" />>취소완료</option>
															<option value="교환요청"   <c:out value="${orderVO.ord_state eq '교환요청'?   'selected':'' }" />>교환요청</option>
															<option value="교환완료"   <c:out value="${orderVO.ord_state eq '교환완료'?   'selected':'' }" />>교환완료</option>
														</select>
													</td>
													<td>
														<input type="button" name="btnOrderStateChange" value="적용" data-ord_code="${orderVO.ord_code }">
														<input type="button" name="btnOrderDetail" value="상세보기">
													</td>
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
											<option value=""   <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--</option>
											<option value="N"  <c:out value="${pageMaker.cri.type eq 'N'?  'selected':'' }" />>상품명</option>
											<option value="P"  <c:out value="${pageMaker.cri.type eq 'P'?  'selected':'' }" />>거래처</option>
										</select>
										<input type="text"   name="keyword" value="<c:out value="${pageMaker.cri.keyword}" />">
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
										<input type="hidden" name="amount"  value="${pageMaker.cri.amount}">
										<button class="btn btn-primary">Search</button>
									</form>
								</div>
								
								<div class="col-sm-4">
									<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
										<ul class="pagination">
											<c:if test="${pageMaker.prev }">
												<li class='paginate_button previous ${pageMaker.prev ? "": "disabled" }' id="example2_previous">
													<a href="${pageMaker.startPage - 1}" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
												</li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
												<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'>
													<a href="${num}" aria-controls="example2" data-dt-idx="1" tabindex="0">${num}</a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next }">
												<li class="paginate_button next" id="example2_next">
													<a href="${pageMaker.endPage + 1}" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a>
												</li>
											</c:if>
										</ul>
									</div>
								</div>
								
								<div class="col-sm-4">
									<div>
										<input type="button" id="btnCheckDelete" value="선택삭제">
										<input type="button" name="btnOrderStateAll" id="btnOrderStateAll" value="상태일괄변경">
									</div>
								</div>
								
								<form id="actionForm" action="/admin/order/orderList" method="get">
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
									<input type="hidden" name="amount"  value="${pageMaker.cri.amount}">
									<input type="hidden" name="type"    value="${pageMaker.cri.type}">
									<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
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
		/*전체선택 체크박스 클릭*/
		$("#checkAll").on("click", function(){
			$(".check").prop("checked", this.checked);

			isCheck = this.checked;
		});

		// 데이터행 체크박스 클릭
		$(".check").on("click", function(){
			
			$("#checkAll").prop("checked", this.checked);

				$(".check").each(function(){
				if(!$(this).is(":checked")) {		// 체크박스중 하나라도 해제된 상태라면  false
					$("#checkAll").prop("checked", false);
				}

			});
		});



		let actionForm = $("#actionForm");
		//페이지번호 클릭시 : 선택한 페이지번호, 페이징정보, 검색정보
		$(".paginate_button a").on("click", function(e){
			e.preventDefault(); // <a href="">기능취소
			//기존 페이지번호를 사용자가 선택한 페이지번호로 변경
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();


		});


		$("#btnCheckDelete").on("click", function(){
			if($(".check:checked").length == 0){
				alert("삭제할 상품을 선택하세요.");
				return;
			}

			let isDel = confirm("선택한 상품을 삭제하겠습까?");

			if(!isDel) return;

			// 데이터행에서 체크된 상품코드, 상품이미지

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

			/*
			$("table tbody").find("동적").each(function() {

			});
			*/


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

						// 리스트주소 이동 또는 선택된 행을 동적삭제.
						//location.href= "주소";
						
						console.log($(".check:checked").length);
						//테이블의 행을 의미하는 <tr>태그 제거.
						$(".check:checked").each(function(){
							$(this).parent().parent().remove();
						});
					}
				}
			});
		});
		
		//수정버튼 클릭시
		$("input[name='btnProductModify']").on("click", function(){

			let pro_num = $(this).data("pro_num");
			
			/*
			let url = "/admin/product/productModify?pro_num=" + pro_num;
			location.href = url;
			*/
			actionForm.attr("action", "/admin/product/productModify");
			actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
			actionForm.submit();

		});
		
		//삭제버튼 클릭시
		$("input[name='btnProductDelete']").on("click", function(){

			
			if(!confirm("삭제하겠읍니까?")) return;

			let pro_num = $(this).data("pro_num");

			/*
			let url = "/admin/product/productModify?pro_num=" + pro_num;
			location.href = url;
			*/
			actionForm.attr("action", "/admin/product/productDelete");
			actionForm.attr("method", "post");
			actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
			actionForm.submit();

		});

		$("#btnOrderStateAll").on("click", function(){
			if($(".check:checked").length == 0){
				alert("주문상태변경 항목을 선택하세요.");
				return;
			}

			//자바스크립트 배열
			let ord_codeArr = []; //주문번호 배열
			let ord_StateArr = []; //주문상태 배열
			

			//선택된 체크박스 일 경우
			$(".check:checked").each(function(){
				let ord_code = $(this).val();
				let ord_state = $(this).parent().parent().find("select[name='ord_state']").val();

				ord_codeArr.push(ord_code);
				ord_StateArr.push(ord_state);
				
			})

			console.log(ord_codeArr);
			console.log(ord_StateArr);

			$.ajax({
				url: '/admin/order/orderStateAll',
				type:'post',
				dataType: 'text',
				data:  {
					ord_codeArr : ord_codeArr,
					ord_StateArr : ord_StateArr
				},
				success: function(data){
					if(data == "success") {
						alert("선택된 항목이 주문상태가 변경됨");
					}
				}
			});
		});

		//주문상태변경
		$("input[name='btnOrderStateChange']").on("click", function(){
			
			if($(".check:checked").length == 0){
				alert("주문상태변경 항목을 선택하세요.");
				return;
			}
			
			let ord_code = $(this).data("ord_code");
			let ord_state = $(this).parent().parent().find("select[name='ord_state']").val();

			console.log(ord_code + "," + ord_state);

			//자바스크립트 배열
			let ord_codeArr = []; //주문번호 배열
			ord_codeArr.push(ord_code);
			let ord_StateArr = []; //주문상태 배열
			ord_StateArr.push(ord_state);

			$.ajax({
				url: '/admin/order/orderStateAll',
				type:'post',
				dataType: 'text',
				data:  {
					ord_codeArr : ord_codeArr,
					ord_StateArr : ord_StateArr
				},
				success: function(data){
					if(data == "success") {
						alert("주문상태가 변경됨");									
					}
				}
			});
		});

	});
</script>
	
</body>
</html>
