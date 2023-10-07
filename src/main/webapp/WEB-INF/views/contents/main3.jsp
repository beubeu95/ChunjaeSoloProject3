<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<section class="section pb-0">
    <div class="container">
        <h2 class="section-title">티스푼 도서</h2>
        <div class="columns masonry-wrapper">
            <!-- book item -->
            <div class="column is-6-desktop">
                <div class="card card-lg">
                    <div class="card-body">
                        <article class="tile is-child box">
                            <figure class="image">
                                <img src="${path}/resources/images/book1.jpg">
                            </figure>
                            <p class="card-title h5">우등생 국어</p>
                            <a class="button">상세보기</a>
                        </article>
                    </div>
                </div>
            </div>
            <!-- book item -->
            <div class="column is-6-desktop">
                <div class="card card-lg">
                    <div class="card-body">
                        <article class="tile is-child box">
                            <figure class="image">
                                <img src="${path}/resources/images/book2.jpg">
                            </figure>
                            <p class="card-title h5">독해가 힘이다</p>
                            <a class="button">상세보기</a>
                        </article>
                    </div>
                </div>
            </div>
            <!-- book item -->
            <div class="column is-6-desktop">
                <div class="card card-lg">
                    <div class="card-body">
                        <article class="tile is-child box">
                            <figure class="image">
                                <img src="${path}/resources/images/book3.jpg">
                            </figure>
                            <p class="card-title h5">수학 리더</p>
                            <a class="button">상세보기</a>
                        </article>
                    </div>
                </div>
            </div>
            <!-- book item -->
            <div class="column is-6-desktop">
                <div class="card card-lg">
                    <div class="card-body">
                        <article class="tile is-child box">
                            <figure class="image">
                                <img src="${path}/resources/images/book4.jpg">
                            </figure>
                            <p class="card-title h5">하루 영어</p>
                            <a class="button">상세보기</a>
                        </article>
                    </div>
                </div>
            </div>
            <!-- book item -->
            <div class="column is-6-desktop">
                <div class="card card-lg">
                    <div class="card-body">
                        <article class="tile is-child box">
                            <figure class="image">
                                <img src="${path}/resources/images/book5.jpg">
                            </figure>
                            <p class="card-title h5">체크체크 과학</p>
                            <a class="button">상세보기</a>
                        </article>
                    </div>
                </div>
            </div>
            <!-- book item -->
            <div class="column is-6-desktop">
                <div class="card card-lg">
                    <div class="card-body">
                        <article class="tile is-child box">
                            <figure class="image">
                                <img src="${path}/resources/images/book6.jpg">
                            </figure>
                            <p class="card-title h5">영어 전략</p>
                            <a class="button">상세보기</a>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>