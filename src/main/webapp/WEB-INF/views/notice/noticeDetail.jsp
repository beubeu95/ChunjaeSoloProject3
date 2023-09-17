<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 상세보기</title>
	<jsp:include page="../setting/head.jsp"/>
</head>
<body>

<!-- 헤더 시작 -->
<jsp:include page="../setting/header.jsp" />
<!-- 헤더 끝 -->

<!-- 배너 영역 시작 -->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/images/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
	<div class="container">
		<div class="has-text-centered" style="padding-top: 60px;">
			<h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 공지사항 상세보기 </h1>
		</div>
	</div>
</section>
<!-- 배너 영역 끝 -->

<!-- 공지사항 글 상세보기 시작-->
<section class="section">
	<div class="container">
		<div class="columns is-desktop is-justify-content-center">
			<div class="column is-10-desktop">
				<div class="content" id="content" style="margin-top: 100px;">
					<div class="row column text-center">
	  					<div class="container">
		  					<table id="table">
							<tbody>
								<tr style="border-top: solid grey 1px;">
									<td style="font-weight: bold; font-size: 30px;">${notice.title }</td>
									<td style="min-width:10%; max-width: 15%; text-align: right; padding-top:30px;">
										작성자 | ${notice.nickname }
									</td>
									<td style="width: 170px; padding-right: 0px; padding-top:30px;">
										작성일 | <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
									</td>
									<td style="width: 110px; padding-top:30px;">
										조회수 | ${notice.visited}
									</td>
								</tr>
								<tr style="border-bottom: solid grey 1px;">
									<td style="padding-top: 50px; padding-bottom: 50px;"><p>${notice.content }</p></td>
								</tr>
							</tbody>
						  </table>
							<div class="button-group" style="margin-top: 30px; float: right; margin-bottom: 100px;">
							  <c:if test='${sid eq "admin"}'>
								  <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/notice/delete.do?seq=${notice.seq}" style="text-decoration:none;">글 삭제</a>
								  <a class="btn btn-sm btn-primary ml-4" href="${path }/notice/edit.do?seq=${notice.seq}" style="color:#fff; text-decoration:none;">글 수정</a>
							  </c:if>
							  <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/notice/list.do" style="float:right; text-decoration:none;">글 목록</a>
							</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 공지사항 글 상세보기 끝 -->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>