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
    <style>
        td, th {
            border:1px solid black;
            padding:10px;
            width:auto;
            text-align: center;
        }
    </style>
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
                <<li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
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
                    <th>선수</th>
                    <th>타율</th>
                    <th>경기수</th>
                    <th>타수</th>
                    <th>안타</th>
                    <th>2루타</th>
                    <th>3루타</th>
                    <th>홈런</th>
                    <th>타점</th>
                    <th>득점</th>
                    <th>도루</th>
                    <th>볼넷</th>
                    <th>삼진</th>
                    <th>출루율</th>
                    <th>장타율</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="h_recordDto" items="${list}">
                <tr>
                    <th>${h_recordDto.hitter_rank}</th>
                    <td>${h_recordDto.player_name} (${h_recordDto.team_name})</td>
                    <td>${h_recordDto.h_avg}</td>
                    <td>${h_recordDto.game_count}</td>
                    <td>${h_recordDto.plate_a}</td>
                    <td>${h_recordDto.hit}</td>
                    <td>${h_recordDto.double_hit}</td>
                    <td>${h_recordDto.triple_hit}</td>
                    <td>${h_recordDto.hr}</td>
                    <td>${h_recordDto.run_batted_in}</td>
                    <td>${h_recordDto.runs}</td>
                    <td>${h_recordDto.steal}</td>
                    <td>${h_recordDto.four_ball}</td>
                    <td>${h_recordDto.strike_out}</td>
                    <td>${h_recordDto.on_base_per}</td>
                    <td>${h_recordDto.slugging_per}</td>
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

<script src="js/slideshow.js"></script>
</body>
</html>