<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 회원가입 </title>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../setting/header.jsp" />
<!-- 헤더 끝 -->

<!-- 배너 영역 시작 -->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/images/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container">
        <div class="has-text-centered" style="padding-top: 60px;">
            <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 회원가입 </h1>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 회원가입 시작-->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 shadow rounded content">
                    <h3 class="has-text-centered" style="font-weight: bold;"> 회원가입 </h3>
                    <hr>
                    <form name="frm1" id="frm1" action="${path}/member/join.do" class="columns is-multiline is-centered" method="post" onsubmit="return joinCheck(this)">
                        <div class="column is-10-tablet">
                            <label for="id" class="label"> 아이디 </label>
                            <div class="columns">
                                <div class="column is-four-fifths" style="padding-right: 0px;">
                                    <div class="control">
                                        <input type="text" class="input" id="id" name="id" placeholder="영문 소문자, 숫자를 혼용하여 아이디를 입력해주세요"
                                               pattern="^[a-z0-9]{8,16}" maxlength="16" autocomplete="off" autofocus required>
                                        <input type="hidden" name="id_chk" id="id_chk" value="no">
                                        <p id="msg" style="color: red"></p>
                                    </div>
                                </div>
                                <div class="column">
                                    <button type="button" class="btn btn-sm btn-outline-primary ml-4" onclick="idCheck()" style="width: 100px; padding-right: 10px; padding-left: 10px;"> 중복확인 </button>
                                </div>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="pw" class="label"> 비밀번호 </label>
                            <div class="control">
                                <input type="password" id="pw" name="pw" placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하" class="input"
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="pw_chk" class="label"> 비밀번호 확인 </label>
                            <div class="control">
                                <input type="password" id="pw_chk" name="pw_chk" placeholder="비밀번호 확인을 입력해주세요" class="input"
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                                <p id="pw_msg" style="color:red;"></p>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="name" class="label"> 이름 </label>
                            <div class="control">
                                <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" class="input" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="email" class="label"> 이메일 </label>
                            <div class="control">
                                <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요" class="input" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="tel" class="label"> 전화번호 </label>
                            <div class="control">
                                <input type="tel" id="tel" name="tel" placeholder="전화번호를 입력해주세요" class="input" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="tel" class="label"> 주소 </label>
                            <div class="control">
                                <input type="text" id="addr1" name="addr1" placeholder="기본 주소를  입력해주세요" class="input" autocomplete="off" readonly>
                                <input type="text" id="addr2" name="addr2" placeholder="상세 주소를 입력해주세요" class="input mt-3" autocomplete="off" required>
                                <div class="columns mt-1">
                                    <div class="column is-9-tablet">
                                        <div class="control">
                                            <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요" class="input" autocomplete="off" readonly>
                                        </div>
                                    </div>
                                    <div class="column is-3-tablet pl-0">
                                        <button type="button" class="btn btn-sm btn-outline-primary ml-4" onclick="findAddr()"> 우편번호  </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="column is-10-tablet">
                            <label for="tel" class="label"> 생년월일 </label>
                            <div class="control">
                                <input type="date" id="birth" name="birth" placeholder="생년월일을 입력해주세요" class="input" autocomplete="off" required>
                            </div>
                        </div>
                        <div class="column is-10-tablet is-10">
                            <button type="submit" class="button is-primary is-fullwidth" style=" background-color :#ff3369;"> 회원가입 </button>
                            <p class="has-text-centered mt-4"> 이미 회원이신가요? <a href="${path}/member/login.do" style="font-weight: bold;"> 로그인하기 </a> </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function() {
        $("#id").keyup(function() {
            $("#id_chk").val("no");
            if($(this).val() != "") {
                $("#msg").html("아이디 중복 체크를 진행해주세요");
            }
        });
        $("#pw, #pw_chk").keyup(function() {
            $("#pw_msg").html("");
        });
    });

    // 아이디 중복 체크 함수
    function idCheck() {
        if($("#id").val() == "") {
            $("#msg").html("아이디를 입력한 후 중복 체크를 진행해주세요");
            $("#id").focus();
            return;
        }

        let params = { id:$("#id").val() };
        $.ajax({
            url: "${path}/member/idCheck.do",
            type: "post",
            dataType: "json",
            data: params,
            success:function(data) {
                console.log("HI");
                let idPass = data.result;
                if(!idPass) {
                    $("#id_chk").val("no");
                    $("#msg").text("기존에 사용되고 있는 아이디입니다.");
                    $("#id").focus();
                } else if(idPass) {
                    $("#id_chk").val("yes");
                    $("#msg").text("사용 가능한 아이디입니다.");
                } else if(idPass == "") {
                    $("#msg").text("아이디가 확인되지 않았습니다. 다시 시도해주세요.")
                }
            },
            error:function(res) {
                alert("아이디 중복 확인에 실패했습니다. 잠시 후 다시 시도해주세요.");
                console.log(res.responseText);
            }
        })
    }
</script>
<script>
    function joinCheck(f) {
        if(f.pw.value != f.pw_chk.value) {
            $("#pw_msg").html("비밀번호와 비밀번호 확인이 서로 다릅니다");
            f.pw.focus();
            return false;
        }
        if(f.id_chk.value != "yes") {
            $("#msg").html("아이디 중복 체크를 진행해주세요");
            f.id.focus();
            return false;
        }
    }
    function findAddr(){
        new daum.Postcode({
            oncomplete:function(data){
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("addr1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("addr1").value = jibunAddr;
                }
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--회원가입 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>
