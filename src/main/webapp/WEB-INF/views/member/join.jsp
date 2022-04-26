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

   <%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
   <%@include file="/WEB-INF/views/include/join_css.jsp" %>
   
</head>
<body>
    
    <%@include file="/WEB-INF/views/include/header.jsp" %>

	<div class="container">
	  
	  <div class="titleArea">
	    <h2>JOIN US</h2>
	  </div>
	  
	  <!-- 회원가입 폼 작업 -->
	  <h6>기본정보</h6>
	  <p class="required">
	  	<img alt="" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"> 필수입력사항
	  </p>
	  <form action="/member/join" method="post" id="joinForm">
	  	<div>
	  		<table class="table table-bordered">
	        <colgroup>
	          <col style="width:150px;">
	          <col style="width:auto;">
	        </colgroup>
	        <tbody>
	          <tr>
	            <th scope="row">아이디 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="mb_id" name="mb_id">
	              <span id="idCheckState"></span> (영문소문자/숫자 조합, 4~16자) &nbsp
	              <button type="button" class="btnNormal" id="btnUseIDChk">중복체크</button>
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">비밀번호 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <div class="">
	                <input type="password" id="mb_password" name="mb_password">
	                <span id="pwCheckState"></span> (영문 대소문자/숫자/특수문자[~!@\#$%^*] 조합, 8자~16자)
	              </div> 
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">비밀번호 확인 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="password" id="mb_passwordConfirm">
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">이름 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" name="mb_name" id="mb_name">
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">이메일 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="mb_email" name="mb_email">
	              <button type="button" class="btnNormal" id="btnMailAuthReq">메일인증요청</button> &nbsp;&nbsp;&nbsp;         
	              <input type="text" id="auth_mail" name="auth_mail" value="메일인증코드입력">
	              <button type="button" class="btnNormal" id="btnMailAuthConfirm">메일인증확인</button>
	              <br>메일인증요청 클릭 후, 메일을 확인하시고 인증코드를 입력 및 확인버튼을 눌러주세요.         
	            </td>
	          </tr>
	          <tr class="">
	            <th scope="row">주소 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="mb_zipcode" name="mb_zipcode" style="margin-bottom:5px">
	              <input type="button" class="btnNormal" id="btnPostCode" name="btnPostCode" value="우편번호찾기" onclick="sample2_execDaumPostcode()">
	              <br>
	              <input type="text" id="mb_addr" name="mb_addr" style="margin-bottom:5px; width: 430px"> 기본주소
	              <br>
	              <input type="text" id="mb_addr_d" name="mb_addr_d" style="width: 430px"> 나머지주소
	              <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
	            </td>
	          </tr>
	          <tr class="">
	            <th scope="row">휴대전화 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <select id="mb_mobile1" name="mb_mobile1">
	                <option value="010">010</option>
	                <option value="011">011</option>
	                <option value="016">016</option>
	                <option value="017">017</option>
	                <option value="018">018</option>
	                <option value="019">019</option>
	              </select>-
	              <input type="text" id="mb_mobile2" name="mb_mobile2">-
	              <input type="text" id="mb_mobile3" name="mb_mobile3">
	            </td>
	          </tr> 
	          <tr class="displaynone">
	            <th scope="row">메일수신여부
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
				
	              <input type="radio" id="mb_accept_e_Y" name="mb_accept_e" value="Y" checked="checked">
	              <label for="mb_accept_e_Y">동의함</label> &nbsp
	              <input type="radio" id="mb_accept_e_N" name="mb_accept_e" value="N">
	              <label for="mb_accept_e_N">동의안함</label>
	            <!-- 
	            	<div id="checkbox">
	            		<input type="checkbox" class="form-check-input" id="mb_accept_e" name="mb_accept_e" value="Y">
	            		<label class="form-check-label" for="mb_accept_e"></label>
	            	</div>-->
	            </td>
	          </tr>
	        </tbody>
	      </table>
	    </div>
	    <div class="joinButton">
	      <button type="button" id="btnJoin" class="btn btn-dark btn-sm">회원가입</button>
	    </div>
	  </form>
	  
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
	</div>

<script>

  $(document).ready(function(){
	  
	let isValidityId = false;                         // 아이디유효성체크
	let isValidityPw = false;                         // 비밀번호유효성체크
	let isValidityTel = false;                         // 전화번호유효성체크

    let isCheckID = false;                            // 아이디중복체크 

    let isMailAuthConfirm = false;                    // 메일인증확인체크
    
    let isNotNullId = false;                    	  // 아이디 NotNull값체크
    let isNotNullPw = false;                    	  // 비밀번호 NotNull값체크
    let isNotNullName = false;                    	  // 이름 NotNull값체크
    let isNotNullEmail = false;                    	  // 이메일 NotNull값체크
    let isNotNulladdr = false;                    	  // 주소 NotNull값체크
    let isNotNullAll = false;                    	  // 전체 NotNull값체크
    
	let patternNum = /[0-9]/;
	let patternCha1 = /[a-z]/;
	let patternCha2 = /[a-zA-Z]/;
	let patternSym = /[~!@\#$%^*]/;
	let patternTel1 = /^([1-9]+[0-9]{2,3})/
	let patternTel2 = /([0-9]{4})/
    
    //회원가입 처리
    $("#btnJoin").on("click", function(){
    	
	  checkNull();
	  checkValidityId();
	  checkValidityPw();
	  checkValidityTel();
	  
      if(!isNotNullId){
    	  return false;
      }
      
      console.log("아이디중복체크? " + isCheckID)
      
      if(isCheckID == false){
        alert("아이디 중복체크 확인바람");
        $("#mb_id").focus();
        return false;
      }
      
      if(!isNotNullPw || !isNotNullName || !isNotNullEmail){
    	  return false;
      }

      if(isMailAuthConfirm == false){
        alert("메일인증요청 확인바람");
        $("#btnMailAuthReq").focus();
        return false;
      }
      
      if(isNotNullAll == false || isValidityId == false || isValidityPw == false || isValidityTel == false){
    	  return false;
      }
      
      $("#joinForm").submit();
 
    });
    
    //Null값 체크
    function checkNull() {
    	
    	var mb_id = $("#mb_id");
    	var mb_password = $("#mb_password");
    	var mb_passwordConfirm = $("#mb_passwordConfirm");
    	var mb_name = $("#mb_name");
    	var mb_email = $("#mb_email");
    	var mb_zipcode = $("#mb_zipcode");
    	var mb_addr = $("#mb_addr");
    	var mb_addr_d = $("#mb_addr_d");
    	var mb_mobile1 = $("#mb_mobile1");
    	var mb_mobile2 = $("#mb_mobile2");
    	var mb_mobile3 = $("#mb_mobile3");
    	
    	if(mb_id.val() == "" || mb_id.val() == null) { alert("아이디를 입력하세요."); mb_id.focus(); return; } else { isNotNullId = true; }
    	if(mb_password.val() == "" || mb_password.val() == null) { alert("비밀번호를 입력하세요."); mb_password.focus(); return; }
    	if(mb_passwordConfirm.val() == "" || mb_passwordConfirm.val() == null) { alert("비밀번호 확인을 입력하세요."); mb_passwordConfirm.focus(); return; } else { isNotNullPw = true; }
    	if(mb_name.val() == "" || mb_name.val() == null) { alert("이름을 입력하세요."); mb_name.focus(); return; } else { isNotNullName = true; }
    	if(mb_email.val() == "" || mb_email.val() == null) { alert("이메일을 입력하세요."); mb_email.focus(); return; } else { isNotNullEmail = true; }
    	if(mb_zipcode.val() == "" || mb_zipcode.val() == null) { alert("우편번호를 입력하세요."); mb_zipcode.focus(); return; }
    	if(mb_addr.val() == "" || mb_addr.val() == null) { alert("주소를 입력하세요."); mb_addr.focus(); return; }
    	if(mb_addr_d.val() == "" || mb_addr_d.val() == null) { alert("주소를 입력하세요."); mb_addr_d.focus(); return; } else { isNotNulladdr = true; }
    	if(mb_mobile1.val() == "" || mb_mobile1.val() == null) { alert("전화번호를 입력하세요."); mb_mobile1.focus(); return; }
    	if(mb_mobile2.val() == "" || mb_mobile2.val() == null) { alert("전화번호를 입력하세요."); mb_mobile2.focus(); return; }
	   	if(mb_mobile3.val() == "" || mb_mobile3.val() == null) { alert("전화번호를 입력하세요."); mb_mobile3.focus(); return; } else { isNotNullAll = true; }
	   	
    }
    
    //id 유효성검사
    function checkValidityId() {
    	
    	var mb_id = $("#mb_id").val();
    	
    	console.log("아이디 유효성체크");
    	if(!patternNum.test(mb_id) || !patternCha1.test(mb_id) || mb_id.length<4 || mb_id.length>16) {
    		
    		$('#idCheckState').css("color", "red");
    		$('#idCheckState').html("아이디는 영문소문자+숫자 4~16자리로 입력해주세요.");
    		
    		return false;
    		
    	}else {
    		isValidityId = true;
    	}
    	
    }
    
    //pw 유효성검사
    function checkValidityPw() {
    	
    	var mb_password = $("#mb_password").val();
    	
    	if(!isCheckID) {
    		return false;
    	}
    	
		if(!patternNum.test(mb_password) || !patternCha2.test(mb_password) || !patternSym.test(mb_password) || mb_password.length<8 || mb_password.length>16) {
    		
    		$('#pwCheckState').css("color", "red");
    		$('#pwCheckState').html("비밀번호는 영문대소문자+숫자+특수문자[~!@\#$%^*] 조합인 8~16자리로 입력해주세요.<br>");
    		
    		return false;
    		
		}else {
			isValidityPw = true;
    	}
    	
    }
    
    //전화번호 유효성검사
    function checkValidityTel() {
    	
    	var mb_mobile2 = $("#mb_mobile2").val();
    	var mb_mobile3 = $("#mb_mobile3").val();
    	
    	if(!isCheckID || !isValidityPw || !isNotNullPw || !isNotNullName || !isNotNullEmail || !isMailAuthConfirm || !isNotNulladdr) {
    		return false;
    	}	
    	
		if(!patternTel1.test(mb_mobile2) || !patternTel2.test(mb_mobile3)) {
    		
			alert("유효한 전화번호를 입력해주세요.");
    		
    		return false;
    		
		}else {
			isValidityTel = true;
    	}
    }

    //아이디중복체크
    $("#btnUseIDChk").on("click", function(){
    	
      isCheckID = false;
      let mb_id = $("#mb_id");
      
      checkValidityId();

      if(!isValidityId){
        alert("아이디는 영문소문자+숫자 조합인 4~16자리로 입력해주세요.");
        return;
      }

      $.ajax({
        url: '/member/checkID',
        type: 'get',
        dataType: 'text',
        data: { mb_id : mb_id.val() },
        success: function(data){
          
          if(data == "Y"){
        	isCheckID = true;
        	alert("아이디 사용가능");
          }else if(data == "N"){
            mb_id.val("");
            alert("아이디 사용불가능");
          }
        }
      });
      
    });

    //메일인증요청
    $("#btnMailAuthReq").on("click", function(){
      isMailAuthConfirm = false;
      let mb_email = $("#mb_email");

      if(mb_email.val() == "" || mb_email.val() == null){
        alert("메일주소를 입력하세요.");
        mb_email.focus();
        return;
      }

      $.ajax({
        url: '/member/sendMailAuth',
        type: 'get',
        dataType: 'text',
        data: { mb_email : mb_email.val() },
        success: function(data){
          
          if(data == "success"){
            alert("인증요청 메일발송됨.");
          }else if(data == "fail"){
        	  alert("유효한 이메일을 입력해주세요.");
          }
        }
      });
    });

    //메일인증확인
    $("#btnMailAuthConfirm").on("click", function(){

      let auth_mail = $("#auth_mail");

      if(auth_mail.val() == "" || auth_mail.val() == null){
        alert("인증코드를 입력하세요.");
        auth_mail.focus();
        return;
      }

      $.ajax({
        url: '/member/mailAuthConfirm',
        type: 'get',
        dataType: 'text',
        data: { uAuthCode : auth_mail.val() },
        success: function(data){
          
          if(data == "success"){
        	isMailAuthConfirm = true;
            alert("인증요청 성공.");
          }else if(data == "fail"){
            alert("인증요청 실패\n 인증코드를 다시 입력하세요. 또는 인증요청을 다시 하기바랍니다.");
            auth_mail.val("");
          }
        } 
      });
    });

  });


</script>

<!--우편번호 DAUM API-->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');
  
      function closeDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_layer.style.display = 'none';
      }
  
      function sample2_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("sample2_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample2_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('mb_zipcode').value = data.zonecode;
                  document.getElementById("mb_addr").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("mb_addr_d").focus();
  
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_layer.style.display = 'none';
              },
              width : '100%',
              height : '100%',
              maxSuggestItems : 5
          }).embed(element_layer);
  
          // iframe을 넣은 element를 보이게 한다.
          element_layer.style.display = 'block';
  
          // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
          initLayerPosition();
      }
  
      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
          var width = 300; //우편번호서비스가 들어갈 element의 width
          var height = 400; //우편번호서비스가 들어갈 element의 height
          var borderWidth = 5; //샘플에서 사용하는 border의 두께
  
          // 위에서 선언한 값들을 실제 element에 넣는다.
          element_layer.style.width = width + 'px';
          element_layer.style.height = height + 'px';
          element_layer.style.border = borderWidth + 'px solid';
          // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
          element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
          element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
  </script>


    
  </body>
</html>
