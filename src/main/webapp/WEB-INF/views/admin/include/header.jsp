<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<header class="main-header">

	

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
</header>