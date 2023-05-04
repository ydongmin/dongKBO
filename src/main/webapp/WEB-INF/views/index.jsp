<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KBO</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
<div id="container">
    <header>
        <div id="logo">
            <a href="<c:url value='/'/>">
                <h1>KBO League</h1>
            </a>
        </div>
        <nav>
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
        </nav>
    </header>
    <div id="contents">
        <div id="teamRank">
            <table>
                <caption></caption>
                <col class="heading">
                <col>
                <col>
                <thead>
                <tr class="heading">
                    <th>순위</th>
                    <th>팀 이름</th>
                    <th>게임 수</th>
                    <th>승</th>
                    <th>패배</th>
                    <th>무승부</th>
                    <th>승률</th>
                    <th>게임차</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="teamRankDto" varStatus="status" items="${list}">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${teamRankDto.team_name}</td>
                    <td>${teamRankDto.game_count}</td>
                    <td>${teamRankDto.win_count}</td>
                    <td>${teamRankDto.defeat_count}</td>
                    <td>${teamRankDto.draw_count}</td>
                    <td>${teamRankDto.winning_rate}</td>
                    <td>${teamRankDto.game_difference}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
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
                    <li><a href="#"><img src="img/sns-1.png"></a></li>
                    <li><a href="#"><img src="img/sns-2.png"></a></li>
                    <li><a href="#"><img src="img/sns-3.png"></a></li>
                </ul>
            </div>
        </div>
        <div id="company">
            <p>인천광역시 ***동 ***로 *** (대표전화) 123-456-7890</p>
        </div>
    </footer>
</div>
</body>
</html>