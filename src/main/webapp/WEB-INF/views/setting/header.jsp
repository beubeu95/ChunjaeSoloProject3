<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<nav class="navbar is-sticky-top navigation" role="navigation" aria-label="main navigation">
    <div class="container">
        <!--로고 시작-->
        <div class="navbar-brand">
            <a class="navbar-item" href="${path}">
                <img class="img-fluid" src="${path}/resources/images/teaspoonLogo.png" alt="teaspoon" width="155px">
            </a>

            <a role="button" class="navbar-burger burger" aria-expanded="false" data-target="navbar-links">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div id="navbar-links" class="navbar-menu">
            <!--메뉴바 시작 -->
            <div class="navbar-start ml-auto">
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="${path}">Home</a>
                    <div class="navbar-dropdown">
                    <a href="${path }" class="navbar-item">소개</a>
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="${path}/community/list.do">커뮤니티</a>
                    <div class="navbar-dropdown">
                        <a href="${path}/community/list.do" class="navbar-item">커뮤니티</a>
                        <a href="${path}/fileboard/list.do" class="navbar-item">자료실</a>
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="${path}">이벤트</a>
                    <div class="navbar-dropdown">
                        <a href="${path }/event/list.do" class="navbar-item">이벤트</a>
                        <a href="${path }" class="navbar-item">이벤트발표</a>
                    </div>
                </div>
                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link" href="${path}/notice/list.do">고객지원</a>
                    <div class="navbar-dropdown">
                        <a href="${path}/notice/list.do" class="navbar-item">공지사항</a>
                        <a href="${path}/faq/list.do" class="navbar-item">FAQ</a>
                        <a href="${path}/qna/list.do" class="navbar-item">QNA</a>
                    </div>
                </div>
            </div>
            <!--로그인 메뉴 -->
            <div class="navbar-end ml-0">
                <div class="navbar-item py-0">
                    <c:if test="${sid eq null}">
                        <a href="${path}/member/term.do" class="btn btn-sm btn-outline-primary ml-4">Sign up</a>
                        <a href="${path}/member/login.do" class="btn btn-sm btn-primary ml-4">Log in</a>
                    </c:if>
                    <c:if test="${sid ne null and sid ne 'admin'}">
                        <a href="${path}/member/login2.do" class="btn btn-sm btn-outline-primary ml-4">MyPage</a>
                        <a href="${path}/member/logout.do" class="btn btn-sm btn-primary ml-4">LogOut</a>
                    </c:if>
                    <c:if test="${sid ne null and sid eq 'admin'}">
                        <a href="${path}/admin/list.do" class="btn btn-sm btn-outline-primary ml-4">Admin</a>
                        <a href="${path}/member/logout.do" class="btn btn-sm btn-primary ml-4">LogOut</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</nav>