<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실 상세보기</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 자료실 상세보기 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 공지사항 글 상세보기 시작-->
<div class="content" id="content" style="margin-top: 100px;">
    <div class="row column text-center">
        <div class="container">
<%--            내용 부분--%>
    <table class="table">
        <thead>
        <tr>
            <th class="item2">제목</th>
            <th class="item3">작성일</th>
            <th class="item4">작성자</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="item2">${dto.title}</td>
            <td class="item3">${dto.regdate}</td>
            <td class="item4">${dto.id}</td>
        </tr>
        <tr>
            <td colspan="3">
                ${dto.content}
            </td>
        </tr>
        <tr>
            <th class="item2" colspan="3">학습자료(클릭하여 다운로드)</th>
        </tr>
        <tr>
            <td colspan="3">
                <c:if test="${!empty dto2.originFile}">
                    <a href="${pageContext.request.contextPath}/resources/upload/${dto2.saveFolder}/${dto2.saveFile}" download="${dto2.originFile }"><i class="fas fa-file" style="color: #54c066;"></i> ${dto2.originFile }</a>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>

<%--            버튼 그룹부분--%>
    <div class="button-group" style="margin-top: 30px; margin-left: 1070px; margin-bottom: 100px;">
        <c:if test='${sid eq "admin"}'>
            <a class="button" href="${path }/fileboard/delete.do?articleno=${dto.articleno}">글 삭제</a>
            <a class="button" href="${path }/fileboard/edit.do?articleno=${dto.articleno}">글 수정</a>
        </c:if>
        <a class="button" href="${path }/fileboard/list.do" style="float:right;">글 목록</a>
    </div>
        </div>
    </div>
</div>
<!-- 공지사항 글 상세보기 끝 -->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>