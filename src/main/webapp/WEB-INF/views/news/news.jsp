<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴스</title>
    <jsp:include page="../setting/head.jsp"/>
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/bulma-divider.min.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito&display=swap');
        body {font-family: 'Nunito', sans-serif;};
        nav.navbar {
            height: 6rem !important;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06) !important;
        }
        ::-webkit-scrollbar{height:10px;width:10px}::-webkit-scrollbar-track{background:#efefef;border-radius:6px}::-webkit-scrollbar-thumb{background:#d5d5d5;border-radius:6px}::-webkit-scrollbar-thumb:hover{background:#c4c4c4}
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 교육뉴스 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 뉴스 크롤링 시작-->
<section class="hero ">
    <div class="hero-body">
        <div class="container">
            <div class="columns">
                <div class="column is-8 is-offset-2">
                    <figure class="image is-16by9">
                        <img src="${path}/resources/images/first-post.png" alt="news">
                    </figure>
                </div>
            </div>

            <c:forEach var="url" items="${urls}" varStatus="status" begin="67" end="72">
            <section class="section">
                <div class="columns">
                    <div class="column is-8 is-offset-2">
                        <div class="content is-medium">
                            <h2 class="subtitle is-4">${regdates[status.index]}</h2>
                            <h1 class="title"><a href="${url}" target="_blank" style="text-decoration: none;">${titles[status.index]}</a></h1>
                            <p>${contents[status.index]}</p>
                        </div>
                    </div>
                </div>
            </section>

            <div class="is-divider"></div>

            </c:forEach>

        </div>
    </div>
</section>
<!-- 뉴스 클롤링 끝-->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>