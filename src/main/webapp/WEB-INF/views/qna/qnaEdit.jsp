<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA 수정하기</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> QNA 수정하기 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!--질문 등록하기-->

<div class="content" style="margin-top: 100px;">
    <div class="row column text-center">
        <div class="container">
            <form action="${path}/qna/edit.do" method="post">
                <!--질문 제목-->
                <div class="field is-horizontal">
                    <div class="field-label is-normal" style="height: 60px; margin-bottom:0px;">
                        <label class="label">제목</label>
                    </div>
                    <div class="field-body">
                        <div class="field">
                            <p class="control">
                                <input type="hidden" name="qno" id="qno" value="${dto.qno }" >
                                <input class="input" type="text" name="title" id="title" placeholder="제목" maxlength="98" value="${dto.title }"required>
                            </p>
                        </div>
                    </div>
                </div>
                <!--질문 내용-->
                <div class="field is-horizontal">
                    <div class="field-label is-normal">
                        <label class="label">질문 내용</label>
                    </div>
                    <div class="field-body">
                        <div class="field">
                            <p class="control">
                                <textarea class="textarea" name="content" id="content" placeholder="질문내용을 입력하시오" rows="8" cols="100" maxlength="800" style="resize: none;" required>${dto.content }</textarea>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="button-group" style="margin-top: 30px; margin-bottom: 100px;">
                    <input class="button is-primary" type="submit" value="글등록" style="float:right; margin-left:10px;">
                    <a class="button" href="${path }/qna/list.do" style="float:right;">글 목록</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->
</body>
</html>