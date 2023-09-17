<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 글쓰기</title>
    <jsp:include page="../setting/head.jsp"/>
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
</head>
<body>

<!-- 헤더 시작 -->
<jsp:include page="../setting/header.jsp" />
<!-- 헤더 끝 -->

<!-- 배너 영역 시작 -->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/images/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container">
        <div class="has-text-centered" style="padding-top: 60px;">
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 이벤트 글쓰기</h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!--이벤트 글쓰기 시작-->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="container">
                    <form action="${path }/event/insert.do" method="post">
                        <table id="table1">
                            <tbody>
                            <tr>
                                <th style="background-color:#dcdcdc">글 제목</th>
                                <td>
                                    <input type="text" name="title" id="title" class="input" placeholder="제목 입력" maxlength="98" required>
                                </td>
                            </tr>
                            <tr>
                                <th style="background-color:#dcdcdc">시작일</th>
                                <td>
                                    <input type="date" name="sdate" id="sdate" class="input" placeholder="시작일 지정해주세요" autocomplete="off" required>
                                </td>
                            </tr>
                            <tr>
                                <th style="background-color:#dcdcdc">종료일</th>
                                <td>
                                    <input type="date" name="edate" id="edate" class="input" placeholder="종료일 지정해주세요" autocomplete="off" required>
                                </td>
                            </tr>
                            <tr>
                                <th style="background-color:#dcdcdc">이벤트 상태</th>
                                <td>
                                    <label><input type="radio" name="status" id="now" value="1" checked>진행중</label> &nbsp;&nbsp;
                                    <label><input type="radio" name="status" id="end" value="0">종료</label>
                                </td>
                            </tr>
                            <tr>
                                <th style="background-color:#dcdcdc">글 내용</th>
                                <td>
                                    <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required></textarea>
                                    <script>
                                        CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/event/imageUpload.do'});
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" class="submit button is-info" value="글 등록" >
                                    <a class="button is-primary" href="${path }/event/list.do">글 목록</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!--이벤트 글쓰기 끝-->


<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>