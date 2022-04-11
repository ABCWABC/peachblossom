<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-sm-12 reviewWrite" style="min-width: 1000px;">
	<h5>상품후기</h5>
	<div class="rating">
		<p id="star_grade">
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
		</p>
	</div>
	<input type="hidden" id="reviewNum">
	<input type="hidden" id="reviewScore">
	<textarea id="reviewContent" rows="1" style="width: 60%;"></textarea>
	<button id="btnReviewAdd" style="font-size: 13px;">상품후기등록</button>
	<button id="btnReviewEdit" style="display: none; font-size: 13px;">상품후기수정</button>
</div>



<div class="col-sm-12">
	<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
		<colgroup>
			<col style="width: 20%;">
			<col style="width: 80%;">
		</colgroup>
		<tbody>

			<c:forEach items="${reviewListVO }" var="reviewVO" varStatus="status">
				<tr>
					<td>
						<input type="hidden" name="rew_num" value="${reviewVO.rew_num }">
						 <input type="hidden" name="rew_score" value="${reviewVO.rew_score }">
						<c:set var="star" />
						<c:choose>
							<c:when test="${ reviewVO.rew_score eq 1 }">
								<c:set var="star" value="★☆☆☆☆" />
							</c:when>
							<c:when test="${ reviewVO.rew_score eq 2 }">
								<c:set var="star" value="★★☆☆☆" />
							</c:when>
							<c:when test="${ reviewVO.rew_score eq 3 }">
								<c:set var="star" value="★★★☆☆" />
							</c:when>
							<c:when test="${ reviewVO.rew_score eq 4 }">
								<c:set var="star" value="★★★★☆" />
							</c:when>
							<c:when test="${ reviewVO.rew_score eq 5 }">
								<c:set var="star" value="★★★★★" />
							</c:when>
						</c:choose>
						
						<c:out value="${star }" /><strong>${reviewVO.rew_score }</strong><br>
						<div style="font-size: 12px;">
						${fn:substring(reviewVO.mb_id, 0, 4)  }***** | <fmt:formatDate value="${reviewVO.rew_regdate }" pattern="yyyy-MM-dd" />
						</div>
					</td>
					<td style="font-size: 13px;">
						<input type="hidden" name="rew_content" value="${reviewVO.rew_content }">${reviewVO.rew_content }
					</td>
					<td style="min-width: 70px; font-size: 13px;">
						<button type="button" name="btnReviewEditModal" class="" style="margin-bottom:3px;">수정</button><br>
						<button type="button" name="btnReviewDelModal" class="">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="col-sm-12">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  <c:if test="${pageMaker.prev }">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	   </c:if>
	   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
	    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':'' }"><a class="page-link" href="${num}">${num}</a></li>
	   </c:forEach>
	   <c:if test="${pageMaker.next }">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	   </c:if>
	  </ul>
	</nav>
</div>

<!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
<form id="reviewForm" action="/review/productReview" method="get">
	<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	
	<!--글번호추가-->
</form>
