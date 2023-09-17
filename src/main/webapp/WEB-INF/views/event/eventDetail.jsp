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
    <title>이벤트 상세보기</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 이벤트 상세보기 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 이벤트 글 상세보기 시작-->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="container">
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">글 제목</th>
                            <td>${event.title }</td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">이벤트기간</th>
                            <td>${event.sdate } ~ ${event.edate}</td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">읽은 횟수</th>
                            <td>${event.cnt }</td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">글 내용</th>
                            <td><p>${event.content }</p></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="button-group">
                        <a class="button is-info" href="${path}/event/list.do">글 목록</a>
                        <c:if test='${sid eq "admin"}'>
                            <a class="button is-primary" href="${path}/event/delete.do?bno=${event.eno}">글 삭제</a>
                            <a class="button is-danger" href="${path}/event/edit.do?bno=${event.eno}">글 수정</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 이벤트 글 상세보기 끝 -->

<!-- 이벤트 신청하기 시작-->
<div class="container">
    <form action="${path}/apply/insert.do" method="post" class="columns mt-5">
        <div class="column is-four-fifths">
            <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                <div class="field-label is-normal">
                    <label class="label">이메일</label>
                </div>
                <div class="field-body">
                    <div class="field">
                        <p class="control">
                            <input type="email" name="email" id="email" placeholder="이메일 입력" maxlength="98" class="input" required>
                        </p>
                    </div>
                </div>
            </div>
            <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                <div class="field-label is-normal">
                    <label class="label">전화번호</label>
                </div>
                <div class="field-body">
                    <div class="field">
                        <p class="control">
                            <input type="tel" name="tel" id="tel" placeholder="번호 입력" maxlength="98" class="input" required>
                        </p>
                    </div>
                </div>
            </div>
            <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                <div class="field-label is-normal">
                    <label class="label">주소</label>
                </div>
                <div class="field-body">
                    <div class="field">
                        <p class="control">
                            <input type="text" id="addr1" name="addr1" placeholder="기본 주소를  입력해주세요" class="input" autocomplete="off" readonly>
                            <input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" class="input mt-3" autocomplete="off" required>

                            <div class="column is-9-tablet">
                                <div class="control">
                                    <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" class="input" autocomplete="off" readonly>
                                </div>
                            </div>
                            <div class="column is-3-tablet pl-0">
                                <button type="button" class="btn btn-sm btn-outline-primary ml-4" onclick="findAddr()"> 우편번호  </button>
                            </div>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="column">
            <input type="hidden" id="name" name="name" value="sid">
            <input type="hidden" id="eno" name="eno" value="${event.eno}">
            <input type="submit" class="button is-fullwidth is-primary" style="height:72px" value="전송">
        </div>
    </form>
    <script>
        function findAddr() {
            new daum.Postcode({
                oncomplete: function (data) {
                    console.log(data);
                    var roadAddr = data.roadAddress;
                    var jibunAddr = data.jibunAddress;
                    document.getElementById("postcode").value = data.zonecode;
                    if (roadAddr !== '') {
                        document.getElementById("addr1").value = roadAddr;
                    } else if (jibunAddr !== '') {
                        document.getElementById("addr1").value = jibunAddr;
                    }
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
<!-- 이벤트 신청하기 끝-->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>