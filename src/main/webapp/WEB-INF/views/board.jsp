<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<%-- 자바빈 액션태그 사용--%>
<jsp:useBean id="commentDto" class="com.dong.KBO.domain.CommentDto" scope="page"/>
<jsp:setProperty name="commentDto" property="*"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>KBO Board</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }

        #board-contents {
            width : 80%;
            margin : auto;
            height: 600px;
        }


        .board-container {
            width : 80%;
            margin : auto;
            height: 700px;
        }

        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }

        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }

        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }

        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }

        .btn:hover {
            text-decoration: underline;
        }

        #commentList {
            width : 80%;
            margin : auto;
            /*height: 1200px;*/
        }
        #commentList > ul {
            border:  1px solid rgb(235,236,239);
            border-bottom : 0;
        }
        #commentList > ul > li {
            background-color: #f9f9fa;
            list-style-type: none;
            border-bottom : 1px solid rgb(235,236,239);
            padding : 18px 18px 0 18px;
        }


        .comment-content {
            overflow-wrap: break-word;
        }

        .comment-bottom {
            font-size:9pt;
            color : rgb(97,97,97);
            padding: 8px 0 8px 0;
        }

        .comment-bottom > a {
            color : rgb(97,97,97);
            text-decoration: none;
            margin : 0 6px 0 0;
        }

        .comment-area {
            padding : 0 0 0 60px;
        }

        .commenter {
            font-size:12pt;
            font-weight:bold;
        }

        .commenter-writebox {
            padding : 15px 20px 20px 20px;
        }

        .comment-img {
            font-size:36px;
            position: absolute;
        }

        .comment-item {
            position:relative;
        }

        .up_date {
            margin : 0 8px 0 0;
        }

        #comment-writebox {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            width: 80%;
            height: 100px;
            margin : auto;
        }

        textarea {
            display: block;
            width: 100%;
            min-height: 17px;
            padding: 0 20px;
            border: 0;
            outline: 0;
            font-size: 13px;
            resize: none;
            box-sizing: border-box;
            background: transparent;
            overflow-wrap: break-word;
            overflow-x: hidden;
            overflow-y: auto;
        }

        #comment-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        .btn {
            font-size:10pt;
            color : black;
            background-color: #eff0f2;
            text-decoration: none;
            padding : 9px 10px 9px 10px;
            border-radius: 5px;
            float : right;
        }

        #btn-write-comment, #btn-write-reply {
            color : #009f47;
            background-color: #e0f8eb;
        }

        #btn-cancel-reply {
            background-color: #eff0f2;
            margin-right : 10px;
        }

        #btn-write-modify {
            color : #009f47;
            background-color: #e0f8eb;
        }

        #btn-cancel-modify {
            margin-right : 10px;
        }

        #reply-writebox {
            display : none;
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            margin : 10px;
        }

        #reply-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        #modify-writebox {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            margin : 10px;
        }

        #modify-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }



        .paging {
            color: black;
            width: 100%;
            text-align: center;
        }

        .page {
            color: black;
            text-decoration: none;
            padding: 6px;
            margin-right: 10px;
        }

        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
            color: rgb(24, 24, 24);
        }

        .paging-container {
            width:100%;
            height: 70px;
            margin-top: 50px;
            /*margin : auto;*/
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
                <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
            </ul>
        </nav>
    </header>
</div>

<div id="board-contents">
    <div class="board-container">
        <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
        <form id="form" class="frm" action="" method="post">
            <input type="hidden" name="bno" value="${boardDto.bno}">

            <input name="title" type="text" value="${boardDto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
            <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${boardDto.content}</textarea><br>

            <c:if test="${mode eq 'new'}">
                <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
            </c:if>
            <c:if test="${mode ne 'new'}">
                <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
            </c:if>
            <c:if test="${boardDto.writer eq loginId}">
                <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
                <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
            </c:if>
            <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
        </form>
    </div>
</div>
<c:if test="${mode ne 'new'}">
<div id="commentList">
    <ul>
        <li class="comment-item" data-cno="${commentDto.cno}" data-bno="${boardDto.bno}">
            <c:if test="${commentDto.cno ne commentDto.pcno}"><c:out value="ㄴ"/></c:if>
                <span class="comment-img">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </span>
            <div class="comment-area">
                <div class="commenter">${commentDto.commenter}</div>
                <div class="comment-content">${commentDto.comment}</div>
                <div class="comment-bottom">
                    <span class="up_date">${commentDto.up_date}</span>
                    <a href="javascript:;" class="btn-write"  data-cno="${commentDto.cno}" data-bno="${commentDto.bno}" data-pcno="${commentDto.pcno}">답글쓰기</a>
                    <a href="javascript:;" class="btn-modify" data-cno="${commentDto.cno}" data-bno="${commentDto.bno}" data-pcno="${commentDto.pcno}">수정</a>
                    <a href="javascript:;" class="btn-delete" data-cno="${commentDto.cno}" data-bno="${commentDto.bno}" data-pcno="${commentDto.pcno}">삭제</a>
                </div>
            </div>
        </li>
    </ul>
</div>
<%--    <div class="paging-container">--%>
<%--        <div class="paging">--%>
<%--            <c:if test="${commentService.getCount(bno) ==null || commentService.getCount(bno) ==0}">--%>
<%--                <div> 게시물이 없습니다. </div>--%>
<%--            </c:if>--%>
<%--            <c:if test="${commentService.getCount(bno)!=null && commentService.getCount(bno)!=0}">--%>
<%--                <c:if test="${ph.showPrev}">--%>
<%--                    <a class="page" href="<c:url value="#"/>">&lt;</a>--%>
<%--                </c:if>--%>
<%--                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">--%>
<%--                    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="#"/>">${i}</a>--%>
<%--                </c:forEach>--%>
<%--                <c:if test="${ph.showNext}">--%>
<%--                    <a class="page" href="<c:url value="#"/>">&gt;</a>--%>
<%--                </c:if>--%>
<%--            </c:if>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="paging-container">
<%--        <div class="paging">--%>
<%--            <a class="page" href="#">&lt;</a>--%>
<%--            <a class="page" href="#">1</a>--%>
<%--            <a class="page" href="#">2</a>--%>
<%--            <a class="page" href="#">3</a>--%>
<%--            <a class="page" href="#">4</a>--%>
<%--            <a class="page paging-active" href="#">5</a>--%>
<%--            <a class="page" href="#">6</a>--%>
<%--            <a class="page" href="#">7</a>--%>
<%--            <a class="page" href="#">8</a>--%>
<%--            <a class="page" href="#">9</a>--%>
<%--            <a class="page" href="#">10</a>--%>
<%--            <a class="page" href="#">&gt;</a>--%>
<%--        </div>--%>
    </div>
<div id="comment-writebox">
    <div class="commenter commenter-writebox">${loginId}</div>
        <div class="comment-writebox-content">
            <textarea name="comment" id="comment" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
        </div>
    <div id="comment-writebox-bottom">
        <div class="register-box">
            <a href="javascript:;" class="btn" data-cno="${commentDto.cno}" data-bno="${boardDto.bno}" id="btn-write-comment">등록</a>
        </div>
    </div>
</div>

    <div id="reply-writebox">
        <div class="commenter commenter-writebox"> ${id} </div>
        <div class="reply-writebox-content">
            <textarea name="replyComment" id="replyComment" cols="30" rows="3" placeholder="댓글을 남겨보세요" autofocus></textarea>
        </div>
        <div id="reply-writebox-bottom">
            <div class="register-box">
                <a href="javascript:;" class="btn" id="btn-cancel-reply">취소</a>
                <a href="javascript:;" class="btn" id="btn-write-reply">등록</a>
            </div>
        </div>
    </div>
</c:if>
<div id="modalWin" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <p>
        <h2> | 댓글 수정</h2>
        <div id="modify-writebox">
            <div class="commenter commenter-writebox"></div>
            <div class="modify-writebox-content">
                <textarea name="modify-comment" id="modify-comment" cols="30" rows="5" placeholder="수정할 댓글을 남겨보세요"></textarea>
            </div>
            <div id="modify-writebox-bottom">
                <div class="register-box">
                    <a href="javascript:;" class="btn" id="btn-write-modify">등록</a>
                </div>
            </div>
        </div>
        </p>
    </div>
</div>
</body>
<script>

    let addZero = function(value=1) {
        return value > 9 ? value : "0"+value;
     }

    let dateToString = function(ms=0) {
        let date = new Date(ms);

        let yyyy = date.getFullYear();
        let mm = addZero(date.getMonth() + 1);
        let dd = addZero(date.getDate());

        let HH = addZero(date.getHours());
        let MM = addZero(date.getMinutes());
        let ss = addZero(date.getSeconds());

        return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;
    }

    let showList = function (bno) {
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/KBO/comments?bno=' +bno,  // 요청 URI
            success : function(result){
                $("#commentList").html(toHtml(result));   // 서버로부터 응답이 도착하면 호출될 함수
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    let toHtml = function (comments) { //html태그가 값을 가져오지 못해서 생성
        let tmp = "<ul>";

        comments.forEach(function (comment) {

            tmp += '<li data-cno='+ comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'
            if(comment.cno != comment.pcno)
                tmp += 'ㄴ'
            tmp += '<span class="comment-img">' + '<i class="fa fa-user-circle" aria-hidden="true">'+'</i>' + '</span>'
            tmp += '<div class="comment-area">'
            tmp += '<div class="commenter">'+ comment.commenter + '</div>'// span 태그를 넣어야 나중에 수정할때 따로 가져오기 편리하다
            tmp += '<div class="comment">' + comment.comment + '</div>'
            tmp += '<div class="comment-bottom">'
            tmp += '<span class="up_date">' + dateToString(comment.up_date) + '</span>'
            tmp += '<a href="javascript:;" class="btn-write" data-cno="' +comment.cno+ '" data-bno="' +comment.bno+ '" data-pcno="' +comment.pcno+ '">답글쓰기</a>'
            tmp += '<a href="javascript:;" class="btn-modify" data-cno="' +comment.cno+ '" data-bno="' +comment.bno+ '" data-pcno="' +comment.pcno+ '">수정</a>'
            tmp += '<a href="javascript:;" class="btn-delete" data-cno="' +comment.cno+ '" data-bno="' +comment.bno+ '" data-pcno="' +comment.pcno+ '">삭제</a>'
            tmp += '</div>' + '</div>'
        })
        return tmp;
        // return tmp + "</ul>";
    }

    $(document).ready(function(){

    let formCheck = function() {
        let form = document.getElementById("form");
        if(form.title.value=="") {
        alert("제목을 입력해 주세요.");
            form.title.focus();
            return false;
        }
        if(form.content.value=="") {
            alert("내용을 입력해 주세요.");
            form.content.focus();
            return false;
        }
        return true;
    }
        $("#writeNewBtn").on("click", function(){
        location.href="<c:url value='/board/write'/>";
    });
        $("#writeBtn").on("click", function(){
        let form = $("#form");
        form.attr("action", "<c:url value='/board/write'/>");
        form.attr("method", "post");
        if(formCheck())
        form.submit();
    });
        $("#modifyBtn").on("click", function(){
        let form = $("#form");
        let isReadonly = $("input[name=title]").attr('readonly');
        // 1. 읽기 상태이면, 수정 상태로 변경
        if(isReadonly=='readonly') {
        $(".writing-header").html("게시판 수정");
        $("input[name=title]").attr('readonly', false);
        $("textarea").attr('readonly', false);
        $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
        return;
    }
        // 2. 수정 상태이면, 수정된 내용을 서버로 전송
        form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
        form.attr("method", "post");
        if(formCheck())
        form.submit();
    });
        $("#removeBtn").on("click", function(){
        if(!confirm("정말로 삭제하시겠습니까?")) return;
        let form = $("#form");
        form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
        form.attr("method", "post");
        form.submit();
    });
        $("#listBtn").on("click", function(){
        location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
    });

        // **********************************************

        showList(${boardDto.bno});

        $("#btn-write-comment").click(function () {
            let comment = $("textarea[name=comment]").val();
            let bno = $(this).attr("data-bno");

            if(comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("textarea[name=comment]").focus()
                return;
            }
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/KBO/comments?bno=' + bno,  // 요청 URI /comments/1?bno=1085
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({bno: bno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        })

        // 대댓글 등록 버튼
        $("#btn-write-reply").click(function () { ////////////////
            let comment = $("textarea[name=replyComment]").val();
            let pcno = $("#reply-writebox").parents("li").attr("data-cno"); // cno의 값을 가져와서 pcno에 저장한다

            if(comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("textarea[name=replyComment]").focus()
                return;
            }
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/KBO/comments?bno=' + bno,  // 요청 URI /comments/1?bno=1085
                headers: {"content-type": "application/json;charset=UTF-8"}, // 요청 헤더
                data: JSON.stringify({pcno:pcno, bno: bno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
            $("#reply-writebox").css("display", "none")
            $("textarea[name=replyComment]").val('');
            $("#reply-writebox").appendTo("body");
        });


        $("#commentList").on("click", ".btn-modify", function () {
            let cno = $(this).attr("data-cno");
            let bno = $(this).attr("data-bno");
            // let comment =  $(this).text();
            let comment = $(this).parents("textarea[name=comment]").text();

            $("#modify-writebox").appendTo($(this).parent());
            // 1. comment의 내용을 input에 뿌려주기
            $("textarea[name=modify-comment]").val(comment);
            // 2. cno전달하기
            $("#btn-write-modify").attr("data-cno", cno); // 맨위에있는 수정버튼
        });

        $("#commentList").on("click", ".btn-write", function () {
            // 1. replyForm을 옮기고
            $("#reply-writebox").appendTo($(this).parent());
            //2. 답글을 입력할 폼을 보여주고,
            $("#reply-writebox").css("display", "block");
        }); ///////////////////////


        $("#commentList").on("click", ".btn-delete", function () {
            let cno = $(this).attr("data-cno"); //cno가 li에 들어있는데 이 버튼의 부모다
            let bno = $(this).attr("data-bno");

            $.ajax({
                type: 'DELETE',       // 요청 메서드
                url: '/KBO/comments/' + cno + '?bno=' + bno,  // 요청 URI
                headers: {"content-type": "application/json;charset=UTF-8"}, // 요청 헤더
                // dataType : 'json', // 전송받을 데이터의 타입 // 생략하면 기본 타입이 json이라 생략가능
                // data : JSON.stringify(person),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert(result)
                    showList(bno);
                },
                error: function () {
                    alert("삭제 오류입니다.")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()                           // 동적으로 생성되는 요소에 이벤트를 거는 방법
        });

        $("a.btn-write").click(function(e){
            e.preventDefault();
            let target = e.target;
            let cno = target.getAttribute("data-cno")
            let bno = target.getAttribute("data-bno")

            let repForm = $("#reply-writebox");
            repForm.appendTo($("li[data-cno="+cno+"]"));
            repForm.css("display", "block");
            repForm.attr("data-pcno", pcno);
            repForm.attr("data-bno",  bno);
            repForm.write(e);

        });

        $("#reply-writebox").css("display", "none")
        $("#reply-writebox").appendTo("body");

        $("#btn-cancel-reply").click(function(e){
            $("#reply-writebox").css("display", "none");
        });

        $("a.btn-modify").click(function(e){
            let target = e.target;
            let cno = target.getAttribute("data-cno");
            let bno = target.getAttribute("data-bno");
            let pcno = target.getAttribute("data-pcno");
            let li = $("li[data-cno="+cno+"]");
            let commenter = $(".commenter", li).first().text();
            let comment = $(".comment-content", li).first().text();

            $("#modalWin .commenter").text(commenter);
            $("#modalWin textarea").text(comment);
            $("#btn-write-modify").attr("data-cno", cno);
            $("#btn-write-modify").attr("data-pcno", pcno);
            $("#btn-write-modify").attr("data-bno", bno);

            // 팝업창을 열고 내용을 보여준다.
            $("#modalWin").css("display","block");
        });



        $("#btn-write-modify").click(function(){
            // 1. 변경된 내용을 서버로 전송
            let cno = $(this).attr("data-cno");
            let comment = $("textarea[name=modify-comment]").val();

            if(comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("textarea[name=modify-comment]").focus()
                return;
            }
            $.ajax({
                type: 'PATCH',       // /KBO/comments/26  PATCH
                url: '/KBO/comments/'+cno,  // 요청 URI /comments/1?bno=1085
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({cno: cno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("수정오류입니다.")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
            // 2. 모달 창을 닫는다.
            $(".close").trigger("click");
        });

        $(".close").click(function(){
            $("#modalWin").css("display","none");
        });

    });

</script>
</body>
</html>