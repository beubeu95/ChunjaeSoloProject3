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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <style>
        table tbody tr:nth-child(2n) {
            background-color: #d3d3d3;
        }

        table > thead {
            background-color: #d3d3d3;
        }
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 미답변 질문 목록 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 미답변 목록 영역 시작 -->
<section class="pt-5">
    <div class="container shadow section-sm rounded">
        <div class="columns is-multiline">
            <!-- sidebar -->
            <div class="column is-3-desktop is-12-tablet">
                <ul class="sidenav">
                    <li class="sidelist">
                        <a href="${path}/admin/memberlist.do">회원관리</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/admin/eventlist.do">이벤트관리</a>
                    </li>
                    <li title="Basic Startup" class="sidelist parent active">
                        <a href="${path}/admin/questionList.do">QNA관리</a>
                    </li>
                </ul>
            </div>

            <div class="container">
                <table class="table is-fullwidth is-center" id="qna-table">
                    <thead>
                    <tr>
                        <th width="15%" class="has-text-centered">글번호</th>
                        <th width="40%" class="has-text-centered">글제목</th>
                        <th width="15%" class="has-text-centered">작성자</th>
                        <th width="20%" class="has-text-centered">작성일</th>
                        <th width="10%" class="has-text-centered">답변</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${noAnswerList }" var="noAnswer" varStatus="status">
                        <tr>
                            <td class="has-text-centered">${noAnswer.qno}</td>
                            <td><a href="${path}/qna/detail.do?qno=${noAnswer.qno}"
                                   style="color: #000000;">${noAnswer.title}</a></td>
                            <td class="has-text-centered">${noAnswer.author}</td>
                            <td class="has-text-centered">${noAnswer.resdate}</td>
                            <td class="has-text-centered"><a
                                    href="${path}/qna/answerInsert.do?qno=${noAnswer.qno}" class="button">답변</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty noAnswerList}">
                        <tr>
                            <td colspan="6" class="has-text-centered"> 질문이 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
                <script type="text/javascript">
                    jQuery(function ($){
                        $("#qna-table").DataTable();
                    })
                </script>
            </div>
        </div>
    </div>
</section>
<!-- 미답변 목록 영역 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>