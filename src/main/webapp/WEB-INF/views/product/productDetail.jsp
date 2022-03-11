<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    

    <!-- Bootstrap core CSS -->
    
    <!-- <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"> -->
    <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css"> -->
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


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Pricing</h1>
  <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It’s built with default Bootstrap components and utilities with little customization.</p>
</div>

<div class="container">
	  <h3>상품상세페이지</h3>
      <div class="row">
      	<div class="col-sm-6">
      		<img name="proudctImage" width="100%" height="225" src="/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
      	</div>
      	<div class="col-sm-2"></div>
      	
      	<div class="col-sm-2">
      		상품코드<br>
      		판매가격<br>
      		주문수량<br>
      	</div>
      	<div class="col-sm-2">
      		${productVO.pro_num }<br>
      		${productVO.pro_price }<br>
      		<input type="number" name="pro_amount" id="pro_amount" value="1"><br><br>
      		 <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" name="btnBuyAdd" class="btn btn-sm btn-outline-secondary">Buy</button>&nbsp;
                  <button type="button" name="btnCartAdd" class="btn btn-sm btn-outline-secondary">Cart</button>&nbsp;
                  <button type="button" name="btnProductist" class="btn btn-sm btn-outline-secondary">List</button>&nbsp;
                </div>
               
             </div>
      	</div>
      </div>
      <div class="row">
      	<h4>상세설명</h4>
      	${productVO.pro_content }
      </div>
      <form id="actionForm" action="" method="get">
        <!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
        
        <!-- Criteria클래스가 기본생성자에 의하여 기본값으로 파라미터가 사용 -->
        
        <c:if test="${type == 'Y' }">
        <input type="hidden" name="pageNum" value="${cri.pageNum}">
        <input type="hidden" name="amount" value="${cri.amount}">
        </c:if>
        
        <input type="hidden" name="cate_code" value="${cate_code}">
			  <!-- 상품코드 동적추가작업 -->
   	 </form>
   	 
   	 <!-- 상품후기 -->
   	 <div class="row" id="product_review">
   	 </div>
   	 
      <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

    <script>

      $(function(){

        let actionForm = $("#actionForm");
        
        //장바구니 담기
        $("button[name='btnCartAdd']").on("click", function(){
            
            let pro_num = $(this).parents("div.card-body").find("input[name='pro_num']").val();
            
           // console.log("상품코드" + pro_num);

           $.ajax({
              url: '/cart/cartAdd',
              type: 'post',
              dataType: 'text',
              data: {pro_num: ${productVO.pro_num }, cart_amount : $("#pro_amount").val()},
              success: function(data) {
                if(data == "success") {
                  if(confirm("장바구니에 추가되었습니다.\n 지금 확인하겠습니까?")){
                    location.href = "/cart/cartList";
                  }
                }
              }
           });
        });

        //리스트 클릭
        $("button[name='btnProductist']").on("click", function(){
          actionForm.attr("action", "/product/productList");
          actionForm.submit();
        });
        
        //상품후기
        $("#product_review").load("/review/productReview"){
        	
        }
                		
      });
    </script>
    
  </body>
</html>
