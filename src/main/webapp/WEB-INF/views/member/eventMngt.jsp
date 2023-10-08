<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <jsp:include page="../setting/head.jsp"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</head>
<body>

<!-- 헤더 시작 -->
<jsp:include page="../setting/header.jsp" />
<!-- 헤더 끝 -->

<!-- 배너 영역 시작 -->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/images/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container">
        <div class="has-text-centered" style="padding-top: 60px;">
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 내가 참여한 이벤트 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 내가참여한이벤트 영역 시작 -->
<section class="pt-5">
    <div class="container shadow section-sm rounded">
        <div class="columns is-multiline">
            <!-- sidebar -->
            <div class="column is-3-desktop is-12-tablet">
                <ul class="sidenav">
                    <li class="sidelist">
                        <a href="${path}/member/login2.do">나의 정보 수정</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/member/mngt.do">내가 쓴글</a>
                    </li>
                    <li title="Basic Startup" class="sidelist parent active">
                        <a href="${path}/member/eventMngt.do">이벤트</a>
                    </li>
                </ul>
            </div>

                <div class="container">
                    <table class="table is-fullwidth is-center">
                        <thead>
                        <tr>
                            <th width="80">번호</th>
                            <th>제목</th>
                            <th width="200">이벤트상태</th>
                            <th width="120">당첨확인</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${eventList }" var="event" varStatus="status">
                            <tr>
                                <td class="has-text-centered">${status.count}</td>
                                <td ><a href="${path}/event/detail.do?eno=${event.eno }" style="color: #000000; text-decoration: none;">${event.title }</a></td>
                                <c:if test='${event.status eq "1"}'>
                                    <td>진행중</td>
                                </c:if>
                                <c:if test='${event.status eq "0"}'>
                                    <td>종료</td>
                                </c:if>
                                <td>
                                    <div class="button-group" style="align-items: center">
                                        <c:if test='${event.status eq "1"}'>
                                        <a class="button is-danger" href="${path }/announcement/list.do">확인</a>
                                        </c:if>
                                        <c:if test='${event.status eq "0"}'>
                                        <a class="button is-danger" style="background-color:dimgray;" href="#">확인</a>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty qnaList}">
                            <tr>
                                <td colspan="6" class="has-text-centered"> 참여한 이벤트가 없습니다. </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>

                    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                        <c:if test="${curPage > 5}">
                            <a href="${path}/member/eventMngt.do?page=${page.blockStartNum - 1}"
                               class="pagination-previous">Previous</a>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                            <a href="${path}/member/eventMngt.do?page=${page.blockLastNum + 1}"
                               class="pagination-next">Next page</a>
                        </c:if>

                        <ul class="pagination-list">
                            <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                <c:choose>
                                    <c:when test="${i == curPage}">
                                        <li>
                                            <a href="${path}/member/eventMngt.do?page=${i}"
                                               class="pagination-link is-current" aria-label="Page ${i}"
                                               aria-current="page">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="${path}/member/eventMngt.do?page=${i}"
                                               class="pagination-link" aria-label="Page ${i}"
                                               aria-current="page">${i}</a>
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
</section>
<!-- 내가참여한이벤트 영역 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>