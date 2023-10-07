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

<!-- 이벤트 시작-->
<div class="content" id="content" style="margin-top: 100px;">
    <div class="row column text-center" >
        <div class="container">
            <div class="buttons is-right" style="margin-top: 30px;">
                <c:if test='${sid eq "admin"}'>
                    <a class="button" href="${path}/event/delete.do?eno=${event.eno}" style="color:#0a0a0a; text-decoration: none;">글 삭제</a>
                    <a class="button is-primary" href="${path}/event/edit.do?eno=${event.eno}" style="margin-left:10px; margin-right:10px; background-color: #FF0043; text-decoration: none;">글 수정</a>
                </c:if>
                <a class="button" href="${path}/event/list.do" style="float:right; color:#0a0a0a; text-decoration: none;">글 목록</a>
            </div>
            <table id="table">
                <tbody>
                <tr style="border-top: solid #808080FF 1px;">
                    <td style="font-weight: bold; font-size: 30px;">${event.title }</td>
                </tr>
                <tr style="border-bottom: solid #808080FF 1px;">
                    <td style="border-bottom: solid #808080FF 1px;">
                        <p class="mb-0" style="font-weight: bold;">이벤트 기간 | ${event.sdate } ~ ${event.edate}</p>
                    </td>
                </tr>
                <tr style="border-bottom: solid grey 1px;">
                    <td style="padding-top: 50px; padding-bottom: 50px;"><p>${event.content }</p></td>
                </tr>
                </tbody>
            </table>
            <div class="container mb-100">
                <c:if test="${sid ne null && event.status eq '1'}">
                <div class="container">
                    <input type="hidden" name="id" id="id" value="${sid}">
                    <input type="hidden" id="eno" name="eno" value="${event.eno}">
                    <input type="hidden" name="app_chk" id="app_chk" value="no">
                    <button type="button" id="ck_btn" class="button is-fullwidth is-primary" onclick="appCheck()" style="height:72px; background-color: #FF0043;">신청하기</button>
                </div>
                <script>
                    function appCheck() {
                        var child;
                        let params = { id: $("#id").val(), eno: $("#eno").val()};
                        $.ajax({
                            url: "${path}/apply/appCheck.do",
                            type: "post",
                            dataType: "json",
                            data: params,
                            success:function(data) {
                                console.log("HI");
                                let appPass = data.result;
                                if(!appPass) {
                                    //$("#app_chk").val("no");
                                    alert("이미 신청한 회원입니다.");
                                } else {
                                    //$("#app_chk").val("yes");
                                    child = window.open("${path}/apply/insert.do?eno="+$("#eno").val()+"&id="+$("#id").val(), "child", "width=700, height=500");
                                }
                            },
                            error:function(res) {
                                alert(" 잠시 후 다시 시도해주세요.");
                                console.log(res.responseText);
                            }
                        })
                    }
                </script>
            </div>
            </c:if>
        </div>
    </div>
</div>
<!-- 이벤트 끝-->

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>