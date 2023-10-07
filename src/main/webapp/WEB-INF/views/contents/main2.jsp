<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<section class="section pb-0">
    <div class="container">
        <h2 class="section-title">Teaspoon 주요 메뉴</h2>
        <div class="columns is-multiline">
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon fa-solid fa-hands-asl-interpreting mb-5" style="color: #fafafa;"></i>
                        <h3 class="card-title h4">COMMUNITY</h3>
                        <p class="card-text">진로상담, 교재추천 등 회원들과 소통하며 여러 정보를 얻을 수 있습니다.</p>
                        <a href="${path}/community/list.do" class="stretched-link"></a>
                    </div>
                </div>
            </div>
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon fa-solid fa-clipboard-list mb-5" style="color: #fafafa;"></i>
                        <h3 class="card-title h4">FILE BOARD</h3>
                        <p class="card-text">학생과 학부모 모두에게 필요한 학습자료 및 정보를 얻을 수 있습니다.</p>
                        <a href="${path}/fileboard/list.do" class="stretched-link"></a>
                    </div>
                </div>
            </div>
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon fa-regular fa-calendar mb-5" style="color: #fafafa;"></i>
                        <h3 class="card-title h4">EVENT</h3>
                        <p class="card-text">여러가지 이벤트를 통해 경품을 얻을 수 있습니다.</p>
                        <a href="${path }/event/list.do" class="stretched-link"></a>
                    </div>
                </div>
            </div>
            <!-- topic -->
            <div class="column is-3-widescreen is-4-desktop is-6-tablet">
                <div class="card match-height">
                    <div class="card-body">
                        <i class="card-icon fa-solid fa-circle-question md-5" style="color:#fafafa;"></i>
                        <h3 class="card-title h4">FAQ</h3>
                        <p class="card-text">자주 묻는 질문</p>
                        <a href="${path}/faq/list.do" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>