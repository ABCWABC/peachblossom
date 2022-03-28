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
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
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
      
      #star_grade a {
      	font-size: 22px;
      	text-decoration: none;
      	color: lightgray;
      }
      
      #star_grade a.on {
      	color: black;
      }
      
      .xans-product-detail {
    position: relative;
    margin: 0 auto 100px;
    padding: 50px 0 0;
    clear: both;
    overflow: hidden;
    max-width: 1050px;
}
.detailArea div {
    display: block;
}
.xans-product-detail .detailArea {
    padding: 0;
}
.xans-product-detail .imgArea {
    float: left;
    width: 50%;
    margin: 0;
}
.xans-product-detail .imgArea .keyImg {
    margin: 0;
    max-width: 500px;
}
.xans-product-detail .imgArea .keyImg .thumbnail {
    position: relative;
}
.xans-product-detail .imgArea .keyImg img {
    width: 100%;
    max-width: 100%;
    border: none;
    vertical-align: top;
}
#zoom_wrap {
    position: absolute;
    top: 0;
    left: 103%;
    z-index: 100;
    display: block;
}
.xans-product-detail .imgArea .color {
    overflow: hidden;
    width: 346px;
    margin: 5px auto;
}
.displaynone {
    display: none !important;
}
#infoFix .infobtnon {
    display: none;
}
#infoFix .infobtnoff {
    display: none;
}
.xans-product-detail .infoArea {
    float: right;
    width: 42%;
    background: rgba(255,255,255,0);
    border: 1px transparent solid;
    padding: 0;
}
.xans-product-detail .headingArea {
    position: relative;
    padding: 0 0 10px;
    margin: 0 0 8px;
    line-height: 24px;
    border-bottom: 1px solid #e8e8e8;
}
.xans-product-detail .headingArea h2 {
    display: inline;
    font-size: 16px;
    color: #000;
}
.detailArea h2 {
    margin: 0;
    padding: 0;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.xans-product-detail .headingArea .icon img {
    margin: 0 4px 0 0;
    vertical-align: middle;
}
.xans-product-detail .headingArea .supply {
    overflow: hidden;
    float: right;
}
.xans-product-detail .headingArea .topdesc {
    padding: 5px 0 0;
    font-size: 12px;
    line-height: 18px;
    color: #555;
}
.xans-product-detail .infoArea table {
    border: 0;
    font-size: 12px;
    margin: 0;
}

.detailArea table {
    display: table;
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    box-sizing: border-box;
    text-indent: initial;
}
.detailArea caption {
    display: none;
    text-align: -webkit-center;
}
.detailArea tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.detailArea tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.xans-product-detail .infoArea th {
    font-weight: normal;
    color: #353535;
    width: 115px;
    padding: 7px 0;
    text-align: left;
    vertical-align: middle;
}
.detailArea th, .detailArea td {
    border: 0;
    vertical-align: top;
}
.detailArea th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}
.xans-product-detail .infoArea td {
    padding: 7px 0;
    vertical-align: middle;
    line-height: 18px;
}
.xans-product-detail .infoArea td #span_product_price_text {
    font-weight: normal;
}
.detailArea input, .detailArea select, .detailArea textarea {
    font-size: 100%;
    font-family: 'Roboto',sans-serif;
    color: #353535;
    vertical-align: middle;
    outline: none;
}
input[type="hidden" i] {
    appearance: none;
    background-color: initial;
    cursor: default;
    display: none !important;
    padding: initial;
    border: initial;
}
.detailArea input {
    writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}
#totalProducts {
    margin: 0;
}
#totalProducts table {
    margin: 0;
    position: relative;
}
#totalProducts thead th {
    height: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
}
.detailArea thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
.totalPrice {
    margin: 0;
    padding: 20px 0;
    border-top: 1px solid #eaeaea;
    font-size: 14px;
    color: #000;
    vertical-align: middle;
}
span.ec-base-help, p.ec-base-help, ul.ec-base-help li {
    margin: 2px 9px;
    padding: 1px 0 1px 20px;
    line-height: 1.4;
    background: url(//img.echosting.cafe24.com/skin/base/common/ico_info.gif) no-repeat 0 2px;
}
.xans-product-detail .infoArea .xans-product-action .ec-base-button {
    padding: 3px 0;
}
.ec-base-button[class*="gColumn"] {
    margin: 0 auto;
    display: flex;
    justify-content: center;
}
.ec-base-button {
    padding: 10px 0;
    text-align: center;
}
.xans-product-detail .infoArea .xans-product-action .ec-base-button > a, .xans-product-detail .infoArea .xans-product-action .ec-base-button > span {
    padding: 14px 0;
}
.ec-base-button[class*="gColumn"] .gFlex2 {
    flex: 2;
}
.ec-base-button[class*="gColumn"] [class^='btn'] {
    margin: 0 2px;
    padding-left: 8px;
    padding-right: 8px;
    word-break: keep-all;
    word-wrap: break-word;
    white-space: normal;
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
}
[class^='btn'].sizeM {
    padding: 10px 16px;
}
[class^='btnSubmit'], a[class^='btnSubmit'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
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
    white-space: nowrap;
    color: #fff;
    background-color: #222;
}
.btnNormal, .btnSubmit, .btnEm, .btnBasic {
    font-family: 'Roboto','Nanum Gothic','맑은 고딕','Malgun Gothic',sans-serif;
}
.detailArea a {
    text-decoration: none;
    color: #353535;
}
.xans-product-detail .infoArea .xans-product-action .ec-base-button > a.btnNormal {
    border-color: #aaa;
}
.ec-base-box.typeMember.gMessage {
    border-width: 1px;
    border-color: #e5e5e5;
}
.ec-base-box.typeMember {
    padding: 0;
}
.ec-base-box {
    padding: 20px;
    margin-left: auto;
    margin-right: auto;
    border: 1px solid #e5e5e5;
    color: #353535;
}
.xans-myshop-asyncbenefit {
    margin: 30px 0;
}
.ec-base-box .message {
    display: block;
    padding: 10px 0 10px 35px;
    border-bottom: 1px solid #e5e5e5;
    background: #f9f9f9 url(//img.echosting.cafe24.com/skin/base/common/ico_info.gif) no-repeat 10px center;
}

.detailArea p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.ec-base-box.typeMember .information {
    display: table;
    table-layout: fixed;
    padding: 10px 0;
    width: 100%;
    box-sizing: border-box;
}
.detailArea strong {
    font-weight: bold;
}
.ec-base-box.typeMember .information > .title, .ec-base-box.typeMember .information > .thumbnail {
    display: table-cell;
    padding: 0 15px;
    width: 70px;
    text-align: center;
    vertical-align: middle;
}
.ec-base-box.typeMember .information > .thumbnail img {
    max-width: 70px;
}
.xans-product-detail .infoArea img {
    vertical-align: middle;
}
.ec-base-box.typeMember .information .description {
    display: table-cell;
    padding: 0 10px;
    width: auto;
    line-height: 1.5em;
    vertical-align: middle;
}
.ec-base-tab01 {
    position: relative;
}
#prdDetail .cont {
    min-height: 400px;
}
.xans-product-additional .cont {
    padding: 50px 10px 50px 9px;
    color: #353535;
    font-size: 12px;
    line-height: 18px;
    text-align: center;
}
#prdDetail img {
    max-width: 100% !important;
    width: auto !important;
    height: auto !important;
}

    </style>

  </head>

  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container">

		<div class="xans-element- xans-product xans-product-detail">
			<div class="detailArea">
				<div class="xans-element- xans-product xans-product-image imgArea ">
					<div class="keyImg">
						<div class="thumbnail">
							<img src="/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>" alt="" class="BigImage ">
							<div id="zoom_wrap"></div>
						</div>
					</div>
				</div>

				<div id="infoFix" class="fixed">
					<div class="infobtnon">구매하기</div>
					<div class="info_sect"><div class="infobtnoff">닫기</div>
						<div class="infoArea">
							<div class="headingArea ">
								<h2>꼭필요한 스퀘어넥 반팔 티셔츠 (8color)</h2>

							<div class="xans-element- xans-product xans-product-detaildesign">
								<table border="1" summary="">
									<caption>기본 정보</caption>
									<tbody>
										<tr class=" displaynone xans-record-">
											<th scope="row"><span style="font-size: 16px; color: #555555;">상품명</span></th>
											<td><span style="font-size: 16px; color: #555555;">꼭필요한 스퀘어넥 반팔 티셔츠 (8color)</span></td>
										</tr>
										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 11px; color: #454545;">판매가</span></th>
											<td><span style="font-size: 11px; color: #454545;"><strong id="span_product_price_text">16,800원</strong><input id="product_price" name="product_price" value="" type="hidden"></span></td>
										</tr>
										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 12px; color: #555555;">적립금</span></th>
											<td><span style="font-size: 12px; color: #555555;"><span id="span_mileage_text">1%</span></span></td>
										</tr>

										<tr class=" xans-record-">
											<th scope="row"><span style="font-size: 12px; color: #555555;">배송비</span></th>
											<td><span style="font-size: 12px; color: #555555;"><span class="delv_price_B"><input id="delivery_cost_prepaid" name="delivery_cost_prepaid" value="P" type="hidden">무료</span></span></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="guideArea">
								<table border="1" summary="">
									<tbody>
										<tr class=" sizeGuide displaynone">
											<th scope="row">Info</th>
											<td><a href="#none" class="size_guide_info" product_no="15158">Size Guide Tip</a></td>
										</tr>
									</tbody>
								</table>
							</div>

							<p class="displaynone">
								<img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/txt_naver.gif" alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다.">
							</p>

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
							<div id="totalProducts" class=" ">
								<table border="1" summary="">
									<caption>상품 목록</caption>
									<thead>
										<tr>
											<th scope="col">상품명</th>
											<th scope="col">상품수</th>
											<th scope="col">가격</th>
										</tr>
									</thead>
									<tbody class="displaynone">
										<tr>
											<td colspan="3"><span class="qtytitle">수량</span>
												<span class="quantity">
													<input id="quantity" name="quantity_name" style="" value="0" type="text">
														<a href="#none"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가" class="QuantityUp up"></a>
														<a href="#none"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소" class="QuantityDown down"></a>
												</span>
											</td>
										</tr>
									</tbody>
									<tbody>
									</tbody>
								</table>
							</div>

							<div id="totalPrice" class="totalPrice">
								<strong>Total Price</strong>(qty) : <span class="total"><strong><em>0</em></strong> (0개)</span>
							</div>
							<p class="ec-base-help txt11 displaynone EC-price-warning">할인가가 적용된 최종 결제예정금액은 주문 시 확인할 수 있습니다.</p>

							<div class="xans-element- xans-product xans-product-action ">
								<div class="ec-base-button gColumn">
									<a href="#none" class="btnEm sizeM " onclick="product_submit(2, '/exec/front/order/basket/', this)">ADD TO CART</a>
									<span class="btnEm sizeM gFlex2 displaynone">SOLD OUT</span>
									<a href="#none" onclick="add_wishlist(this, true);" class="btnNormal sizeM ">WISH LIST</a>
								</div>
								<!-- 네이버 체크아웃 구매 버튼 -->
								<div id="NaverChk_Button"></div>
								<!-- //네이버 체크아웃 구매 버튼 -->

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
						<p><br>
							<img src="/resources/img/상세-스퀘어넥 반팔 티셔츠 (8color).jpg" style="display: block; vertical-align: top; margin: 0px auto; text-align: center;"
								result="success" name="copy-1647939660-01-1.jpg" size="950px/4177px" filesize="2,47 MB" error="">
						</p>
						<br> <br> <br>시원하게 트여진 스퀘어넥과 부드럽게 감기는 핏이 <br>여리여리해 보이는 반팔 티셔츠를 소개해드릴게요 *.* <br> <br>단독은 물론 자켓이나 뷔스티에 원피스에 이너로도 
						<br>웨어러블하게 매치해보실 수 있는 제품이에요 <br> <br>짱짱하게 스판기가 더해진 원단으로 신축성이 높아 <br>몸에 감기듯 부드럽고 슬림하게 커버시켜주구요 <br> <br>가벼운
						두께에 반소매 디자인이라 봄 가을 시즌에는 <br>레이어드 속 이너로, 여름에는 단독으로 입기 좋아요 <br> <br>원단을 자세히 보면 은은하게 세로결이 느껴지는데 <br>덕분에 심심하지 않고, 체형이 슬림해
						보일 수 있어요 <br> <br>모서리가 자연스럽게 라운딩 처리된 스퀘어 넥으로 <br>여리여리하면서도 부드럽고, 시원한 인상을 주구요 <br> <br>넥 둘레를 따라 라이닝 디테일로 탄탄하게 마감되어 <br>쉽게
						변형될 걱적 없이 오래도록 활용 가능하답니다 <br> <br> <br>
						<img src="/web/upload/NNEditor/20220322/copy-1647939668-01-2.jpg" style="display: block; vertical-align: top; margin: 0px auto; text-align: center;"
							result="success" name="copy-1647939668-01-2.jpg" ize="950px/4959px" filesize="2,49 MB" error=""> <br>
						<img src="/web/upload/NNEditor/20220322/copy-1647938540-32028129.jpg" data-result="success" data-name="copy-1647938540-32028129.jpg"
							data-size="950px/6786px" data-filesize="2,97 MB" data-error="" style="display: block; float: none; vertical-align: top; margin: 0px auto; text-align: center;">
						<br>
						<img src="/web/upload/NNEditor/20220322/copy-1647938540-32028229.jpg" data-result="success" data-name="copy-1647938540-32028229.jpg" data-size="950px/5457px" data-filesize="2,48 MB" data-error=""
							style="display: block; float: none; vertical-align: top; margin: 0px auto; text-align: center;">
						<br>
						<img src="/web/upload/NNEditor/20220322/copy-1647938540-32028329.jpg" data-result="success" data-name="copy-1647938540-32028329.jpg"
							data-size="950px/6866px" data-filesize="3,17 MB" data-error="" style="display: block; float: none; vertical-align: top; margin: 0px auto; text-align: center;">
						<br>
						<img src="/web/upload/NNEditor/20220322/copy-1647938540-32028429.jpg" data-result="success" data-name="copy-1647938540-32028429.jpg"
							data-size="950px/6821px" data-filesize="2,89 MB" data-error="" style="display: block; float: none; vertical-align: top; margin: 0px auto; text-align: center;">
						<br>
					</div>


					<div class="decoimg">
						<div class="gridimg grid1">
							<!-- 이미지 위 마우스오버 : 편집에서 수정하세요 -->
							<div>
								<img src="/image/fabric.jpg">
							</div>
							<div>
								<img src="/web/upload/category/editor/2021/11/30/c62a908f29e1f981812b4348f68d202b.png">
							</div>

						</div>
					</div>

				</div>
				<!-- //상세페이지 끝 -->
				<!-- 쇼핑가이드 시작 -->
				<div id="prdInfo" class="ec-base-tab01 gFlex ">
					<div class="shoppingguide">
						<table border="1" summary="">
							<caption>쇼핑가이드</caption>
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 80%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상품결제정보</th>
									<td>고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의
										사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.
										&nbsp; <br>
									<br>무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접
										입금하시면 됩니다. &nbsp;<br>주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시
										일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지 않은 주문은 자동취소 됩니다. <br>
									</td>
								</tr>
								<tr>
									<th scope="row">배송정보</th>
									<td>- 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
										고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수
										있습니다.<br>
									</td>
								</tr>
								<tr>
									<th scope="row">교환 및 반품정보</th>
									<td><b>교환 및 반품 주소</b><br>- [05548] 서울특별시 송파구 오금로 101
										(방이동) 현민빌딩7층<b><br>
										<br>교환 및 반품이 가능한 경우</b><br> - 상품을 공급 받으신 날로부터 7일이내 단,
										포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br> - 공급받으신 상품 및
										용역의 내용이 표시.광고 내용과<br> &nbsp;다르거나 다르게 이행된 경우에는 공급받은
										날로부터&nbsp; 30일이내<br> <br> <b>교환 및 반품이 불가능한 경우</b><br>
										- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<br>
										&nbsp;포장 등을 훼손한 경우는 제외<br> - 포장을 개봉하였거나 포장이 훼손되어 상품가치가
										상실된 경우<br> &nbsp;(예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북,
										LCD모니터, 디지털 카메라 등의 불량화소에<br> &nbsp;따른 반품/교환은 제조사 기준에
										따릅니다.)<br> - 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단,
										화장품등의 경우 시용제품을 <br> &nbsp;제공한 경우에 한 합니다.<br> - 시간의
										경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br> - 복제가 가능한
										상품등의 포장을 훼손한 경우<br> &nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을
										이용해 주시기 바랍니다.)<br> <br> ※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우
										상품반송 비용은 고객님께서 부담하셔야 합니다.<br> &nbsp;(색상 교환, 사이즈 교환 등 포함)<br></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- //쇼핑가이드 끝 -->
				<!-- 상품후기 시작 -->
				<div id="prdReview" class="ec-base-tab01 gFlex  ">
					<div class="board">
						<h3>REVIEW</h3>
						<p class="desc">상품의 사용후기를 적어주세요.</p>

						<style>
							#prdReview .nodata {
								display: none;
							}
						</style>
						<div class="crema-product-reviews crema-applied" data-product-code="15158" style="">
							<iframe id="crema-product-reviews-2"
								src="https://review5.cre.ma/shopperland.co.kr/products/reviews?product_code=15158&amp;iframe_id=crema-product-reviews-2&amp;widget_style=&amp;app=0&amp;parent_url=https%3A%2F%2Fshopperland.co.kr%2Fproduct%2F%25EA%25BC%25AD%25ED%2595%2584%25EC%259A%2594%25ED%2595%259C-%25EC%258A%25A4%25ED%2580%2598%25EC%2596%25B4%25EB%2584%25A5-%25EB%25B0%2598%25ED%258C%2594-%25ED%258B%25B0%25EC%2585%2594%25EC%25B8%25A0-8color%2F15158%2Fcategory%2F179%2Fdisplay%2F1%2F&amp;secure_username=V2509662c740f63936bb6d6abf177cd393&amp;secure_user_name=V24c3341cc1de7fc0e0faa6002c2ded0e9&amp;secure_device_token=V206be6953dc68dc1f415793cf9b53ff21472218cd04eeb6fb307694697b49da10&amp;iframe=1"
								height="0" width="100%" scrolling="no" allowtransparency="true"
								frameborder="0" name="crema-product-reviews-2-1648394836322"
								style="display: block; visibility: visible; height: 598px;"></iframe>
						</div>

						<p class="nodata">게시물이 없습니다</p>
						<p class="ec-base-button crema-hide crema-applied"
							style="display: none;">
							<span class="gRight"> <a
								href="/board/product/list.html?board_no=4"
								class="btnNormalFix sizeS">LIST</a> <a
								href="/board/product/write.html?board_no=4&amp;product_no=15158&amp;cate_no=179&amp;display_group=1"
								class="btnSubmitFix sizeS">WRITE</a>
							</span>
						</p>

					</div>
				</div>
				<!-- //상품후기 끝 -->
				<!-- 상품문의 시작 -->
				<div id="prdQnA" class="ec-base-tab01 gFlex  ">
					<ul class="menu">
						<li><a href="#prdDetail">DETAIL</a></li>
						<li><a href="#prdRelated">WITH ITEM</a></li>
						<li><a href="#prdInfo">GUIDE</a></li>
						<li><a href="#prdReview">REVIEW</a></li>
						<li class="selected"><a href="#prdQnA">Q&amp;A</a></li>
					</ul>
					<div class="board">
						<h3>Q&amp;A</h3>
						<p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>

						<p class="nodata">게시물이 없습니다</p>
						<p class="ec-base-button">
							<span class="gRight"> <a
								href="/board/product/list.html?board_no=6"
								class="btnNormalFix sizeS">LIST</a> <a
								href="/board/product/write.html?board_no=6&amp;product_no=15158&amp;cate_no=179&amp;display_group=1"
								class="btnSubmitFix sizeS">WRITE</a>
							</span>
						</p>

					</div>
				</div>
				<!-- //상품문의 끝 -->
			</div>




   	 
   	 <!-- 상품후기 -->
   	 <div id="product_review" class="row">
   	 </div>
   	 
   	 
      <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>


    <script>

      //상품후기
      let getProductReview = function() {
          $("#product_review").load("/review/productReview?pro_num=" + ${productVO.pro_num });
      }
      getProductReview();

      // jquery ready()이벤트 구문.
      $(function(){

        let actionForm = $("#actionForm");
        
        //장바구니 담기
        $("button[name='btnCartAdd']").on("click", function(){
            
            let pro_num = $(this).parents("div.card-body").find("input[name='pro_num']").val();
            
           // console.log("상품코드" + pro_num);

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

        //리스트 클릭
        $("button[name='btnProductist']").on("click", function(){
          actionForm.attr("action", "/product/productList");
          actionForm.submit();
        });

        
        

        //상품 별점 클릭
        $("#product_review").on("click", "#star_grade a", function(e){
          e.preventDefault();
          console.log("별")
          $(this).parent().children("a").removeClass("on") // 기존선택되어 추가된 on선택자를 제거. 변경
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


        //상품후기 클릭
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
                getProductReview();
              }
            }
          });
        });

        //상품후기 수정
        $("#product_review").on("click", "#btnReviewEdit", function() {
          //console.log("상품후기 클릭");

          $("#btnReviewAdd").show(); // 상품후기등록버튼 보이기
          $("#btnReviewEdit").hide(); // 상품후기수정버튼 숨기기

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


        let reviewLoad = function() {
          let reviewForm = $("#reviewForm");
          let amount = reviewForm.find("input[name=amount]").val();
          
          // 상품코드, 페이징정보
          $("#product_review").load("/review/productReview?pro_num="+pro_num+"&pageNum="+pageNum+"&amount="+ amount);
        }
     		
      });

		
      
    </script>

<div id="reviewModal">
  test
</div>
  </body>
</html>