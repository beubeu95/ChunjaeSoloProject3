<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <jsp:include page="../setting/head.jsp"/>
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />
  <link rel="stylesheet" type="text/css" href="${path}/resources/css/neumorphic-login.css">
</head>
<body>

<!-- 헤더 시작 -->
<jsp:include page="../setting/header.jsp" />
<!-- 헤더 끝 -->

<!-- 배너 영역 시작 -->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/images/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
  <div class="container">
    <div class="has-text-centered" style="padding-top: 60px;">
      <h1 class="has-text-white font-tertiary" style="font-size: 40px; "> 로그인 </h1>
    </div>
  </div>
</section>
<!-- 배너 영역 끝 -->

<!-- 로그인 시작 -->
<section class="hero is-fullheight">
  <div class="hero-body has-text-centered">
    <div class="login">
      <a href="/"><img src="${path }/resources/images/teaspoonFavi.png"></a>
      <form action="${path }/member/loginpro.do" method="post" name="login">
        <div class="field">
          <div class="control">
            <input class="input is-medium is-rounded" type="text" name="id" id="id" placeholder="아이디 입력" required />
          </div>
        </div>
        <div class="field">
          <div class="control">
            <input class="input is-medium is-rounded" type="password" name="pw" id="pw" placeholder="비밀번호 입력" required />
          </div>
        </div>
        <br />
        <button class="button is-block is-fullwidth is-primary is-medium is-rounded" type="submit" style="background-color: #ff3369;">
          Login
        </button>
      </form>
      <br>
      <nav class="level">
        <div class="level-item has-text-centered">
          <div>
            <h6> 처음이신가요? </h6>
          </div>
        </div>
        <div class="level-item has-text-centered">
          <div>
            <a href="${path}/member/term.do" style="color :#ff3369;">회원가입</a>
          </div>
        </div>
      </nav>
    </div>
  </div>
</section>
<!-- 로그인 끝 -->

<!--푸터 시작-->
<jsp:include page="../setting/footer.jsp" />
<!--푸터 끝 -->

</body>
</html>
