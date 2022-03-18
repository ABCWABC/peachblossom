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
    
  </head>

  <body>
	<%@include file="/WEB-INF/views/include/header.jsp" %>

	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		
	</div>

	<div class="container">

		<div class="row">
			<c:forEach items="${productList }" var="productVO" varStatus="status">
				<div class="col-md-3">
					<div class="card mb-4 shadow-sm">
					    
					<img name="proudctImage" width="100%" height="300" src="/product/displayFile?fileName=s_<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
						<div class="card-body">
							<p class="card-text">
								<a href="${productVO.pro_num }" class="proDetail">
									<c:out value="${productVO.pro_name }"></c:out>
								</a>
								<br>
								<fmt:formatNumber type="currency" value="${productVO.pro_price }" /> 
								<input type="hidden" name="pro_num" value="${productVO.pro_num }">
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" name="btnBuyAdd" class="btn btn-sm btn-outline-secondary">Buy</button>
									<button type="button" name="btnCartAdd" class="btn btn-sm btn-outline-secondary">Cart</button>
								</div>
								<small class="text-muted">9 mins</small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach> 
		</div>
		
		<!-- 페이징 출력 -->
      <div class="row">
      	<div class="col-sm-5"></div>
      	
      	<div class="col-sm-2">								
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
		<!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
		<form id="actionForm" action="/product/productList" method="get">
			<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="cate_code" value="${cate_code }">
			
			<!--글번호추가-->
		</form>
		<div class="col-sm-5"></div>
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
        
        let actionForm = $("#actionForm");
        
		//페이지번호 클릭시 : 선택한 페이지번호, 페이징정보, 검색정보
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
