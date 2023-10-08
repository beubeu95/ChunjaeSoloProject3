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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 회원관리 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 회원관리 영역 시작 -->
<section class="pt-5">
    <div class="container shadow section-sm rounded">
        <div class="columns is-multiline">
            <!-- sidebar -->
            <div class="column is-3-desktop is-12-tablet">
                <ul class="sidenav">
                    <li title="Basic Startup" class="sidelist parent active">
                        <a href="${path}/admin/memberlist.do">회원관리</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/admin/eventlist.do">이벤트관리</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/member/eventMngt.do">QNA관리</a>
                    </li>
                </ul>
            </div>

            <div class="container">
                <table class="table" id="member-table">
                    <thead>
                    <tr>
                        <th width="100">아이디</th>
                        <th width="100">이름</th>
                        <th width="120">가입일</th>
                        <th width="80">강퇴</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberList}" var="member" varStatus="status">
                        <tr>
                            <td>${member.id }</td>
                            <td>${member.name}</td>
                            <td>
                                <fmt:parseDate value="${member.regdate}" var="resdate"
                                               pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                <div class="button-group" style="align-items: center">
                                    <a class="button is-danger"
                                       href="${path}/admin/memberDelete.do?id=${member.id }">강퇴</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty memberList}">
                        <tr>
                            <td colspan="5" class="has-text-centered"> 가입한 회원이 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script async type="text/javascript" src="${path}/resources/js/bulma.js"></script>
<script type="text/javascript">
    jQuery(function ($) {
        $("#member-table").DataTable();
    })
</script>
<!-- 회원관리 영역 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>