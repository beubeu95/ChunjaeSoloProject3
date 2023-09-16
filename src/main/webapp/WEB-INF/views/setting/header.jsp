<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<nav class="navbar is-sticky-top navigation" role="navigation" aria-label="main navigation">
    <div class="container">
        <div class="navbar-brand">
            <a class="navbar-item" href="index.html">
                <img class="img-fluid" src="${path}/resources/images/teaspoonLogo.png" alt="teaspoon" width="155px">
            </a>

            <a role="button" class="navbar-burger burger" aria-expanded="false" data-target="navbar-links">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div id="navbar-links" class="navbar-menu">
            <div class="navbar-start ml-auto">
                <a class="navbar-item" href="index.html">Home</a>
                <a class="navbar-item" href="list.html">Inner Page</a>
                <a class="navbar-item" href="search.html">Search Page</a>
            </div>

            <div class="navbar-end ml-0">
                <div class="navbar-item py-0">
                    <a href="changelog.html" class="btn btn-sm btn-outline-primary ml-4">changelog</a>
                    <a href="contact.html" class="btn btn-sm btn-primary ml-4">contact</a>
                </div>
            </div>
        </div>
    </div>
</nav>