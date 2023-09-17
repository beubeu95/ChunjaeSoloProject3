<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 공지사항 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 공지사항 시작-->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" id="content" style="margin-top: 20px;">
                    <div class="row column text-center">
                        <div class="container">
                            <div>
                                <!-- 공지사항 관리자만 글쓰기 가능 처리 -->
                                <c:if test='${sid eq "admin"}'>
                                    <div class="button-group" style="float:right; margin-left:20px;">
                                        <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/notice/insert.do" style="text-decoration: none;">글쓰기</a>
                                    </div>
                                </c:if>
                                <!-- 검색 엔진 시작 -->
                                <form action="${path}/notice/list.do" method="get" class="field has-addons has-addons-right" style="margin-top: 100px;">
                                    <p class="control">
                                    <span class="select">
                                        <select id="type" name="type">
                                            <option value="T"> 제목 </option>
                                            <option value="C"> 내용 </option>
                                            <option value="W"> 작성자 </option>
                                        </select>
                                    </span>
                                    </p>
                                    <p class="control">
                                        <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${page.keyword}" autocomplete="false">
                                    </p>
                                    <p class="control">
                                        <input type="submit" class="btn btn-sm btn-primary ml-4" value="검색" />
                                    </p>
                                </form></div>
                            <!-- 검색 엔진 끝 -->
                            <table class="table">
                                <thead>
                                <tr>
                                    <th width="80">번호</th>
                                    <th>제목</th>
                                    <th width="100">작성자</th>
                                    <th width="120">작성일</th>
                                    <th width="100">조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${noticeList }" var="notice" varStatus="status">
                                    <tr>
                                        <td>${status.count }</td>
                                        <td ><a href="${path}/notice/detail.do?seq=${notice.seq }" style="color: #000000; text-decoration: none;">${notice.title }</a></td>
                                        <td>${notice.nickname }</td>
                                        <td>
                                            <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                        </td>
                                        <td style="text-align: center;">${notice.visited }</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty noticeList}">
                                    <tr>
                                        <td colspan="6" class="has-text-centered"> 공지사항이 없습니다. </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                            <!-- pagnation -->
                            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                                <c:if test="${curPage > 5}">
                                    <a href="${path}/notice/list.do?page=${page.blockStartNum - 1}" class="pagination-previous " style="background-color: #FF0043;" >Previous</a>
                                </c:if>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <a href="${path}/notice/list.do?page=${page.blockLastNum + 1}" class="pagination-next" style="background-color: #FF0043;">Next page</a>
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
<!-- 공지사항 끝-->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>