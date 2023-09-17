<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실 글쓰기</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 자료실 글쓰기 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->


<!-- 자료실 글쓰기 시작 -->
<div class="content" id="content" style="margin-top: 100px;">
    <div class="row column text-center">
        <div class="container">
            <form action="${path }/fileboard/insert.do" id="writeform" method="post" enctype="multipart/form-data">
                <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                    <div class="field-label is-normal">
                        <label class="label">제목</label>
                    </div>
                    <div class="field-body">
                        <div class="field">
                            <p class="control">
                                <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" class="input" required>
                            </p>
                        </div>
                    </div>
                </div>
<%--        내용 입력부분--%>
                <div class="field is-horizontal">
                    <div class="field-label is-normal">
                        <label class="label">내용</label>
                    </div>
                    <div class="field-body">
                        <div class="field">
                            <div class="control">
                                <textarea name="content" id="content" class="textarea is-focused" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required></textarea>
                            </div>
                        </div>
                    </div>
                </div>
<%--                파일 선택부분--%>
                <div class="file is-horizontal" style="margin-left: 180px">
                    <label class="file-label">
                        <input class="file-input" type="file" name="upfile" multiple="multiple">
                             <span class="file-cta">
                                <span class="file-icon">
                                    <i class="fas fa-upload"></i>
                                </span>
                                  <span class="file-label">
                                              파일 선택
                                  </span>
                             </span>
                    </label>
                    <p id="file-name-display"></p>
                </div>
<%--                글작성 초기화 버튼부분--%>
                <div class="field is-horizontal" style="margin-top: 30px;">
                    <div class="field-label"></div>
                    <div class="field-body">
                        <div class="field is-grouped is-grouped-right">
                            <div class="control">
                                <button type="submit" id="writeBtn" class="btn btn-sm btn-primary ml-4" style="text-decoration:none;">글작성</button>
                                <button type="reset" class="btn btn-sm btn-primary ml-4" style="color:#fff; text-decoration:none;">초기화</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 공지사항 글쓰기 끝 -->

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