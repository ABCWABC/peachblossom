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
      
      .cartTitle {
      	margin-bottom: 30px;
      }
      
      table, tr, th, td {
      	font-size: 12px;
      }
      img[name="proudctImage"] {
      	width: 80px;
      	height: auto;
      }
    </style>

  </head>

<body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="cartListBody container">

  <div class="row cartTitle">
  	<div class="col-sm-12">
  		<h5 style="text-align:center;">CART</h5>
  	</div>
  </div>
  <div class="row">
	<div class="col-sm-12">
		<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
			<thead>
				<tr role="row">
					<th><input type="checkbox" id="checkAll" name="checkAll"></th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">상품이미지</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">상품명</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">판매가</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">수량</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">합계</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty cartList}">
					<tr role="row" class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td colspan="6">장바구니가 비워져있습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${not empty cartList}">
				<c:forEach items="${cartList }" var="cartListVO" varStatus="status">
					<tr role="row" class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td><input type="checkbox" class="check" value="<c:out value="${cartListVO.cart_code }" />"></td>
						<td>
							<a class="pro_num" href="<c:out value="${cartListVO.pro_num }"></c:out>">
								<!-- <img name="proudctImage" src="/cart/displayFile?fileName=s_<c:out value="${cartListVO.pro_img }"></c:out>&uploadPath=<c:out value="${cartListVO.pro_uploadpath }"></c:out>"> -->
								<img name="proudctImage" src="/cart/displayFile?fileName=<c:out value="${cartListVO.pro_img }"></c:out>&uploadPath=<c:out value="${cartListVO.pro_uploadpath }"></c:out>">
							</a>
						</td>
						<td>
							<span class="pro_name"><c:out value="${cartListVO.pro_name }"></c:out></span>
							<input type="hidden" value='<c:out value="${cartListVO.pro_name }"></c:out>'>
						</td>
						<td>
							<span class="pro_price"><c:out value="${cartListVO.pro_price }"></c:out></span>
							<input type="hidden" name="" value="<c:out value="${cartListVO.pro_price }"></c:out>">
						</td>
						<td>
							<input type="number" name="cart_amount" value='<c:out value="${cartListVO.cart_amount }"></c:out>'>
							<input type="button" name="cart_amount_btn" value="변경">
						</td>
						<td>
							<span class="sum_price"><c:out value="${cartListVO.pro_price * cartListVO.cart_amount }"></c:out></span>
						</td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="6">합계 : <span id="cart_total_price"></span> 원</td>
					</tr>
					<tr>
						<td colspan="6">
							<input type="button" id="btnOrderAdd" value="주문하기">
							<input type="button" id="btnCartAllDelete" value="장바구니비우기">
							<input type="button" id="btnCheckDelete" value="선택삭제">
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
			
			//전체선택 체크박스 클릭
			$("#checkAll").on("click", function(){
				$(".check").prop("checked", this.checked);

				isCheck = this.checked;
			});

			//개별 체크박스 클릭
			$(".check").on("click", function(){
				
				$("#checkAll").prop("checked", this.checked);

				$(".check").each(function(){
					if(!$(this).is(":checked")) {		
						$("#checkAll").prop("checked", false);
					}
				});
			});

			//장바구니 전체금액
			let cartTotalPrice = function() {

				let totalPrice = 0;
				$("span.sum_price").each(function(){
					totalPrice += parseInt($(this).text());
				});

				$("#cart_total_price").text(totalPrice);

			}
			cartTotalPrice();

			//장바구니 수량변경시 금액 변경 처리
			$("input[name='cart_amount']").on("change", function(){
				
				let pro_price = $(this).parent().parent().find("td span.pro_price").text();
				let sum_price = pro_price * $(this).val();

				$(this).parent().parent().find("td span.sum_price").text(sum_price);

				cartTotalPrice();
			});
			
			//장바구니 수량변경 처리
			$("input[name='cart_amount_btn']").on("click", function(){
				
				let pro_num = parseInt($(this).parent().parent().find("td a.pro_num").attr("href"));
				let cart_amount = parseInt($(this).parent().parent().find("input[name='cart_amount']").val());
				
				$.ajax({
					url: '/cart/cartAmountModify',
					type:'post',
					dataType: 'text',
					data:  { pro_num : pro_num , cart_amount : cart_amount },
					success: function(data){
						if(data == "success") {
							alert("수량변경되었습니다");
						}
					}
				});
			});
		
			//장바구니 선택삭제
			$("#btnCheckDelete").on("click", function(){
				
				if($(".check:checked").length == 0){
					alert("삭제할 상품을 선택하세요.");
					return;
				}
	
				let isDel = confirm("선택한 상품을 삭제하시겠습니까?");
	
				if(!isDel) return;
	
				let cart_codeArr = [];
	
				$(".check:checked").each(function(){
					let cart_code = $(this).val();
					cart_codeArr.push(cart_code);
				})
	
				$.ajax({
					url: '/cart/checkDelete',
					type:'post',
					dataType: 'text',
					data:  { cart_codeArr : cart_codeArr },
					success: function(data){
						if(data == "success") {
							alert("선택된 장바구니 상품이 삭제됨");
							
							console.log($(".check:checked").length);
							
							$(".check:checked").each(function(){                //테이블의 행을 의미하는 <tr>태그 제거.
								$(this).parent().parent().remove();
							});
							
							cartTotalPrice();
						}
					}
				});
			});		
			
			//장바구니 비우기
			$("#btnCartAllDelete").on("click", function(){
				
				if(${fn:length(cartList) } == 0){
					alert("장바구니가 비어있습니다.");
					return;
				}
					
				if(!confirm("장바구니를 비우시겠습니까?")) return;

				location.href = "/cart/cartAllDelete";
			});
			
			//주문하기
			$("#btnOrderAdd").on("click", function(){
				location.href = "/order/orderInfo?type=cart_order";
			});		
		});

	</script>
  </body>
</html>
