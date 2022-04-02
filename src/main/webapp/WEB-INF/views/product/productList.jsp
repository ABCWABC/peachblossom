<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>peach blossom</title>

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    <%@include file="/WEB-INF/views/include/productArrange_css.jsp" %>
    
  </head>

  <body>
	<%@include file="/WEB-INF/views/include/header.jsp" %>

	<div class="ec-base-product">
	<ul class="prdList grid4">
		<c:forEach items="${productList }" var="productVO" varStatus="status">
			<li id="anchorBoxId_15159" class="xans-record-">
				<div class="box card-body">
					<div class="thumbnail">
						<div class="prdImg">
							<a href="${productVO.pro_num }" class="proDetail">
								<!-- 썸네일로 용량줄이고 싶을경우 사용 (대신 gif파일 사용불가, 화질흐림)
									<img class="thumb" src="/product/displayFile?fileName=s_<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
								 -->
								<img class="thumb" src="/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
							</a>
						</div>
					</div>
					<div class="description">  <!-- http://localhost:8888/product/productDetail?pageNum=1&amount=8&cate_code=7&pro_num=42 -->
						<div class="txt">
							<p class="name">
								<a href="${productVO.pro_num }" class="proDetail">
									<span style="font-size: 12px; color: #333333; font-weight: bold;"><c:out value="${productVO.pro_name }"></c:out></span>
								</a>
							</p>
							<input type="hidden" name="pro_num" value="${productVO.pro_num }">
							<ul class="xans-element- xans-product xans-product-listitem-2 xans-product-listitem xans-product-2 spec">
								<li rel="판매가" class=" xans-record-">
									<span style="font-size: 12px; color: #555555; font-weight: bold; text-decoration: line-through;"><fmt:formatNumber type="number" pattern="#,###" value="${productVO.pro_price }" />원</span>
									<span id="span_product_tax_type_text" style="text-decoration: line-through;"> </span>
								</li>
								<li rel="할인판매가" class=" xans-record-" style="margin-bottom:10px;">
									<strong class="title ">
										<span style="font-size: 12px; color: #555555;">할인판매가</span> :
									</strong>
									<span style="font-size: 12px; color: #555555;">
										<fmt:parseNumber var="pro_disPrice" value="${productVO.pro_price - productVO.pro_price * (productVO.pro_discount*0.01) }" integerOnly="true" />
										<fmt:formatNumber type="number" pattern="#,###" value="${pro_disPrice }" />원
										<span style="font-size: 11px; color: #c19361;">(
											<fmt:parseNumber var="disPrice" value="${productVO.pro_price * (productVO.pro_discount*0.01) }" integerOnly="true" />
											<fmt:formatNumber type="number" pattern="#,###" value="${disPrice }" />원 할인)
										</span>
									</span>
								</li>
								<li class="btn-group">
				                	<button type="button" name="btnBuyAdd" class="">Buy</button>
				                	<button type="button" name="btnCartAdd" class="">Cart</button>
				                </li>
							</ul>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	</div>
	

	<div class="container">

		<!-- 페이징 출력 -->
      <div class="row">
      	<div class="col-sm-3"></div>
      	
      	<div class="col-sm-6">								
			<div class="ec-base-paginate" id="example2_paginate">
				<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class='paginate_button previous ${pageMaker.prev ? "": "disabled" }' id="example2_previous">
						<a href="${pageMaker.startPage - 1}" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">	
					<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }'>
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
		<!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
		<form id="actionForm" action="/product/productList" method="get">
			<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="cate_code" value="${cate_code }">
			
			<!--글번호추가-->
		</form>
		
		<div class="col-sm-3"></div>
      </div>
		
		<%@include file="/WEB-INF/views/include/footer.jsp" %>
	</div>

    <script>

      $(function(){

        //장바구니 담기
        $("button[name='btnCartAdd']").on("click", function(){
            
	        let pro_num = $(this).parents("div.card-body").find("input[name='pro_num']").val();
	            
	        $.ajax({
	           url: '/cart/cartAdd',
	           type: 'post',
	           dataType: 'text',
	           data: {pro_num: pro_num, cart_amount : 1},
	           success: function(data) {
	             if(data == "success") {
	               if(confirm("장바구니에 추가되었습니다.\n 지금 확인하겠습니까?")){
	                 location.href = "/cart/cartList";
	               }
	             }
	           }
	        });
        });
        
        //구매하기
        $("button[name='btnBuyAdd']").on("click", function(){
        	
        	let pro_num = $(this).parents("div.card-body").find("input[name='pro_num']").val();
            let pro_amount = 1;
            location.href = "/order/orderInfo?type=direct&pro_num="+pro_num+"&pro_amount="+ pro_amount;
        });
        
        let actionForm = $("#actionForm");
        
		$(".paginate_button a").on("click", function(e){
			
			e.preventDefault();
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
    	});
        
		//상세페이지 이동
	    $("a.proDetail").on("click", function(e){
	    	
		    e.preventDefault();
		    let pro_num = $(this).attr("href");
		    actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
		    actionForm.attr("action", "/product/productDetail");
		    actionForm.submit();
	    });
		
      });
      
    </script>
    
  </body>
</html>
