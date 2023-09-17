<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA</title>
    <jsp:include page="../setting/head.jsp"/>

    <style>
        table tbody tr:nth-child(2n) {
            background-color: #d3d3d3;
        }
        table > thead {
            background-color: #d3d3d3;
        }
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> QNA </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!--QnA List-->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" id="content" style="margin-top: 20px;">
    <div class="container" style="margin-top: 60px">
        <!--회원일 경우만 글 등록 버튼 보이게-->
        <c:if test="${ !empty sid }">
            <div class="button-group" style="margin-top: 30px; margin-bottom: 100px;">
                <a class="btn btn-sm btn-outline-primary ml-4" href="${path}/qna/questionInsert.do" style="float:right; text-decoration: none; margin-bottom: 30px;"> 질문하기</a>
            </div>
        </c:if>
        <table class="table is-fullwidth is-center">
            <thead>
            <tr>
                <th width="10%" class="has-text-centered">글번호</th>
                <th width="50%" class="has-text-centered">글제목</th>
                <th width="15%" class="has-text-centered">작성자</th>
                <th width="25%" class="has-text-centered">작성일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${qnaList }" var="qna" varStatus="status">
            <tr>
                <td class="has-text-centered">${status.count}</td>
                <!-- 비회원일때 -->
                <c:if test="${empty sid}">
                    <c:if test="${qna.lev==0}">
                        <td style="text-decoration: none;">${qna.title}</td>
                    </c:if>
                    <c:if test="${qna.lev==1}">
                        <td style="text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;⌞${qna.title}</td>
                    </c:if>
                </c:if>
                <!-- 회원일때-->
                <c:if test="${!empty sid}">
                    <c:if test="${qna.lev==0}">
                        <td>
                            <a href="${path}/qna/detail.do?qno=${qna.qno}" style="color: #000000; text-decoration: none;">${qna.title}</a>
                        </td>
                    </c:if>
                    <c:if test="${qna.lev==1}">
                        <td>
                            <a href="${path}/qna/detail.do?qno=${qna.qno}" style="color: #000000; text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;⌞${qna.title}</a>
                        </td>
                    </c:if>
                </c:if>
                <td class="has-text-centered">${qna.author}</td>
                <td class="has-text-centered">${qna.resdate}</td>
            </tr>
            </c:forEach>
            <c:if test="${empty qnaList}">
                <tr>
                    <td colspan="6" class="has-text-centered"> Q&A가 없습니다. </td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <!-- pagnation -->
        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
            <c:if test="${curPage > 5}">
                <a href="${path}/qna/list.do?page=${page.blockStartNum - 1}" class="pagination-previous" style="background-color: #FF0043;">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/qna/list.do?page=${page.blockLastNum + 1}" class="pagination-next" style="background-color: #FF0043;">Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == curPage}">
                            <li>
                                <a href="${path}/qna/list.do?page=${i}" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path}/qna/list.do?page=${i}" class="pagination-link" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
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
</section>

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->
</body>
</html>