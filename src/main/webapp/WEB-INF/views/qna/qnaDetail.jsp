<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA 상세보기</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> QNA 상세보기 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!--QnA 상세보기-->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" id="content" style="margin-top: 100px;">
    <div class="row column text-center">
        <div class="container">
            <table id="table">
                <tobody>
                    <tr style="border-top: solid grey 1px;">
                        <td style="font-weight: bold; font-size: 30px;">${dto.title }</td>
                        <td style="min-width:10%; max-width: 15%; text-align: right; padding-top:30px;">
                            작성자 | ${dto.author}
                        </td>
                        <td style="width: 170px; padding-right: 0px; padding-top:30px;">
                            작성일 | <fmt:parseDate value="${dto.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    <tr style="border-bottom: solid grey 1px;">
                        <td style="padding-top: 50px; padding-bottom: 50px;"><p>${dto.content }</p></td>
                    </tr>
                </tobody>
            </table>
            <div class="button-group" style="margin-top: 30px; float: right; margin-bottom: 100px;">
                <a class="btn btn-sm btn-primary ml-4" href="${path }/qna/list.do" style="text-decoration: none; color:#fff;">글 목록</a>
                <c:if test='${sid eq "admin" && not empty sid}'>
                    <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/qna/answerInsert.do?qno=${dto.qno}" style="text-decoration: none;">답변 등록</a>
                    <a class="btn btn-sm btn-primary ml-4" href="${path }/qna/delete.do?qno=${dto.qno}" style="color:#fff; text-decoration: none;">글 삭제</a>
                </c:if>
                <c:if test='${sid eq dto.author && not empty sid}'>
                    <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/qna/delete.do?qno=${dto.qno}" style="text-decoration: none;">글 삭제</a>
                    <a class="btn btn-sm btn-primary ml-4" href="${path }/qna/edit.do?qno=${dto.qno}" style="color:#fff; text-decoration: none;">글 수정</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
            </div>
        </div>
    </div>
</section>

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->
</body>
</html>