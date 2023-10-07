<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 발표</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 이벤트 발표 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!--발표 목록 시작 -->
<div class="content" id="content" style="margin-top: 20px;">
    <div class="row column text-center" style="margin-top:100px;">
        <div class="container">
            <div>
                <table class="table">
                    <thead>
                    <tr>
                        <th width="10%" class="has-text-centered">글번호</th>
                        <th width="40%">글제목</th>
                        <th width="15%" class="has-text-centered">작성자</th>
                        <th width="25%" class="has-text-centered">작성일</th>
                        <th width="10%" class="has-text-centered">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${announcementList }" var="ann" varStatus="status">
                        <tr>
                            <td>${ann.wno }</td>
                            <td><a href="${path}/announcement/detail.do?ano=${ann.ano}"
                                   style="color: #000000;">${ann.title }</a></td>
                            <td class="has-text-centered">${ann.author }</td>
                            <td class="has-text-centered">
                                <fmt:parseDate value="${ann.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty announcementList}">
                        <tr>
                            <td colspan="6" class="has-text-centered"> 게시글이 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
                <!-- pagnation -->
                <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                    <c:if test="${curPage > 5}">
                        <a href="${path}/announcement/list.do?page=${page.blockStartNum - 1}" class="pagination-previous">Previous</a>
                    </c:if>
                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                        <a href="${path}/announcement/list.do?page=${page.blockLastNum + 1}" class="pagination-next">Next
                            page</a>
                    </c:if>

                    <ul class="pagination-list">
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li>
                                        <a href="${path}/announcement/list.do?page=${i}" class="pagination-link is-current"
                                           aria-label="Page ${i}" aria-current="page">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="${path}/announcement/list.do?page=${i}" class="pagination-link"
                                           aria-label="Page ${i}" aria-current="page">${i}</a>
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
<!-- 발표 목록 끝-->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>