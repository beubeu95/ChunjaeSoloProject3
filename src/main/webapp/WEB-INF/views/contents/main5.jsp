<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<section class="page" id="page3">
    <div class="board_lst" style="background-color: lightgray; margin-top:24px;">
        <div class="board_wrap" style="display: inline-block; height: 400px;">
            <div class="board">
                <div class="board_title">
                    <h2 class="notice_title">이벤트</h2>
                    <a href="${path}/event/list.do" class="notice_more" >더보기 + </a>
                </div>
                <ul class="lst">
                    <c:forEach items="${eventList }" var="event" >
                    <li class="lst_group">
                        <c:if test='${event.status eq "1"}'>
                            <a href="${path}/event/detail.do?eno=${event.eno }" class="board_subject" style="color: #000000; text-decoration: none;">${event.title }</a>
                        </c:if>
                        <div class="board_date">
                            <fmt:parseDate value="${event.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="board" style="width: 450px; padding-right: 60px;">
                <div class="board_title">
                    <h2 class="events_title"> 공지사항 </h2>
                    <a href="${path}/notice/list.do" class="notice_more">더보기 + </a>
                </div>
                <ul class="lst">
                    <c:forEach items="${noticeList }" var="notice" >
                    <li class="lst_group">
                        <a href="${path}/notice/detail.do?seq=${notice.seq }" class="event_subject" style="color: #000000; text-decoration: none;">${notice.title }</a>
                        <div class="board_date">
                            <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</section>