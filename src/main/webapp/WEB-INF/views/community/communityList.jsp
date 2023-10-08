<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티</title>
    <jsp:include page="../setting/head.jsp"/>

    <style>
        h1 { font-size: 40pt; }
        h3 { font-size: 20pt; }
    </style>
</head>
<body>

<!-- 헤더 시작 -->
<jsp:include page="../setting/header.jsp" />
<!-- 헤더 끝 -->

<!-- 배너 영역 시작 -->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/images/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container">
        <div class="has-text-centered" style="padding-top: 60px;">
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 커뮤니티 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<section class="section">
    <div class="container">
        <div class="buttons has-addons is-centered mb-5">
            <c:if test="${empty curCategory}">
                <label class="btn btn-sm btn-primary ml-4 is-active" style="padding-right:40px;">
            </c:if>
            <c:if test="${!empty curCategory}">
                <label class="btn btn-sm btn-primary ml-4" style="padding-right:40px;">
            </c:if>
                <input type="radio" style="opacity: 0;" checked="checked" onclick="javascript:location.href='${path}/community/list.do'"/> 전체
                </label>
            <c:forEach var="cate" items="${categories}">
                <c:if test="${cate.cate eq curCategory}">
                    <label class="btn btn-sm btn-primary ml-4 is-active" style="padding-right:40px;">
                </c:if>
                <c:if test="${cate.cate ne curCategory}">
                    <label class="btn btn-sm btn-primary ml-4" style="padding-right:40px;">
                </c:if>
                    <input type="radio" style="opacity: 0;" checked="checked" onclick="javascript:location.href='${path}/community/list.do?cate=${cate.cate}'"/> ${cate.cateName}
                    </label>
            </c:forEach>
        </div>

        <div class="container">
            <div>
                <div class="buttons is-right" style="float: right; margin-left:20px;">
                    <a href="${path}/community/insert.do" class="btn btn-sm btn-outline-primary ml-4" style="text-decoration: none;"> 글쓰기 </a>
                </div>
                <form action="${path}/community/list.do" method="get" class="field has-addons has-addons-right"  style="margin-top: 100px;">
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
                    <c:if test="${!empty curCategory}">
                        <input type="hidden" id="cate" name="cate" value="${curCategory}">
                    </c:if>
                    <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                </p>
                <p class="control">
                    <input type="submit" class="btn btn-sm btn-primary ml-4" value="검색" />
                </p>
            </form>
            </div>
            <table class="table is-hoverable is-fullwidth" >
                <thead>
                <tr>
                    <th class="has-text-centered"> # </th>
                    <th class="has-text-centered"> 카테고리 </th>
                    <th class="has-text-centered"> 제목 </th>
                    <th class="has-text-centered"> 작성자 </th>
                    <th class="has-text-centered"> 작성일 </th>
                    <th class="has-text-centered"> 조회수 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}">
                    <tr onclick="location.href='${path}/community/getCommunity.do?cno=${item.cno}&page=${curPage}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" style="cursor: pointer">
                        <th class="has-text-centered">${item.cno}</th>
                        <td class="has-text-centered">${item.cateName}</td>
                        <td width="300">${item.title}</td>
                        <td class="has-text-centered">${item.author}</td>
                        <td class="has-text-centered">${item.resdate}</td>
                        <td class="has-text-centered" width="80">${item.cnt}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="6" class="has-text-centered"> 게시글이 없습니다. </td>
                    </tr>
                </c:if>
                </tbody>
            </table>

            <!-- pagination -->
            <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                <c:if test="${curPage > 5}">
                    <a href="${path}/community/list.do?page=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous" style="background-color: #FF0043;">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/community/list.do?page=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next" style="background-color: #FF0043;">Next page</a>
                </c:if>

                <ul class="pagination-list">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li>
                                    <a href="${path}/community/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${path}/community/list.do?page=${i}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>

        </div>
    </div>
</section>

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->


</body>
</html>
