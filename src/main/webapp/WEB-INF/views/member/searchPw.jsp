<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <style>
.searchPwbody {
    width: 100%;
    min-width: 1000px;
    -webkit-font-smoothing: antialiased;
    -webkit-text-size-adjust: none;
    text-rendering: optimizelegibility;
    font: 12px 'Roboto',sans-serif;
    color: #353535;
}
.searchPwTitleArea {
    margin: 5% 0 30px;
    text-align: center;
}
.searchPwTitleArea h2 {
    position: relative;
    font-size: 18px;
    color: #111;
    text-transform: uppercase;
}
.searchPwTitleArea p {
    font-size: 12px;
    font-weight: 400;
    margin-top: 5px;
    color: #555;
    line-height: 18px;
}
.searchPwForm {
    display: block;
}
.xans-member-findpasswd .findPw {
    width: 420px;
    margin: 0 auto;
    padding: 50px;
    border: 1px #ddd solid;
}
.xans-member-findpasswd .findPw .ec-base-desc .desc {
    padding-left: 35%;
    padding: 0 0 0 100px;
    line-height: 18px;
}
.ec-base-desc dd, .ec-base-desc .desc {
    display: block;
    margin: 0 0 2px;
    min-height: 22px;
    word-wrap: break-word;
    word-break: break-all;
}
.ec-base-desc:after {
    content: "";
    display: block;
    clear: both;
}
.searchPwUl {
	margin: 0;
    padding: 0;
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 0px;
}
li {
	list-style: none;
    text-align: -webkit-match-parent;
    margin-block-end: 1em;
    margin-inline-end: 0px;
}
input, select, textarea {
    font-size: 100%;
    font-family: 'Roboto',sans-serif;
    color: #353535;
    vertical-align: middle;
    outline: none;
}
input {
    writing-mode: horizontal-tb !important;
    text-rendering: auto;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: start;
    -webkit-rtl-ordering: logical;
}
.xans-member-findpasswd .findPw input[type=text], .xans-member-findpasswd .findPw input[type=password] {
    width: 226px;
    height: 28px;
    line-height: 28px;
}
input[type=text], input[type=password] {
    padding: 2px 4px;
    border: 1px solid #d5d5d5;
    color: #353535;
    font-size: 12px;
    vertical-align: middle;
    outline: none;
}
.ec-base-button[class*="btnSubmit"]:after {
    display: none;
}
.ec-base-button:after {
    display: block;
    content: "";
    clear: both;
}
.ec-base-button[class*="gColumn"] {
    margin: 0 auto;
    display: flex;
    justify-content: center;
    text-align: center;
}
.btnSubmit {
	padding: 10px 16px;
    box-sizing: border-box;
    border: 1px solid transparent;
    border-radius: 0;
    font-size: 12px;
    line-height: 18px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    color: #fff;
    background-color: #222;
}
    </style>
    
	<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
    
  </head>
  <body class="searchPwbody">
    
	<%@include file="/WEB-INF/views/include/header.jsp" %>

	<div id="container">
		<div id="contents">

			<div class="searchPwTitleArea">
				<h2>find password</h2>
				<p>이메일로 비밀번호 찾기</p>
			</div>

			<form class="searchPwForm" id="findPasswdForm" name="findPasswdForm" action="/exec/front/Member/FindPasswd/" method="post" target="_self" enctype="multipart/form-data">
				<div class="xans-element- xans-member xans-member-findpasswd ">
					<div class="findPw">
						<fieldset>
							<ul class="searchPwUl ec-base-desc">
								<li>
									<label for="mb_id" style="margin-right:35px">아이디</label>
									<input type="text" id="mb_id" name="mb_id">
								</li>
								<li>
									<label for="mb_name" style="margin-right:47px">이름</label>
									<input type="text" id="mb_name" name="mb_name">
								</li>
								<li>
									<label for="mb_email" style="margin-right:7px">가입 이메일</label>
									<input type="text" id="mb_email" name="mb_email">
								</li>
							</ul>
							<div class="ec-base-button gColumn">
								<button type="button" id="btnMailSend" class="btnSubmit">메일전송하기</button>
							</div>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>


	<%@include file="/WEB-INF/views/include/footer.jsp" %>


  <script>

    $(document).ready(function(){

      //비밀번호 찾기 메일발송
      $("#btnMailSend").on("click", function(){

    	let mb_id = $("#mb_id");
    	let mb_name = $("#mb_name");
        let mb_email = $("#mb_email");
        
        if(mb_id.val() == "" || mb_id.val() == null){
          alert("아이디를 입력하세요.");
          mb_id.focus();
          return;
        }
        if(mb_name.val() == "" || mb_name.val() == null){
          alert("이름을 입력하세요.");
          mb_name.focus();
          return;
        }
        if(mb_email.val() == "" || mb_email.val() == null){
          alert("가입하신 메일주소를 입력하세요.");
          mb_email.focus();
          return;
        }

        $.ajax({
          url: '/member/searchPw',
          type: 'post',
          dataType: 'text',
          data: { mb_id : mb_id.val(), mb_name : mb_name.val(), mb_email : mb_email.val() },
          success: function(data){
            if(data == "success"){
              alert("임시비밀번호가 메일발송되었습니다.\n변경바랍니다.");
            }else if(data == "fail"){
              alert("메일발송시 문제가 발생했습니다. 다시 진행해주세요.\n 문제가 발생시 관리자에게 연락주세요.");
            }else if(data == "noMail"){
              alert("입력하신 정보가 맞지 않습니다. 확인하여 주세요.");
            }
          } 
        });
        
      });
      
    });

  </script>  
  </body>
</html>
