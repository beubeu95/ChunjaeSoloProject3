<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 당첨자 발표 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 당첨자 발표 영역 시작 -->
<section class="pt-5">
    <div class="container shadow section-sm rounded">
        <div class="columns is-multiline">
            <!-- sidebar -->
            <div class="column is-3-desktop is-12-tablet">
                <ul class="sidenav">
                    <li class="sidelist">
                        <a href="${path}/admin/memberlist.do">회원관리</a>
                    </li>
                    <li title="Basic Startup" class="sidelist parent active">
                        <a href="${path}/admin/eventlist.do">이벤트관리</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/admin/questionList.do">QNA관리</a>
                    </li>
                </ul>
            </div>

            <div class="column is-8-desktop is-12-tablet">
            <div class="container">
                <form action="${path}/admin/annountcementInsert.do" method="post">
                    <!--제목-->
                    <div class="field is-horizontal">
                        <div class="field-label is-normal" style="height: 60px; margin-bottom:0px;">
                            <label class="label">제목</label>
                        </div>
                        <div class="field-body">
                            <div class="field">
                                <p class="control">
                                    <input type="hidden" id="eno" name="eno" value="${event.eno}">
                                    <input class="input" type="text" name="title" id="title" maxlength="98" value="${event.title} 당첨자 발표" required>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!--내용-->
                    <div class="field is-horizontal">
                        <div class="field-label is-normal">
                            <label class="label">내용</label>
                        </div>
                        <div class="field-body">
                            <div class="field">
                                <p class="control">
                                <textarea class="textarea is-focused" name="content" id="content" rows="8" cols="100" maxlength="800" style="resize: none;" required>
                                    <c:forEach var="lotto" items="${lottoList}" varStatus="status">
                                        ${status.count}. id : ${lotto.id} / 이름 : ${lotto.name} <br>
                                    </c:forEach>
                                    당첨자는 개별 연락 드릴 예정입니다.
                                </textarea>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="button-group" style="margin-top: 30px; margin-bottom: 100px;">
                        <input class="button is-primary" type="submit" value="글등록" style="float:right; margin-left:10px;">
                        <a class="button" href="${path }/admin/lottoList.do" style="float:right;">글 목록</a>
                    </div>
                </form>
            </div>
            </div>
        </div>
    </div>
</section>
<!-- 당첨자 발표 영역 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>