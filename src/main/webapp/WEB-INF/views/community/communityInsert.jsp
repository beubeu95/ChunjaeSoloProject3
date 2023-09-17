<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글쓰기</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 커뮤니티 글쓰기 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<section class="section">
    <form action="${path}/community/insert.do" method="post" class="container">
        <div class="columns">
            <div class="column is-one-quarter">
                <label for="cate"> 카테고리 </label>
                <select name="cate" id="cate" class="input">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.cate}">${category.cateName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="column">
                <label for="title"> 제목 </label>
                <input type="text" id="title" name="title" class="input">
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <label for="content"> 내용 </label>
                <textarea class="textarea" id="content" name="content" cols="30" rows="10" maxlength="1000"></textarea>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <input type="submit" class="btn btn-sm btn-primary ml-4" value="등록하기" style="text-decoration: none; color:#fff;"/>
            </div>
        </div>
    </form>
</section>

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->


</body>
</html>
