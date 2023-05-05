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
    <link rel="stylesheet" href="<c:url value='/css/boardStyle.css'/>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>KBO Board</title>
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
    <div class="paging-container">
<%--        <div class="paging">--%>
<%--            <c:if test="${==null || requestScope.totalCnt==0}">--%>
<%--                <div> 게시물이 없습니다. </div>--%>
<%--            </c:if>--%>
<%--            <c:if test="${totalCnt!=null && totalCnt!=0}">--%>
<%--                <c:if test="${ph.showPrev}">--%>
<%--                    <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>--%>
<%--                </c:if>--%>
<%--                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">--%>
<%--                    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a>--%>
<%--                </c:forEach>--%>
<%--                <c:if test="${ph.showNext}">--%>
<%--                    <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>--%>
<%--                </c:if>--%>
<%--            </c:if>--%>
<%--        </div>--%>
    </div>
<%--    <div class="paging-container">--%>
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
<%--    </div>--%>
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