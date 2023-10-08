<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 이벤트관리 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 이벤트관리 영역 시작 -->
<section class="pt-5">
    <div class="container shadow section-sm rounded">
        <div class="columns is-multiline">
            <!-- sidebar -->
            <div class="column is-3-desktop is-12-tablet">
                <ul class="sidenav">
                    <li class="sidelist">
                        <a href="${path}/admin/memberlist.do">회원관리</a>
                    </li>
                    <li title="Basic Startup" class="sidelist parent active">
                        <a href="${path}/admin/eventlist.do">이벤트관리</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/admin/questionList.do">QNA관리</a>
                    </li>
                </ul>
            </div>

            <div class="column is-8-desktop is-12-tablet">
                <div class="container">
                <table class="table" id="event-table">
                    <thead>
                    <tr>
                        <th width="80">번호</th>
                        <th>제목</th>
                        <th width="100">이벤트상태</th>
                        <th width="50">당첨</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${eventList }" var="event" varStatus="status">
                        <tr>
                            <td>${event.eno }</td>
                            <td ><a href="${path}/event/detail.do?eno=${event.eno }" style="color: #000000; text-decoration: none;">${event.title }</a></td>
                            <c:if test='${event.status eq "1"}'>
                                <td><span class="tag is-success is-light is-medium">진행 중</span></td>
                            </c:if>
                            <c:if test='${event.status eq "0"}'>
                                <td><span class="tag is-danger is-light is-medium">종료</span></td>
                            </c:if>
                            <td>
                                <div class="button-group" style="align-items: center">
                                    <a class="button is-link" style="width:50px; font-size: 10px;" href="${path}/admin/applyList.do?eno=${event.eno }">참여자 확인</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty eventList}">
                        <tr>
                            <td colspan="6" class="has-text-centered"> 작성된 이벤트가 없습니다. </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>
</section>
<script async type="text/javascript" src="${path}/resources/js/bulma.js"></script>
<script type="text/javascript">
    jQuery(function ($){
        $("#event-table").DataTable();
    })
</script>
<!-- 이벤트관리 영역 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>