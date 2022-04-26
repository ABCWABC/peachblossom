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

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

	<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
	<%@include file="/WEB-INF/views/include/productArrange_css.jsp" %>
	
  </head>
  
  <body style="min-width: 1003px;">
  	<%@include file="/WEB-INF/views/include/header.jsp" %>
  	
  	<div class="slideshow carousel slide" id="carouselExampleIndicators">
  		<div class="carousel-indicators">
		    <button type="button" id="indicators1" class="active"></button>
		    <button type="button" id="indicators2"></button>
		    <button type="button" id="indicators3"></button>
  		</div>
  		<div class="slideshow_slides">
  			<a href=""><img alt="" id="Slide1" src="/resources/img/main_image_1.jpg" width="1000px"></a>
  			<a href=""><img alt="" id="Slide2" src="/resources/img/main_image_2.jpg" width="1000px"></a>
  			<a href=""><img alt="" id="Slide3" src="/resources/img/main_image_3.jpg" width="1000px"></a>
  		</div>
  	</div>
	
	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h4>BEST</h4>
		<p style="font-size: 13px;" >가장 사랑받는 제품~@</p>
	</div>
	
	<div class="ec-base-product">
		<ul class="prdList grid4">
			<c:forEach items="${bestProductList }" var="productVO" varStatus="status">
				<li id="anchorBoxId_15159" class="xans-record-">
					<div class="box card-body">
						<div class="thumbnail">
							<div class="prdImg">
								<a href="${productVO.pro_num }" class="proDetailBest">
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
									<a href="${productVO.pro_num }" class="proDetailBest">
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


	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h4>NEW ARRIVALS</h4>
		<p style="font-size: 13px;" >봄신상 :) 가장 최신 제품!</p>
	</div>
	<div class="ec-base-product">
		<ul class="prdList grid4">
			<c:forEach items="${newProductList }" var="productVO" varStatus="status">
				<li id="anchorBoxId_15159" class="xans-record-">
					<div class="box card-body">
						<div class="thumbnail">
							<div class="prdImg">
								<a href="${productVO.pro_num }" class="proDetailNew">
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
									<a href="${productVO.pro_num }" class="proDetailNew">
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
	<!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
	<form id="actionForm" action="/product/productList" method="get">
		<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="amount" value="1">
		<input type="hidden" name="cate_code" value="1">
		
		<!--글번호추가-->
	</form>
	<%@include file="/WEB-INF/views/include/footer.jsp" %>
    
	<script>

		//메인 슬라이드
		$(function(){
			var slides = $(".slideshow img");
			var indicators = $(".carousel-indicators button");
			var slideCount = slides.length;
			var currentIndex = 0;
			var timer = setInterval(showNextSlide, 3500);
			
			slides.eq(currentIndex+1).hide();
			slides.eq(currentIndex+2).hide();
			
			function showNextSlide() {
				var nextIndex = (currentIndex+1) % slideCount;
				
				slides.eq(currentIndex).hide();
				indicators.eq(currentIndex).attr("class","");
				slides.eq(nextIndex).show();
				indicators.eq(nextIndex).attr("class","active");
				currentIndex = nextIndex;
			}
	
	        //슬라이드바 클릭시 처리
	        $("#indicators1").on("click", function() {
	        	showNextSlide().stop();                             //멈춤오류
				$("#indicators1").attr("class","active");
				$("#indicators2").attr("class","");
				$("#indicators3").attr("class","");
				$("#Slide1").show();
				$("#Slide2").hide();
				$("#Slide3").hide();
			});
			$("#indicators2").on("click", function() {
				showNextSlide().stop();
				$("#indicators1").attr("class","");
				$("#indicators2").attr("class","active");
				$("#indicators3").attr("class","");
				$("#Slide1").hide();
				$("#Slide2").show();
				$("#Slide3").hide();
			});
			$("#indicators3").on("click", function() {
				showNextSlide().stop();
				$("#indicators1").attr("class","");
				$("#indicators2").attr("class","");
				$("#indicators3").attr("class","active");
				$("#Slide1").hide();
				$("#Slide2").hide();
				$("#Slide3").show();
			});
			
		});  
    </script>
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
        
		//상세페이지 이동 - Best
	    $("a.proDetailBest").on("click", function(e){
	    	
	    	console.log("123");
	    	
		    e.preventDefault();
		    let pro_num = $(this).attr("href");
		    actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
		    actionForm.attr("action", "/product/productDetail");
		    actionForm.submit();
	    });
		
		//상세페이지 이동 - New
	    $("a.proDetailNew").on("click", function(e){
	    	
	    	console.log("456");
	    	
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
