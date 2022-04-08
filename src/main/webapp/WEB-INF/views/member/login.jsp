<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
   <meta name="generator" content="Hugo 0.88.1">
   <title>Insert title here</title>
   <%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
   <%@include file="/WEB-INF/views/include/login_css.jsp" %>
   
   <script>
    	let msg = '${msg}';
    	if(msg == 'idFail') {
    		alert("아이디를 확인해주세요");
    	} else if(msg == 'pwFail') {
    		alert("비밀번호를 확인해주세요");
    	}
    </script>
   
 </head>
 <body>
   <%@include file="/WEB-INF/views/include/header.jsp" %>
   <main class="loginBody login-form">
		<div id="container">
			<div id="contents">
				<div class="titleArea">
					<h2>login</h2>
					<p>로그인 하시면 다양하고 특별한 혜택을 이용할 수 있습니다.</p>
				</div>

				<div class="loginwrap">
					<form method="post" action="/member/login2" id="loginForm">
						<div class="xans-element- xans-member xans-member-login ">
							<div class="login">
								<fieldset>
									<label class="col-sm-12 col-form-label" title="아이디"></label>
									<input type="text" class="form-control" id="mb_id" name="mb_id" placeholder="아이디">
									<label class="col-sm-12 col-form-label" title="비밀번호"></label>
									<input type="password" class="form-control" id="mb_password" name="mb_password" placeholder="비밀번호">
									<p class="security">
										<input type="checkbox" id="" name="">
										<label for="">아이디 저장</label>
									</p>
									<div class="ec-base-button gFull">
										<button type="button" class="btn-login" id="btnLogin">LOGIN</button>
										<button type="button" class="btn-JOINUS" id="btnJoinUs">JOIN US</button>
									</div>
									<ul>
										<li><a href="/member/searchId">find ID</a></li>
										<li><a href="/member/searchPw">find Password</a></li>
									</ul>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
			</div>
			<hr class="layout">
		</div>

   </main>
   <%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   <script>

    $(document).ready(function(){

      //로그인 처리
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
        
        $("#loginForm").submit();

        /*
        $.ajax({
          url: '/member/login',
          type: 'post',
          dataType: 'text',
          data: { mb_id : mb_id.val(), mb_password : mb_password.val() },
          success: function(data){
            
            if(data == "success"){
              location.href = "/";
            }else if(data == "idFail"){
              alert("아이디가 일치하지 않습니다.");
              mb_id.focus();
            }else if(data == "pwFail"){
              alert("비밀번호가 일치하지 않습니다.");
              mb_password.focus();
            }
            
          } 
        });
        */
      });
      
      $("#btnJoinUs").on("click", function(){
    	 location.href = "/member/join"; 
      });
    });

  </script>  
</body>
</html>