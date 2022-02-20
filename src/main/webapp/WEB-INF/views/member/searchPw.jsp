<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
	<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
    
  </head>
  <body>
    
	<%@include file="/WEB-INF/views/include/header.jsp" %>

	<div class="container">
	  
	  <div class="row">
	    <h3>비밀번호찾기 폼</h3>
	    <div class="container">
	      <form>
	        <div class="form-group row">
	          <label for="mb_email" class="col-sm-2 col-form-label">이메일 입력</label>
	          <div class="col-sm-12">
	            <input type="text" class="form-control" id="mb_email" name="mb_email" placeholder="abc@docmall.com">
	          </div>
	        </div>
	                
	        <div class="form-group row">
	          <div class="col-sm-12">
	            <button type="button" id="btnMailSend" class="btn btn-primary">메일전송하기</button>
	          </div>
	        </div>
	      </form>
	    </div>
	  </div>
	  
	
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
	</div>


  <script>

    $(document).ready(function(){

      //로그인
      $("#btnLogin").on("click", function(){

        let mb_id = $("#mb_id");
        let mb_password = $("#mb_password");

        if(mb_id.val() == "" || mb_id.val() == null){
          alert("아이디를 입력하세요.");
          mb_id.focus();
          return;
        }

        if(mb_password.val() == "" || mb_password.val() == null){
          alert("비밀번호를 입력하세요.");
          mb_password.focus();
          return;
        }

        $.ajax({
          url: '/member/login',
          type: 'post',
          dataType: 'text',
          data: { mb_id : mb_id.val(), mb_password : mb_password.val() },
          success: function(data){
            
            if(data == "success"){
              alert("로그인 성공.");
              location.href = "/";
            }else if(data == "idFail"){
              alert("아이디를 확인해주세요.");
              mb_id.focus();
              
            }else if(data == "pwFail"){
              alert("비밀번호를 확인해주세요.");
              mb_password.focus();
            }
          } 
        });
      });
      
      // 비밀번호 찾기폼
      $("#btnSearchPw").on("click", function(){
    	 location.href = "/member/searchPw"; 
      });
      
      //비밀번호 찾기 메일발송
      $("#btnMailSend").on("click", function(){

        let mb_email = $("#mb_email");

        if(mb_email.val() == "" || mb_email.val() == null){
          alert("가입하신 메일주소를 입력하세요.");
          mb_email.focus();
          return;
        }

        $.ajax({
          url: '/member/searchPw',
          type: 'post',
          dataType: 'text',
          data: { mb_email : mb_email.val() },
          success: function(data){
            
            if(data == "success"){
              alert("임시비밀번호가 메일발송되었습니다.\n변경바랍니다.");
            }else if(data == "fail"){
              alert("메일발송시 문제가 발생했습니다. 다시 진행해주세요.\n 문제가 발생시 관리자에게 연락주세요.");
            }else if(data == "noMail"){
              alert("가입하신 메일주소가 다릅니다. 확인하여 주세요.");
            }
          } 
        });
      });
      
    });

  </script>  
  </body>
</html>
