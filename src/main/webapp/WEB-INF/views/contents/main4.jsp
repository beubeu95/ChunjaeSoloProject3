<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<section class="section">
    <div class="container">
        <div class="columns is-align-items-center">
            <div class="column is-4-desktop has-text-centered hidden-on-tablet">
                <img src="${path}/resources/images/cta-illustration.jpg" class="img-fluid" alt="">
            </div>
            <div class="column is-8-desktop has-text-centered-mobile has-text-centered-tablet has-text-left-desktop">
                <h2 class="mb-3">아직 회원이 아니신가요?</h2>
                <p>학부모 커뮤니티 플랫폼 <br> 회원가입 후 여러 자료 및 정보를
                    공유하세요!</p>
                <a href="${path}/member/term.do" class="btn btn-primary">회원가입</a>
            </div>
        </div>
    </div>
</section>