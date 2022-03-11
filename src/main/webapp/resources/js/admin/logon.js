$(document).ready(function() {
	
	var form = $("#loginForm");
	
	// 로그인 버튼 클릭 시 
	$("#btn_login").on("click", function(){
		
		var ad_userid = $("#ad_userid");
		var ad_userpw = $("#ad_userpw");

		if(ad_userid.val()==null || ad_userid.val()==""){
			alert("아이디를 입력해주세요.");
			ad_userid.focus();
			
		} else if(ad_userpw.val()==null || ad_userpw.val()==""){
			alert("비밀번호를 입력해주세요.");
			ad_userpw.focus();

		} else {
			
			form.submit();
		}
	});
	
});

