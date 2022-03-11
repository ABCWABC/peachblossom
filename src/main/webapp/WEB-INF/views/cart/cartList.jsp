<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
  </head>

<body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container">

  <div class="row">
  	<div class="col-sm-12">
  	<h4>장바구니</h4>
  	</div>
  </div>
  <div class="row">
	<div class="col-sm-12">
		<table id="example2"
			class="table table-bordered table-hover dataTable"
			role="grid" aria-describedby="example2_info">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">상품이미지</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">상품명</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">판매가</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">수량</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">합계</th>
					<th><input type="checkbox" id="checkAll" name="checkAll"></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty cartList}">
					<tr role="row" class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td colspan="6">장바구니가 비워있읍니다.</td>
					</tr>
				</c:if>
				
				
				<c:if test="${not empty cartList}">
				<c:forEach items="${cartList }" var="cartListVO" varStatus="status">
					<tr role="row"
						class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td>
							<a class="move" href="<c:out value="${cartListVO.pro_num }"></c:out>">
								<img name="proudctImage" src="/cart/displayFile?fileName=s_<c:out value="${cartListVO.pro_img }"></c:out>&uploadPath=<c:out value="${cartListVO.pro_uploadpath }"></c:out>">
							</a>
						</td>
						<td>
							<input type="text" value='<c:out value="${cartListVO.pro_name }"></c:out>' readonly>
						</td>
						<td>
							<span class="pro_price"><c:out value="${cartListVO.pro_price }"></c:out></span>
							<input type=""hidden name="" value="<c:out value="${cartListVO.pro_price }"></c:out>">
						</td>
						<td>
							<input type="number" name="cart_amount" value='<c:out value="${cartListVO.cart_amount }"></c:out>'>
							<input type="button" value="수정">
						</td>
						<td>
								<span class="sum_price"><c:out value="${cartListVO.pro_price * cartListVO.cart_amount }"></c:out></span>
						</td>
						<td><input type="checkbox" value="<c:out value="${cartListVO.cart_code }" />"></td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="6">합계 : <span id="cart_total_price"></span></td>
					</tr>
					<tr>
						<td colspan="6">
							<input type="button" value="주문하기">
							<input type="button" value="장바구니비우기">
							<input type="btnCheckDelete" value="선택삭제">
						</td>
					</tr>
				</c:if>
			</tbody>

		</table>
	</div>
	</div>
      <%@include file="/WEB-INF/views/include/footer.jsp" %>
    </div>

   
    <script>

		$(function(){
			
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
			
			
			

			cartTotalPrice();

			// 장바구니 수량변경을 클릭
			$("input[name='cart_amount']").on("change", function(){

				
				let pro_price = $(this).parent().parent().find("td span.pro_price").text();
				let sum_price = pro_price * $(this).val();

				$(this).parent().parent().find("td span.sum_price").text(sum_price);

				cartTotalPrice();

			});
		});

		
		// 장바구니 선택삭제
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

			//console.log("상품코드: " + pro_numArr);
			//console.log("상품이미지: " + pro_imgArr);

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


		
		

		// 장바구니 전체금액
		let cartTotalPrice = function() {

			let totalPrice = 0;
			$("span.sum_price").each(function(){
				totalPrice += parseInt($(this).text());
			});

			$("#cart_total_price").text(totalPrice);

		}

	</script>
  </body>
</html>
