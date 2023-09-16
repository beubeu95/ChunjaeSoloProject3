<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<footer>
    <div class="container">
        <div class="columns is-multiline is-align-items-center border-bottom py-5">
            <div class="column is-4-desktop is-12-tablet">
                <ul class="list-inline footer-menu has-text-centered has-text-left-desktop">
                    <li class="list-inline-item"><a href="changelog.html">introdice</a></li>
                    <li class="list-inline-item"><a href="contact.html">qna</a></li>
                    <li class="list-inline-item"><a href="search.html">Search</a></li>
                </ul>
            </div>
            <div class="column is-4-desktop is-12-tablet">
                <a class="navbar-brand is-justify-content-center" href="${path}">
                    <img class="img-fluid" src="${path}/resources/images/teaspoonLogo.png" alt="Hugo documentation theme">
                </a>
            </div>
            <div class="column is-4-desktop is-12-tablet">
                <ul class="list-inline social-icons has-text-right-desktop has-text-centered">
                    <li class="list-inline-item"><a href="#"><i class="ti-facebook"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="ti-twitter-alt"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="ti-github"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="ti-linkedin"></i></a></li>
                </ul>
            </div>
            <div class="container">
                <div class="columns" style="margin: 30px; margin-left: 100px;">
                    <div class="column is-one-quarter">
                        <p class="title is-4">
                            <a href="${path}">HOME</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">소개</a>
                        </p>
                    </div>
                    <div class="column is-one-quarter">
                        <p class="title is-5">
                            <a href="${path}">커뮤니티</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">공지사항</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">커뮤니티</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">자료실</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">식단표</a>
                        </p>
                    </div>
                    <div class="column is-one-quarter">
                        <p class="title is-5">
                            <a href="${path}">이벤트</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">진행 중 이벤트</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">당첨자 발표</a>
                        </p>
                    </div>
                    <div class="column is-one-quarter">
                        <p class="title is-5">
                            <a href="${path}">고객지원</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">FAQ</a>
                        </p>
                        <p class="bd-footer-link">
                            <a href="${path}">Q&A</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="py-4 has-text-centered">
            <small class="text-light">Copyright © 2020 - Design &amp; Developed by <a href="https://themefisher.com">teaspoon</a></small>
        </div>
    </div>
</footer>
