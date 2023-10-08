<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
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
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 나의정보수정 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 마이페이지 영역 시작 -->
<section class="pt-5">
    <div class="container shadow section-sm rounded">
        <div class="columns is-multiline">
            <!-- sidebar -->
            <div class="column is-3-desktop is-12-tablet">
                <ul class="sidenav">
                    <li title="Basic Startup" class="sidelist parent active">
                        <a href="${path}/member/login2.do">나의 정보 수정</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/member/mngt.do">내가 쓴글</a>
                    </li>
                    <li class="sidelist">
                        <a href="${path}/member/eventMngt.do">이벤트</a>
                    </li>
                </ul>
            </div>

            <!-- body -->
            <div class="column is-8-desktop is-12-tablet">
                <div class="px-4">
                    <h3 class="has-text-centered" style="font-weight: bold;"> 나의정보수정 </h3>
                    <hr>
                    <form name="frm1" id="frm1" action="${path}/member/update.do" class="columns is-multiline is-centered" method="post" onsubmit="return updateCheck(this)">
                        <div class="column is-10-tablet">
                            <label for="id" class="label"> 아이디 </label>
                            <div class="control">
                                <input type="text" class="input" name="id" id="id" size="100" class="input" value="${member.id }" readonly required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="pw" class="label"> 비밀번호 </label>
                            <div class="control">
                                <input type="password" class="input" name="pw" id="pw"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                <p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="pw2" class="label"> 비밀번호 확인 </label>
                            <div class="control">
                                <input type="password" class="input" name="pw2" id="pw2"  class="input"  required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="name" class="label"> 이름 </label>
                            <div class="control">
                                <input type="text" class="input" name="name" id="name" class="input"  value="${member.name }" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="email" class="label"> 이메일 </label>
                            <div class="control">
                                <input type="email" name="email" id="email" class="input" value="${member.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="tel" class="label"> 전화번호 </label>
                            <div class="control">
                                <input type="tel" class="input" name="tel" id="tel" class="input"  value="${member.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="tel" class="label"> 주소 </label>
                            <div class="control">
                                <input type="text" name="addr1" id="addr1" class="input" value="${member.addr1 }"  >
                                <input type="text" name="addr2" id="addr2" class="input mt-3" value="${member.addr2 }">
                                <div class="columns mt-1">
                                    <div class="column is-9-tablet">
                                        <div class="control">
                                            <input type="text" id="postcode" name="postcode" value="${member.postcode }" class="input" >
                                        </div>
                                    </div>
                                    <div class="column is-3-tablet pl-0">
                                        <button type="button" class="btn btn-sm btn-outline-primary ml-4" onclick="findAddr()"> 우편번호 </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="tel" class="label"> 생년월일 </label>
                            <div class="control">
                                <fmt:parseDate value="${member.birth }" var="birth" pattern="yyyy-MM-dd" />
                                <span style="display:none"><fmt:formatDate var="br" value="${birth }" pattern="yyyy-MM-dd" /></span>
                                <input type="birth" name="birth" id="birth" value="${br }" class="input">
                            </div>
                        </div>
                        <div class="column is-10-tablet is-10">
                            <input type="submit" class="btn btn-sm btn-primary ml-4" value="회원정보수정">
                            <input type="reset" class="btn btn-sm btn-outline-primary ml-4" value="취소">
                            <c:if test="${sid=='admin' }">
                                <a href="${path }/member/delete.do?id=${member.id }" class="btn btn-sm btn-outline-primary ml-4">직권 강퇴</a>
                            </c:if>
                            <c:if test="${sid!='admin' }">
                                <a href="${path }/member/delete.do?id=${sid }" class="btn btn-sm btn-outline-primary ml-4">회원 탈퇴</a>
                            </c:if>
                            <c:if test="${sid=='admin' }">
                                <a href="${path }/member/list.do" class="btn btn-sm btn-outline-primary ml-4">회원 목록</a>
                            </c:if>
                        </div>
                    </form>
                    <script>
                        function updateCheck(f){
                            if(f.userpw.value!=f.userpw2.value){
                                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                                return false;
                            }
                        }
                    </script>
                    <script>
                        function findAddr() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    console.log(data);
                                    var roadAddr = data.roadAddress;
                                    var jibunAddr = data.jibunAddress;
                                    document.getElementById("postcode").value = data.zonecode;
                                    if(roadAddr !== '') {
                                        document.getElementById("addr1").value = roadAddr;
                                    } else if(jibunAddr !== ''){
                                        document.getElementById("addr1").value = jibunAddr;
                                    }
                                }
                            }).open();
                        }
                    </script>
                    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 마이페이지 영역 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>