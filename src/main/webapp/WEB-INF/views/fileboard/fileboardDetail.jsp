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

<!-- 자료실 상세보기 시작-->
<div class="content" id="content" style="margin-top: 100px;">
    <div class="row column text-center">
        <div class="container">
            <table class="table">
                <thead>
                <tr>
                    <th class="item2">제목</th>
                    <th class="item3">작성자</th>
                    <th class="item4">작성일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="item2">${fileboard.title}</td>
                    <td class="item3">${fileboard.id}</td>
                    <td class="item4">${fileboard.regdate}</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div style="display: block; min-height: 300px">
                            ${fileboard.content}
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="item2" colspan="3">학습자료(클릭하여 다운로드)</th>
                </tr>
                <tr>
                    <td colspan="3">
                        <c:forEach var="item" items="${fileboard2}">
                            <a href="${pageContext.request.contextPath}/resources/upload/${item.saveFolder}/${item.saveFile}" download="${item.originFile }" style="margin-right: 20px"><i class="fa-solid fa-file"></i> ${item.originFile } </a>
                        </c:forEach>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="buttons is-right mb-100">
                <a class="button" href="${path }/fileboard/list.do">목록</a>
                <c:if test='${sid eq "admin"}'>
                    <a class="button" href="${path }/fileboard/edit.do?articleno=${fileboard.articleno}">수정</a>
                    <a class="button" href="${path }/fileboard/delete.do?articleno=${fileboard.articleno}">삭제</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- 자료실 상세보기 끝 -->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>