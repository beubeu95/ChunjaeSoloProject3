<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="theme-name" content="godocs-bulma" />
    <title>Teaspoon</title>
    <link rel="stylesheet" href="${path }/resources/css/main4.css">
    <jsp:include page="./setting/head.jsp" />

</head>
<body>
<!--헤더 시작-->
<jsp:include page="./setting/header.jsp" />
<!--헤더 끝 -->

<!-- banner -->
<jsp:include page="contents/main1.jsp" />
<!-- /banner -->

<!-- topics -->
<jsp:include page="contents/main2.jsp" />
<!-- /topics -->

<!-- books -->
<jsp:include page="contents/main3.jsp" />
<!-- /books -->

<!-- call to action -->
<jsp:include page="contents/main4.jsp" />
<!-- /call to action -->

<!-- board -->
<jsp:include page="contents/main5.jsp" />
<!-- /board-->

<!--푸터 시작-->
<jsp:include page="./setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>
