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
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    <%@include file="/WEB-INF/views/include/productDetail_css.jsp" %>
    
  </head>

  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container">

<div class="xans-product-detail">
	<div class="detailArea">
		<div class="imgArea">
			<div class="keyImg">
				<div class="thumbnail">
					<img src="/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>" alt="" class="BigImage ">
					<div id="zoom_wrap"></div>
				</div>
			</div>
		</div>

		<div id="infoFix" class="fixed">
			<div class="infoArea">
				<div class="headingArea">
					<h2>${productVO.pro_name }</h2><br><br>

				<div class="xans-element- xans-product xans-product-detaildesign">
					<table border="1" summary="">
						<caption>기본 정보</caption>
						<tbody>
							<tr class=" xans-record-">
								<th scope="row"><span style="font-size: 11px; color: #454545;">판매가</span></th>
								<td><span style="font-size: 11px; color: #454545;"><strong id="span_product_price_text">${productVO.pro_price }</strong> 원
									<input type="hidden" id="pro_price" name="pro_price" value=""></span></td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row"><span style="font-size: 12px; color: #555555;">적립금</span></th>
								<td><span style="font-size: 12px; color: #555555;"><span id="span_mileage_text">1%</span></span></td>
							</tr>

							<tr class=" xans-record-">
								<th scope="row"><span style="font-size: 12px; color: #555555;">배송비</span></th>
								<td><span style="font-size: 12px; color: #555555;"><span class="delv_price_B">
									<input id="delivery_cost_prepaid" name="delivery_cost_prepaid" value="P" type="hidden">무료</span></span></td>
							</tr>
						</tbody>
					</table>
					<!-- 숨겨진 정보 -->
					<input type="hidden" name="pro_num" id="pro_num" value="${productVO.pro_num }">
					<input type="hidden" name="pro_amount" id="pro_amount" value="1">
				</div>

				<table border="1" summary="" class="xans-element- xans-product xans-product-option xans-record-">
					<caption>상품 옵션</caption>
					<tbody></tbody>
					<tbody class="xans-element- xans-product xans-product-option xans-record-">
						<tr>
							<th scope="row">color</th>
							<td>
								<select option_product_no="15158" option_select_element="ec-option-select-finder" option_sort_no="1" option_type="T" item_listing_type="S" 
										option_title="color" product_type="product_option" product_option_area="product_option_15158_0" name="option1"
										id="product_option_id1" class="ProductOption0" option_style="select" required="true">
									<option value="*" selected="" link_image="">- [필수] 옵션을 선택해주세요 -</option>
									<option value="**" disabled="" link_image="">-------------------</option>
									<option value="아이보리" link_image="">아이보리</option>
									<option value="베이지" link_image="">베이지</option>
									<option value="핑크" link_image="">핑크</option>
									<option value="퍼플" link_image="">퍼플</option>
									<option value="민트" link_image="">민트</option>
									<option value="스카이블루" link_image="">스카이블루</option>
									<option value="레드" link_image="">레드</option>
									<option value="블랙" link_image="">블랙</option></select>
								<p class="value"></p>
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr class="displaynone" id="">
							<td colspan="2" class="selectButton"><a href="#none" class="btnBasic sizeS" onclick="">옵션선택</a></td>
						</tr>
					</tbody>
				</table>

				<div id="totalPrice" class="totalPrice">
					<strong>Total Price</strong>(qty) : <span class="total"><strong><em>0</em></strong> (0개)</span>
				</div>

				<div class="xans-element- xans-product xans-product-action ">
					<div class="ec-base-button gColumn">
						<button type="button" name="btnBuyAdd" class="btn btn-sm btn-outline-secondary">Buy</button>&nbsp;
                  		<button type="button" name="btnCartAdd" class="btn btn-sm btn-outline-secondary">Cart</button>&nbsp;
                  		<button type="button" name="btnProductist" class="btn btn-sm btn-outline-secondary">List</button>&nbsp;
					</div>
				</div>

			</div>
			<!-- //infoArea -->
		</div>
		<!-- //info_sect -->
		</div>
		<!-- //infoFix -->
	</div>
	<!-- //detailArea -->
</div>


	<div class="xans-element- xans-product xans-product-additional detailpart" style="clear: right; clear: left; text-align: center;">
		<!-- 상세페이지 -->
		<div id="prdDetail" class="ec-base-tab01 gFlex ">
			<div class="cont" >
				<p><br>${productVO.pro_content }</p><br><br><br>
			</div>

		</div>
		<!-- //상세페이지 끝 -->
		<!-- 쇼핑가이드 시작 -->
		<div id="prdInfo" class="ec-base-tab01 gFlex ">
			<div class="shoppingguide">
				<table border="1" summary="">
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 80%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">상품결제정보</th>
							<td>고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의
								사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.
								&nbsp; <br><br>무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접
								입금하시면 됩니다. &nbsp;<br>주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시
								일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지 않은 주문은 자동취소 됩니다. <br>
							</td>
						</tr>
						<tr>
							<th scope="row">배송정보</th>
							<td>- 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
								고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다.<br>
								다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
							</td>
						</tr>
						<tr>
							<th scope="row">교환 및 반품정보</th>
							<td><b>교환 및 반품 주소</b><br>- [05540] 서울 송파구 올림픽로 424<b><br>
								<br>교환 및 반품이 가능한 경우</b><br> - 상품을 공급 받으신 날로부터 7일이내 <br>
								단, 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br> - 공급받으신 상품 및
								용역의 내용이 표시.광고 내용과<br> &nbsp;다르거나 다르게 이행된 경우에는 공급받은
								날로부터&nbsp; 30일이내<br> <br> <b>교환 및 반품이 불가능한 경우</b><br>
								- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<br>
								&nbsp;포장 등을 훼손한 경우는 제외<br> - 포장을 개봉하였거나 포장이 훼손되어 상품가치가
								상실된 경우<br><br> ※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우
								상품반송 비용은 고객님께서 부담하셔야 합니다.<br> &nbsp;(색상 교환, 사이즈 교환 등 포함)<br></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- //쇼핑가이드 끝 -->
	</div>
	
	<form id="actionForm" action="" method="get">
        <!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
        
        <!-- Criteria클래스가 기본생성자에 의하여 기본값으로 파라미터가 사용 -->
        
        <c:if test="${type == 'Y' }">
        	<input type="hidden" name="pageNum" value="${cri.pageNum}">
        	<input type="hidden" name="amount" value="${cri.amount}">
        </c:if>
        
        <input type="hidden" name="cate_code" value="${cate_code}"> <!-- 상품코드 동적추가작업 -->
			  
   	 </form>

 	 <!-- 상품후기 -->
 	 <div id="product_review" class="row">
 	 </div>
 	 
 	 
    <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>


    <script>

      //리뷰페이지 불러오기
      let getProductReview = function() {
          $("#product_review").load("/review/productReview?pro_num=" + ${productVO.pro_num });
      }
      getProductReview();

      $(function(){

        let actionForm = $("#actionForm");
        
        //장바구니 담기
        $("button[name='btnCartAdd']").on("click", function(){
            
           $.ajax({
              url: '/cart/cartAdd',
              type: 'post',
              dataType: 'text',
              data: {pro_num: ${productVO.pro_num }, cart_amount : $("#pro_amount").val()},
              success: function(data) {
                if(data == "success") {
                  if(confirm("장바구니에 추가되었습니다.\n 지금 확인하겠습니까?")){
                    location.href = "/cart/cartList";
                  }
                }
              }
           });
           
        });

        //다시 리스트화면으로 되돌아가기
        $("button[name='btnProductist']").on("click", function(){
        	actionForm.attr("action", "/product/productList");
        	actionForm.submit();
        });

        //후기 별점 처리 및 포인트 계산
        $("#product_review").on("click", "#star_grade a", function(e){
	        e.preventDefault();
	        console.log("별")
	        $(this).parent().children("a").removeClass("on");
	        $(this).addClass("on").prevAll("a").addClass("on");
	          
	        scoreCount();
        });

        let scoreCount = function() {
          	let point = 0;

	        $("#star_grade a").each(function(){
	            if($(this).attr("class") == "on") {
	              point += 1
	            }
	          });  
	          
	        $("#reviewScore").val(point);
	    }

        //상품후기등록 처리
        $("#product_review").on("click", "#btnReviewAdd", function() {
        	console.log("상품후기 클릭");

            $.ajax({
            url: '/review/productReviewWrite',
            type:'post',
            dataType: 'text',
            data:  {
              pro_num : ${productVO.pro_num }, 
              rew_content : $("#reviewContent").val(), 
              rew_score : $("#reviewScore").val()
            },
            success: function(data){
              if(data == "success") {
                alert("상품후기가 등록됨");
                getProductReview();            //리뷰페이지 불러오기 메서드
              }
            }
          });
        });

        //상품후기 수정
        $("#product_review").on("click", "#btnReviewEdit", function() {

	        $("#btnReviewAdd").show();
	        $("#btnReviewEdit").hide();
	
	        console.log($("#reviewContent").val());
          
            $.ajax({
            url: '/review/productReviewEdit',
            type:'post',
            dataType: 'text',
            data:  {
              rew_num : $("#reviewNum").val(),
              pro_num : ${productVO.pro_num }, 
              rew_content : $("#reviewContent").val(), 
              rew_score : $("#reviewScore").val()
            },
            success: function(data){
              if(data == "success") {
                alert("상품후기가 수정됨");
                //getProductReview();
                reviewLoad();
              }
            }
          });
        });

        // 리뷰목록수정버튼 "btnReviewModal"
        $("#product_review").on("click", "button[name='btnReviewEditModal']", function(){
          
          //$("#reviewModal").modal("show");

          $("#btnReviewAdd").hide(); // 상품후기등록버튼 숨기기
          $("#btnReviewEdit").show(); // 상품후기수정버튼 보이기

          //리뷰 번호
          let rew_num = $(this).parent().parent().find("[name='rew_num']").val();
          $("#reviewNum").val(rew_num);
          //리뷰 별점
          let rew_score = $(this).parent().parent().find("[name='rew_score']").val();
          $("#reviewScore").val(rew_score);



          console.log("스코어" + rew_score);
          //리뷰 내용
          let rew_content = $(this).parent().parent().find("[name='rew_content']").val();
          $("#reviewContent").val(rew_content);
          $("#btnReview").text("상품후기 수정");

          // a태그가 5개
          $("#star_grade a").each(function(index, item) {
            if(index<rew_score) {
              $(item).addClass("on");
            }else {
              $(item).removeClass("on");
            }
          });


        });

        //상품후기 삭제클릭   btnReviewDelModal
        $("#product_review").on("click", "button[name='btnReviewDelModal']", function(){
          
          //$("#reviewModal").modal("show");

          if(!confirm("상품후기를 삭제하겠습니까?")) return;
         
          //리뷰 번호
          let rew_num = $(this).parent().parent().find("[name='rew_num']").val();
          $("#reviewNum").val(rew_num);


          $.ajax({
            url: '/review/productReviewDel',
            type:'post',
            dataType: 'text',
            data:  {
              rew_num : $("#reviewNum").val()  
            },
            success: function(data){
              if(data == "success") {
                alert("상품후기가 삭제됨");
                //getProductReview();
                pageNum = 1;
                reviewLoad();
              }
            }
          });

        });

        //상품후기목록 페이지번호 클릭
        let pageNum, pro_num;
        $("#product_review").on("click", "ul.pagination a.page-link", function(e){
          e.preventDefault();
          pro_num = $("#pro_num").val();
          pageNum = $(this).attr("href");
          
          reviewLoad();
          
        });

		//
        let reviewLoad = function() {
	        let reviewForm = $("#reviewForm");
	        let amount = reviewForm.find("input[name=amount]").val();
	          
	        $("#product_review").load("/review/productReview?pro_num="+pro_num+"&pageNum="+pageNum+"&amount="+ amount);
        }
     		
      });
		
    </script>

<div id="reviewModal">
  test
</div>
  </body>
</html>