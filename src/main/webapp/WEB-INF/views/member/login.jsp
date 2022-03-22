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
   
   <style>
	.loginBody {
	    width: 100%;
	    min-width: 1000px;
	    -webkit-font-smoothing: antialiased;
	    -webkit-text-size-adjust: none;
	    text-rendering: optimizelegibility;
	}
	.loginBody, code {
	    /* font: 12px 'Roboto',sans-serif; */
	    color: #353535;
	    background: #fff;
	}

 	#container:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	::selection {
	    background: #888;
	    color: #fff;
	    text-shadow: none;
	}
	#contents {
	    position: relative;
	    width: 90%;
	    max-width: 1328px;
	    min-height: 500px;
	    margin: 0 auto;
	}
 	div {
	    display: block;
	} 
	.titleArea {
	    margin: 5% 0 30px;
	    text-align: center;
	}
	.loginwrap {
	    position: relative;
	    margin: 0 auto;
	    padding: 0;
	    width: 400px;
	    font-size: 0;
	    line-height: 0;
	    text-align: center;
	}
	form {
	    display: block;
	}
	input, select, textarea {
	    font-size: 100%;
	    font-family: 'Roboto',sans-serif;
	    color: #353535;
	    vertical-align: middle;
	    outline: none;
	}
	/*
	.inputTypeText {
		-webkit-writing-mode: horizontal-tb !important;
		text-rendering: auto;
		word-spacing: normal;
		text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    appearance: auto;
	    -webkit-rtl-ordering: logical;
	    cursor: text;
	    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
	    width: 100%;
	    height: 45px;
	    line-height: 45px;
	    padding: 2px 2px 2px 7px;*/
	    /* border: 0 none; *//*
	    color: #353535;
	    font-size: 13px;
	    letter-spacing: 1px;
	    box-sizing: border-box;
	    vertical-align: middle;
	    outline: none;
	    margin: 0;
	}
	*/
	label {
	    cursor: default;
	}
	.xans-member-login {
	    margin: 0 auto;
	    padding: 0 0;
	    color: #2e2e2e;
	    font-size: 11px;
	    line-height: 18px;
	    text-align: center;
	}
	.form-control{
		border-radius: 0;
		-webkit-writing-mode: horizontal-tb !important;
		width: 100%;
	    height: 45px;
	    line-height: 45px;
	    padding: 2px 2px 2px 7px;
	    color: #353535;
	    font-size: 13px;
	    letter-spacing: 1px;
	    box-sizing: border-box;
	    vertical-align: middle;
	    outline: none;
	    text-rendering: auto;
	    word-spacing: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    appearance: auto;
	    -webkit-rtl-ordering: logical;
	    cursor: text;
	    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
	    border-width: 1px;
	    border-style: solid;
	}
	.btn-login {
	    margin: 0 0 7px;
	    width: 100%;
	    padding: 14px 16px;
	    min-width: 80px;
	    font-size: 13px;
	    display: inline-block;
	    box-sizing: border-box;
	    border: 1px solid transparent;
	    border-radius: 0;
	    line-height: 18px;
	    font-weight: normal;
	    text-decoration: none;
	    vertical-align: middle;
	    word-spacing: -0.5px;
	    letter-spacing: 0;
	    text-align: center;
	    white-space: nowrap;
	    color: #fff;
	    background-color: #222;
	    font-family: 'Roboto','Nanum Gothic','맑은 고딕','Malgun Gothic',sans-serif;
	}
	.btn-JOINUS {
	    margin: 0 0 7px;
	    width: 100%;
	    padding: 14px 16px;
	    min-width: 80px;
	    font-size: 13px;
	    display: inline-block;
	    box-sizing: border-box;
	    border: 1px solid #d5d5d5;
	    border-radius: 0;
	    line-height: 18px;
	    font-weight: normal;
	    text-decoration: none;
	    vertical-align: middle;
	    word-spacing: -0.5px;
	    letter-spacing: 0;
	    text-align: center;
	    white-space: nowrap;
	    color: #353535;
	    background-color: white;
	    font-family: 'Roboto','Nanum Gothic','맑은 고딕','Malgun Gothic',sans-serif;
	}
	.security {
		padding: 0;
	    margin: 10px 0 20px;
	    color: #353535;
	    clear: both;
	    overflow: hidden;
	    text-align: left;
	}
	.loginBody ul {
		font-size: 13px;
		color: #2e2e2e;
	    display: block;
	    list-style-type: disc;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 40px;
	}
	.loginBody li {
		color: #2e2e2e;
	    display: inline-block;
	    padding: 0 9px 0 13px;
	    list-style: none;
	    text-align: -webkit-match-parent;
	}
   </style>
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
					<form>
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
										<li><a href="/member/id/find_id.html">find ID</a></li>
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
              alert("아이디가 일치하지 않습니다.");
              mb_id.focus();
            }else if(data == "pwFail"){
              alert("비밀번호가 일치하지 않습니다.");
              mb_password.focus();
            }
            
          } 
        });
      });
      
      $("#btnJoinUs").on("click", function(){
    	 location.href = "/member/join"; 
      });
    });

  </script>  
</body>
</html>