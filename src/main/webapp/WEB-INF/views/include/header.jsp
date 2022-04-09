<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<!-- header style -->
<style>
	.firstArea {
		padding: 30px 0px 20px 0px; 
	}
	.firstArea a {
	    position: relative;
	    float: left;
	    display: block;
	    color: #858585;
	    font-size: 13px;
	    font-weight: 10px;
	}
	.secondArea {
		margin: 0px 100px 70px 100px;
	    border-bottom: 1px solid #dee2e6;
	}
	.secondArea > div {
		height: 35px;
	}
	#logoText{
		margin: 0px 0px 0px 50px;
		font-size: 30px;
		font-weight: 100px;
	}
	.nav-item a {
		font-size: 12px;
		text-decoration: none;
		color: black;
	}
	input[name=keyword] {
		height: 25px;
		margin: 3px 0 5px 0;
		padding: 2px 2px 2px 7px;
		width: 140px;
		font-size: 12px;
	}
	.subCategory {
		position: absolute;
		background: rgb(240, 240, 240, 0.5);
		display: block;
		z-index: 1;
		min-width: 100px;
	}

</style>
	<div class="header" style="min-width: 1003px;">
		<!-- topArea -->
		<div class="firstArea">
	       <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white">
			  <h5 class="my-0 mr-md-auto font-weight-normal">
			  	<a href="/" id="logoText">PEACH BLOSSOM</a>
			  </h5>
			  <nav class="my-2 my-md-0 mr-md-3">
			  
			    <!-- 로그인 이전상태 표시 -->
			    <c:if test="${sessionScope.loginStatus == null }">
				    <a class="p-2 text-dark" href="/member/login">LOGIN</a>
				    <a class="p-2 text-dark" href="/member/join">JOIN</a>
				    <a class="p-2 text-dark" href="/member/login">CART</a>
				</c:if>
				
				<!-- 로그인 이전상태 표시 -->
			    <c:if test="${sessionScope.loginStatus != null }">
				    <a class="p-2 text-dark" href="/member/logout">LOGOUT</a>
				    <a class="p-2 text-dark" href="/member/modify">MODIFY</a>
				    <a class="p-2 text-dark" href="/cart/cartList">CART(숫자)</a>
				</c:if>
				
				<!-- 로그인여부 상관없이 표시 -->
			    <a class="p-2 text-dark" href="/order/orderInfo">ORDER</a>
			    <a class="p-2 text-dark" href="/member/mypage">MYPAGE</a>
			    <a class="p-2 text-dark" href="#">NOTICE✨</a>
			    <a class="p-2 text-dark" href="#">Q&A</a>
			    <a class="p-2 text-dark" href="#">REVIEW</a>
			    
			  </nav>
		   </div>
	    </div>
	    
	    
	    <div class="row secondArea">
	    
	    	<div class="col-sm-9">
	            <ul class="nav">
	            	<c:forEach items="${userCategory }" var="categoryVO">
						<li class="nav-item">
							<a class="nav-link"  href="${categoryVO.cate_code }">${categoryVO.cate_name }</a>
							<div class="subCategory" id="subCategory_${categoryVO.cate_code }"></div>
						</li>
					</c:forEach>
	            </ul>
			</div>
			
			<div class="col-sm-3"> 
			    <!-- 검색창 -->
			    <form id="searchBarForm" name="" action="" method="get" target="_self" enctype="multipart/form-data">
			        <input type="text" id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="검색" value="">
			        <span id="keywordIcon">&#128270;</span>
				</form>
			</div>
	    </div>
	    <!-- //topArea -->
	</div>
<script>
	$(function(){
	  
		//1차카테고리 클릭시
		/*
		$(".nav .nav-item a.nav-link").on("click", function(e){
		 
			e.preventDefault();
			
			let url = "/product/subCategory/" + $(this).attr("href");
			let curAnchor = $(this);                                   // ajax메서드 호출전에 선택자 this를 전역변수로 받아야 한다.
			
			$.getJSON(url, function(data){
			
				$(".nav .nav-item div.subCategory").each(function(){   // 기존 2차카테고리 정보 모두 삭제
					$(this).empty();
				});
				
				let subCategoryStr = "";
				for(let i=0; i<data.length; i++) {
					let selector = "#subCategory_" + data[i].cate_prt_code;
					subCategoryStr = "<a class='sub_cate' href='" + data[i].cate_code + "'>" + data[i].cate_name + "</a>";
					$(selector).append(subCategoryStr);
				}
			});
		});
		
		$("div.subCategory").on("click", "a.sub_cate", function(e){
		  
			e.preventDefault();
			
			location.href = "/product/productList?cate_code=" + $(this).attr("href");
		});
		*/

		
		//1차카테고리 클릭시
		$(".nav .nav-item a.nav-link").on("mouseenter", function(){
			
			let url = "/product/subCategory/" + $(this).attr("href");
			let curAnchor = $(this);                                   // ajax메서드 호출전에 선택자 this를 전역변수로 받아야 한다.
			
			$.getJSON(url, function(data){
			
				$(".nav .nav-item div.subCategory").each(function(){   // 기존 2차카테고리 정보 모두 삭제
					$(this).empty();
				});
				
				let subCategoryStr = "";
				for(let i=0; i<data.length; i++) {
					let selector = "#subCategory_" + data[i].cate_prt_code;
					subCategoryStr = "<a class='sub_cate' href='" + data[i].cate_code + "'>" + data[i].cate_name + "</a><br>";
					$(selector).append(subCategoryStr);
				}
			});
		});
		
			
		$(".nav .nav-item div.subCategory").on("mouseleave", function(){
		
			let url = "/product/subCategory/" + $(".nav .nav-item a.nav-link").attr("href");
			
			$.getJSON(url, function(data){
				$(".nav .nav-item div.subCategory").each(function(){   // 기존 2차카테고리 정보 모두 삭제
					$(this).empty();
				});
			});
		});
		
		$(".nav .nav-item a.nav-link").on("click", function(e){
			
			e.preventDefault();
			//location.href = "/product/productList?cate_code=" + $(this).attr("href");
		});
		
		$("div.subCategory").on("click", "a.sub_cate", function(e){
		  
			e.preventDefault();
			
			location.href = "/product/productList?cate_code=" + $(this).attr("href");
		});
	});
  </script>
    
    