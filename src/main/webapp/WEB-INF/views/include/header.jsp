<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!-- topArea -->
	<div class="container">
       <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		  <h5 class="my-0 mr-md-auto font-weight-normal">PEACH BLOSSOM</h5>
		  <nav class="my-2 my-md-0 mr-md-3">
		  
		    <!-- 로그인 이전상태 표시 -->
		    <c:if test="${sessionScope.loginStatus == null }">
			    <a class="p-2 text-dark" href="/member/login">LOGIN</a>
			    <a class="p-2 text-dark" href="/member/join">JOIN</a>
			</c:if>
			<!-- 로그인 이전상태 표시 -->
		    <c:if test="${sessionScope.loginStatus != null }">
			    <a class="p-2 text-dark" href="/member/logout">LOGOUT</a>
			    <a class="p-2 text-dark" href="/member/modify">MODIFY</a>
			</c:if>
			<!-- 로그인여부 상관없이 표시 -->
		    <a class="p-2 text-dark" href="#">CART(숫자)</a>
		    <a class="p-2 text-dark" href="#">ORDER</a>
		    <a class="p-2 text-dark" href="/member/mypage">MYPAGE</a>
		    <a class="p-2 text-dark" href="#">NOTICE</a>
		    <a class="p-2 text-dark" href="#">Q&A</a>
		    <a class="p-2 text-dark" href="#">REVIEW</a>
		    
		  </nav>
	   </div>
    </div>
    
    <!-- topArea -->
    <div class="container">
       <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		  <h5 class="my-0 mr-md-auto font-weight-normal"></h5>
		  <nav class="my-2 my-md-0 mr-md-3">
		    <a class="p-2 text-dark" href="#">BEST</a>
		    <a class="p-2 text-dark" href="#">NEW</a>
		    <a class="p-2 text-dark" href="#">TOP</a>
		    <a class="p-2 text-dark" href="#">PANTS</a>
		    <a class="p-2 text-dark" href="#">SHIRTS</a>
		    <a class="p-2 text-dark" href="#">OUTER</a>
		    <a class="p-2 text-dark" href="#">ACC</a>
		  </nav>
	   </div>
    </div>
    <!-- //topArea -->
    
    <div class="container">
    	<c:forEach items="${userCategory}" var="categoryVO">
    		${categoryVO.cate_name }
    	</c:forEach>
    	
    	<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link">Active</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">Dropdown</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">Link</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">Disabled</a>
		  </li>
		</ul>
    </div>
    