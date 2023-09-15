<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>티스푼</title>
    <jsp:include page="./setting/head.jsp" />
</head>
<body>
<div class="container is-fullhd">

    <!--헤더 시작 -->
    <jsp:include page="./setting/header.jsp" />
    <!-- 헤더 끝 -->

    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-link">
                <div class="hero-body">
                    <p class="title">
                        Medium hero
                    </p>
                    <p class="subtitle">
                        Medium subtitle
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="contents">
        ${today } <h2>${myName }</h2><hr>
        <div class="columns loginModule">
            <div class="column"></div>
            <div class="column"></div>
            <jsp:include page="./include/loginModule.jsp" />
        </div>
    </div>

    <!-- 푸터 시작 -->
    <jsp:include page="./setting/footer.jsp" />
    <!-- 푸터 끝 -->
</div>
</body>
</html>