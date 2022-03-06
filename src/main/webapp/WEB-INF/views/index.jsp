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
	
	<style>
		.lead {
			font-size: 13px;
		}
	</style>
  </head>
  
  <body>
  	<%@include file="/WEB-INF/views/include/header.jsp" %>

	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li id="slide_bar1" data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
			<li id="slide_bar2" data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
			<li id="slide_bar3" data-target="#carouselExampleIndicators" data-slide-to="3" class=""></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active" id="slide_bar4">
				<img src="/resources/img/main_image_1.jpg" class="d-block w-100">
			</div>
			<div class="carousel-item" id="slide_bar5">
				<img src="/resources/img/main_image_2.jpg" class="d-block w-100">
			</div>
			<div class="carousel-item" id="slide_bar6">
				<img src="/resources/img/main_image_3.jpg" class="d-block w-100">
			</div>
		</div>
	</div>




	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	  <h4>BEST</h4>
	</div>
	
	<div class="container">

      <div class="row">

        <div class="col-md-3">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-3">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
      </div>
	
	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	  <h4>NEW ARRIVALS</h4>
	  <p class="lead">봄신상 :) 하루 5% 할인!</p>
	</div>
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
    </div>

<script>

      $(function(){

        // 하단바 active 처리
        $("#slide_bar1").on("click", function(){
           	$("#slide_bar1").attr("class","active");
           	$("#slide_bar2").attr("class","");
           	$("#slide_bar3").attr("class","");
           	
           	$("#slide_bar4").attr("class","carousel-item active");
           	$("#slide_bar5").attr("class","carousel-item");
           	$("#slide_bar6").attr("class","carousel-item");
        });
        
		$("#slide_bar2").on("click", function(){
           	$("#slide_bar1").attr("class","");
           	$("#slide_bar2").attr("class","active");
           	$("#slide_bar3").attr("class","");
           	
           	$("#slide_bar4").attr("class","carousel-item");
           	$("#slide_bar5").attr("class","carousel-item active");
           	$("#slide_bar6").attr("class","carousel-item");
        });
		
		$("#slide_bar3").on("click", function(){
		   	$("#slide_bar1").attr("class","");
		   	$("#slide_bar2").attr("class","");
		   	$("#slide_bar3").attr("class","active");
		   	
		   	$("#slide_bar4").attr("class","carousel-item");
           	$("#slide_bar5").attr("class","carousel-item");
           	$("#slide_bar6").attr("class","carousel-item active");
		});
        
      });
    </script>

  </body>
</html>
