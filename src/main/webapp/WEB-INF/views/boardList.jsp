<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KBO</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/boardListStyle.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<header>
<div id="container">
    <div id="logo">
        <a href="<c:url value='/'/>">
            <h1>KBO League</h1>
        </a>
    </div>

    <ul id="topMenu">
        <li><a href="<c:url value='/'/>"> 팀 순위 </a></li>
        <li><a href="#">개인 기록 <span>▼</span></a>
            <ul>
                <li><a href="<c:url value='/pitcherRecord'/>">투수</a></li>
                <li><a href="<c:url value='/hitterRecord'/>">타자</a></li>
            </ul>
        </li>
        <li><a href="<c:url value='/board/list'/>">자유게시판</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    </ul>
</div>
</header>
<body>
<script>
    let msg = "${msg}";
    if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");

    if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
    if(msg=="WRT_OK")    alert("성공적으로 등록되었습니다.");
    if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
</script>
<div style="text-align:center">
    <div class="boardList-container">
        <div class="search-container">
            <form action="<c:url value="/board/list"/>" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                    <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
                </select>

                <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                <input type="submit" class="search-button" value="검색">
            </form>
            <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/board/write"/>'"><i class="fa fa-pencil"></i> 글쓰기</button>
        </div>

        <table>
            <tr>
                <th class="no">번호</th>
                <th class="title">제목</th>
                <th class="writer">이름</th>
                <th class="regdate">등록일</th>
                <th class="viewcnt">조회수</th>
            </tr>
            <c:forEach var="boardDto" items="${list}">
                <tr>
                    <td class="no">${boardDto.bno}</td>
                    <td class="title"><a href="<c:url value="/board/read${ph.sc.queryString}&bno=${boardDto.bno}"/>">${boardDto.title} [${boardDto.comment_cnt}]</a></td>
                    <td class="writer">${boardDto.writer}</td>
                    <c:choose>
                        <c:when test="${boardDto.reg_date.time >= startOfToday}">
                            <td class="regdate"><fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm" type="time"/></td>
                        </c:when>
                        <c:otherwise>
                            <td class="regdate"><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
                        </c:otherwise>
                    </c:choose>
                    <td class="viewcnt">${boardDto.view_cnt}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <div class="paging-container">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>
<footer>
    <div id="bottomMenu">
        <ul>
            <li><a href="#">회사 소개</a></li>
            <li><a href="#">개인정보처리방침</a></li>
            <li><a href="#">약관</a></li>
            <li><a href="#">사이트맵</a></li>
        </ul>
        <div id="sns">
            <ul>
                <li><a href="#"><img src="http://localhost/KBO/img/sns-1.png"></a></li>
                <li><a href="#"><img src="http://localhost/KBO/img/sns-2.png"></a></li>
                <li><a href="#"><img src="http://localhost/KBO/img/sns-3.png"></a></li>
            </ul>
        </div>
    </div>
    <div id="company">
        <p>인천광역시 ***동 ***로 *** (대표전화) 123-456-7890</p>
    </div>
</footer>
</body>
</html>