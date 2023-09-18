<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 이벤트 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 이벤트 목록 시작 -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" id="content" style="margin-top: 20px;">
                    <div class="row column text-center">
                        <div class="container">
                            <div>
                            <!-- 이벤트 관리자만 글쓰기 가능 처리 -->
                            <c:if test='${sid eq "admin"}'>
                                <div class="button-group" style="float:right; margin-left:20px; margin-bottom:30px;">
                                    <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/event/insert.do" style="text-decoration: none;">글쓰기</a>
                                </div>
                            </c:if>
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th width="80">번호</th>
                                    <th>제목</th>
                                    <th width="200">이벤트상태</th>
                                    <th width="100">작성자</th>
                                    <th width="120">작성일</th>
                                    <th width="100">조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${eventList }" var="event" varStatus="status">
                                    <tr>
                                        <td>${status.count }</td>
                                        <td ><a href="${path}/event/detail.do?eno=${event.eno }" style="color: #000000; text-decoration: none;">${event.title }</a></td>
                                        <c:if test='${event.status eq "1"}'>
                                        <td>이벤트 진행중</td>
                                        </c:if>
                                        <c:if test='${event.status eq "0"}'>
                                        <td>이벤트 종료</td>
                                        </c:if>
                                        <td>${event.author }</td>
                                        <td>
                                            <fmt:parseDate value="${event.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                        </td>
                                        <td style="text-align: center;">${event.cnt }</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty eventList}">
                                    <tr>
                                        <td colspan="6" class="has-text-centered"> 작성된 이벤트가 없습니다. </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                            <!-- pagnation -->
                            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                                <c:if test="${curPage > 5}">
                                    <a href="${path}/event/list.do?page=${page.blockStartNum - 1}" class="pagination-previous " style="background-color: #FF0043;" >Previous</a>
                                </c:if>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <a href="${path}/event/list.do?page=${page.blockLastNum + 1}" class="pagination-next" style="background-color: #FF0043;">Next page</a>
                                </c:if>

                                <ul class="pagination-list">
                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                        <c:choose>
                                            <c:when test="${i == curPage}">
                                                <li>
                                                    <a href="${path}/notice/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="${path}/notice/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 이벤트 목록 끝 -->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>