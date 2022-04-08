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
   <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

   <%@include file="/WEB-INF/views/include/plugin_js.jsp" %>
   <%@include file="/WEB-INF/views/include/orderInfo_css.jsp" %>

</head>
<body>
    
    <%@include file="/WEB-INF/views/include/header.jsp" %>

	<div class="container">

		<div class="row">
			<div class="col-sm-12 orderInfoTitle">
				<h5 style="text-align: center;">ORDER FORM</h5>
			</div>
		</div>
	<form action="/order/orderAction" method="post" id="orderForm">
	<div class="row">
	<div class="col-sm-12">
		<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
			<thead>
				<tr role="row">
					<th><input type="checkbox" id="checkAll" name="checkAll"></th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">상품이미지</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">상품명</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">판매가</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">수량</th>
					<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">합계</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty orderInfo}"></c:if>
					
				
			
				<c:if test="${not empty orderInfo}">
				<c:forEach items="${orderInfo }" var="orderInfoVO" varStatus="status">
					<tr role="row" class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td><input type="checkbox" class="check" value="<c:out value="${cartListVO.cart_code }" />"></td>
						<td>
							<a class="move" href="<c:out value="${orderInfoVO.pro_num }"></c:out>">
								<img name="proudctImage" src="/order/displayFile?fileName=<c:out value="${orderInfoVO.pro_img }"></c:out>&uploadPath=<c:out value="${orderInfoVO.pro_uploadpath }"></c:out>">
							</a>
						</td>
						<td>
							<span><c:out value="${orderInfoVO.pro_name }"></c:out></span>
							<input type="hidden" name="orderDetailList[${status.index }].pro_num" value='<c:out value="${orderInfoVO.pro_num }"></c:out>'>
						</td>
						<td>
							<span><c:out value="${orderInfoVO.pro_price }"></c:out></span> 원
							<input type="hidden" value='<c:out value="${orderInfoVO.pro_price }"></c:out>'>
						</td>
						<td>
							<span><c:out value="${orderInfoVO.cart_amount }"></c:out></span>
							<input type="hidden" name="orderDetailList[${status.index }].dt_amount" value='<c:out value="${orderInfoVO.cart_amount }"></c:out>'>
						</td>
						<td>
							<span><c:out value="${orderInfoVO.orderprice }"></c:out></span>
							<input type="hidden" class="order_price" name="orderDetailList[${status.index }].dt_price" value='<c:out value="${orderInfoVO.orderprice }"></c:out>'>원
						</td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="6">합계 : <span id="ord_price"></span> 원
						<input type="hidden" name="ord_price"></td>
					</tr>
				</c:if>
							 
				
			</tbody>
		</table>
		<div style="font-size:11px; color:gray;">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</div>
		
	</div>
	</div>
	  <br><br>
	  <h6>주문 정보</h6>
	  <p class="required">
	  	<img alt="" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"> 필수입력사항
	  </p>
	  
	  	<div>
	  		<table class="table table-bordered">
	        <colgroup>
	          <col style="width:150px;">
	          <col style="width:auto;">
	        </colgroup>
	        <tbody>
	          <tr>
	            <th scope="row">주문하시는 분 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" name="mb_name" id="mb_name" value="${sessionScope.loginStatus.mb_name}">
	            </td>
	          </tr>
	          
	          <tr class="">
	            <th scope="row">주소 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="mb_zipcode" name="mb_zipcode" value="${sessionScope.loginStatus.mb_zipcode}" style="margin-bottom:5px"> 우편번호
	              <br>
	              <input type="text" id="mb_addr" name="mb_addr" value="${sessionScope.loginStatus.mb_addr}" style="margin-bottom:5px; width: 430px"> 기본주소
	              <br>
	              <input type="text" id="mb_addr_d" name="mb_addr_d" value="${sessionScope.loginStatus.mb_addr_d}" style="width: 430px"> 나머지주소
	            </td>
	          </tr>
	          <tr class="">
	            <th scope="row">휴대전화 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="mb_mobile1" name="mb_mobile1" value="${sessionScope.loginStatus.mb_mobile1}">-
	              <input type="text" id="mb_mobile2" name="mb_mobile2" value="${sessionScope.loginStatus.mb_mobile2}">-
	              <input type="text" id="mb_mobile3" name="mb_mobile3" value="${sessionScope.loginStatus.mb_mobile3}">
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">이메일 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="mb_email" name="mb_email" value="${sessionScope.loginStatus.mb_email}">
	              <br>-이메일을 통해 주문처리과정을 보내드립니다.
	              <br>-이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해주세요.         
	            </td>
	          </tr>
	        </tbody>
	      </table>
	    </div>
	      <div style="font-size:11px; color:gray;">주문자정보 변경은 상단 MODIFY에서 가능합니다.</div>
	  
	  <br><br>
	  <h6>배송 정보</h6>
	  <p class="required">
	  	<img alt="" src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"> 필수입력사항
	  </p>
	  
	  
	  	<div>
	  		<table class="table table-bordered">
	        <colgroup>
	          <col style="width:150px;">
	          <col style="width:auto;">
	        </colgroup>
	        <tbody>
	          <tr>
	            <th scope="row">배송지선택 
	            </th>
	            <td>
	              <input type="checkbox" id="orderInfoCopy"> 주문자 정보와 동일
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">받으시는 분 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" name="ord_name" id="ord_name">
	            </td>
	          </tr>
	          
	          <tr class="">
	            <th scope="row">주소 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="ord_zipcode" name="ord_zipcode" style="margin-bottom:5px">
	              <input type="button" class="btnNormal" id="btnPostCode" name="btnPostCode" value="우편번호찾기" onclick="sample2_execDaumPostcode()">
	              <br>
	              <input type="text" id="ord_addr_basic" name="ord_addr_basic" style="margin-bottom:5px; width: 430px"> 기본주소
	              <br>
	              <input type="text" id="ord_addr_detail" name="ord_addr_detail" style="width: 430px"> 나머지주소
	              <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
	            </td>
	          </tr>
	          <tr class="">
	            <th scope="row">휴대전화 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <input type="text" id="ord_tel1" name="ord_tel1">-
	              <input type="text" id="ord_tel2" name="ord_tel2">-
	              <input type="text" id="ord_tel3" name="ord_tel3">
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">배송메시지 
	              <img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	            </th>
	            <td>
	              <textarea rows="3" name="ord_message" id="ord_message"></textarea>
	            </td>
	          </tr>
	          <tr>
	            <th scope="row">입금자명
	            </th>
	            <td>
	              <input type="text" id="ord_depositor" name="ord_depositor"> (주문자와 같을경우 생략가능)
	            </td>
	          </tr>
	        </tbody>
	      </table>
	      <div class="ec-base-button">
			  <input type="submit" value="주문하기" name="order">
			  <input type="button" value="주문취소" name="cancel">
		  </div>
		  <div class="container">
  <h5>결제하기</h5>
  <div class="row">
	<div class="col-sm-12">
   		<img src="/resources/img/payment_icon_yellow_large.png" id="btn_kakaopay" style="cursor:pointer;">
  	</div>
  </div>  
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>
	    </div>
	  </form>
	 
	
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
	</div>

<script>

	$(document).ready(function(){

      // 주문 전체금액
	  let orderTotalPrice = function() {

	      let totalPrice = 0;
	      $(".order_price").each(function(){
	        totalPrice += parseInt($(this).val());
	      });
	
	      $("#ord_price").text(totalPrice);
	      $("input[name=ord_price]").val(totalPrice);
      }
      orderTotalPrice();

      // 주문자정보 복사
      $("#orderInfoCopy").on("click", function(){
    	  
          $("#ord_name").val($("#mb_name").val());
          $("#ord_zipcode").val($("#mb_zipcode").val());
          $("#ord_addr_basic").val($("#mb_addr").val());
          $("#ord_addr_detail").val($("#mb_addr_d").val());
          $("#ord_tel1").val($("#mb_mobile1").val());
          $("#ord_tel2").val($("#mb_mobile2").val());
          $("#ord_tel3").val($("#mb_mobile3").val());
	  });
    
    });

</script>

<!--우연번호 DAUM API-->
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
                  document.getElementById('ord_zipcode').value = data.zonecode;
                  document.getElementById("ord_addr_basic").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("ord_addr_detail").focus();
  
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
