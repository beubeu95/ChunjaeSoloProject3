<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실 수정하기</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 자료실 수정하기 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->


<!-- 자료실 수정하기 시작 -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 bg-white shadow rounded content">
                    <form action="${path }/fileboard/edit.do" id="writeform" method="post" enctype="multipart/form-data">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12">
                                <label for="title"> 제목 </label>
                                <input type="hidden" id="articleno" name="articleno" value="${fileboard.articleno}">
                                <input type="text" class="input" id="title" name="title" placeholder="제목을 입력해주세요" autocomplete="off" value="${fileboard.title}" autofocus required>
                            </div>
                            <!-- 내용 입력 부분 -->
                            <div class="form-group column is-12">
                                <label for="content"> 내용 </label>
                                <textarea name="content" id="content" class="textarea has-fixed-size" cols="30" rows="20" placeholder="내용을 입력해주세요" required>${fileboard.content}</textarea>
                            </div>
                            <!-- 파일 선택 부분 -->
                            <div class="form-group column is-8">
                                <div class="file has-name">
                                    <label class="file-label">
                                        <input class="file-input" type="file" name="upfile" multiple="multiple">
                                        <span class="file-cta">
                                            <span class="file-icon mb-0">
                                                <i class="fas fa-upload mb-0"></i>
                                            </span>
                                            <span class="file-label mb-0">
                                                파일 선택
                                            </span>
                                        </span>
                                        <span class="file-name">선택된 파일이 없습니다.</span>
                                    </label>
                                </div>
                            </div>
                            <div class="column is-4 has-text-right">
                                <button type="reset" class="button"> 초기화 </button>
                                <button type="submit" class="button is-primary"> 작성하기 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 자료실 수정하기 끝 -->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 파일 입력 요소 변경 시 파일 이름 표시
    $('.file-input').on('change', function () {
        var fileName = $(this).val().split('\\').pop();
        $('#file-name-display').text('\t선택한 파일: ' + fileName);
    });
</script>
</html>
