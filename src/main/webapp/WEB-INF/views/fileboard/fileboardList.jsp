<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 자료실 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 자료실 영역 시작 -->
<div class="content" id="content" style="margin-top: 60px;">
    <div class="row column text-center">
        <div class="container">
            <div>
                <div class="button-group" style="float:right; margin-left:20px;">
                    <a class="button" href="${path }/fileboard/insert.do">글쓰기</a>
                </div>
                <table class="table mb-100" id="file-table">
                    <thead>
                    <tr>
                        <td class="has-text-centered" style="width: 10%">#</td>
                        <td style="width: 65%">제목</td>
                        <td class="has-text-centered" style="width: 10%">작성자</td>
                        <td class="has-text-centered" style="width: 15%">작성일</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${fileboardList }" var="fileboard" varStatus="status">
                        <tr>
                            <td class="has-text-centered">${status.count }</td>
                            <td><a href="${path}/fileboard/detail.do?articleno=${fileboard.articleno }"
                                   style="color: #000000;">${fileboard.title }</a></td>
                            <td>${fileboard.id }</td>
                            <td class="has-text-centered">
                                <fmt:parseDate value="${fileboard.regdate }" var="resdate"
                                               pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty fileboardList}">
                        <tr>
                            <td colspan="6" class="has-text-centered"> 등록된 자료가 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 자료실 영역 끝-->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->
</body>
</html>