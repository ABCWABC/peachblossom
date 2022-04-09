<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<!-- header style -->
<style>
	.header {
		/* position: fixed; */
	}
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
	
	#logoText{
		margin: 0px 0px 0px 50px;
		font-size: 30px;
		font-weight: 100px;
	}
	
	.nav-tabs {
    	border-bottom: none;
	}
	
	input[name=keyword] {
		height: 25px;
		margin: 7px 0 0 0;
		padding: 2px 2px 2px 7px;
		width: 140px;
		font-size: 12px;
	}
	.nav-item dropdown a {
		font-size: 12px;
	}
</style>
	<div class="header">
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
			  <ul class="nav nav-tabs">
				  <c:forEach items="${userCategory }" var="categoryVO">
					  <li class="nav-item dropdown">
					    <a class="nav-link" data-toggle="dropdown" href="${categoryVO.cate_code }" role="button">${categoryVO.cate_name }</a>
					    <div class="subCategory" id="subCategory_${categoryVO.cate_code }"></div>
					  </li>
				  </c:forEach>
			  </ul>
			</div>
			
			<div class="col-sm-2"> 
			    <!-- 검색창 -->
			    <form id="searchBarForm" name="" action="" method="get" target="_self" enctype="multipart/form-data">
			        <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="검색" value="" type="text">
				</form>
			</div>
	    </div>
	    <!-- //topArea -->
	</div>
<script>
	$(function(){
	  
	  //1차카테고리 클릭시
	  $(".nav .nav-item a.nav-link").on("click", function(){
		console.log("1차카테고리");

		let url = "/product/subCategory/" + $(this).attr("href");
		let curAnchor = $(this); // ajax메서드 호출전에 선택자 this를 전역변수로 받아야 한다.

	      $.getJSON(url, function(data){
			
			// 2차카테고리 정보를 모두 삭제해라.(기존제거)
			$(".nav .nav-item div.subCategory").each(function(){
				
				$(this).empty();
			});


	        //subCategoryBindingView(data, $("#subCategory"), $("#subCategoryTemplate"));
			let subCategoryStr = "";
			for(let i=0; i<data.length; i++) {
				//data[i].cate_code;
				//data[i].cate_name;
				let selector = "#subCategory_" + data[i].cate_prt_code;
				//selector.css("display", "inline");
				//console.log("선택자: " + selector)
				//$(selector).empty();
				subCategoryStr = "<a class='sub_cate' href='" + data[i].cate_code + "'>" + data[i].cate_name + "</a>";
				$(selector).append(subCategoryStr);
			}
			
			
			/*
			curAnchor.next().empty();
			curAnchor.next().append(subCategoryStr);
			*/

	      });
	  });
	
		//
		$('.nav .nav-item a.nav-link').on("mouseover",".secondArea > div",function(e){
			$(this).stop().animate({height: '300px;'}, 300);
		}).on("mouseout",".secondArea > div",function(e){
			$(this).stop().animate({height: '35px;'});
		});
		
		
		$('.nav .nav-item').on("mouseover", ".secondArea > div", function(){
			console.log("123");
			$(this).stop().animate({height: '300px;'}, 300);
		}).on("mouseout", ".secondArea > div" ,function(){
			$(this).stop().animate({height: '35px;'});
		});
		
		
		$('.nav .nav-item a.nav-link').mouseover(function(){
			$(".secondArea div").stop().animate({height: '300px;'}, 300);
		}).mouseout(function(){
			$(".secondArea div").stop().animate({height: '35px;'}, 300);
		});
		
	  
		//1차카테고리 클릭시
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
					subCategoryStr = "<a class='sub_cate' href='" + data[i].cate_code + "'>" + data[i].cate_name + "</a><br>";
					$(selector).append(subCategoryStr);
				}
			});
		});

		$("li.subCategory").on("click", "a.sub_cate", function(e){
			e.preventDefault();
			
			//console.log("2차카테고리 클릭");
			location.href = "/product/productList?cate_code=" + $(this).attr("href");
		});
	});
  </script>
    
    