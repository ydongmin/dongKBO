<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <style>
    * { box-sizing:border-box; }
    form {
      width:400px;
      height:700px;
      display : flex;
      flex-direction: column;
      align-items:center;
      position : absolute;
      top:50%;
      left:50%;
      transform: translate(-50%, -50%) ;
      border: 1px solid rgb(89,117,196);
      border-radius: 10px;
    }
    .input-field {
      width: 300px;
      height: 40px;
      border : 1px solid rgb(89,117,196);
      border-radius:5px;
      padding: 0 10px;
      margin-bottom: 10px;
    }

    label {
      width:300px;
      height:30px;
      margin-top :4px;
    }
    button {
      background-color: rgb(89,117,196);
      color : white;
      width:300px;
      height:50px;
      font-size: 17px;
      border : none;
      border-radius: 5px;
      margin : 20px 0 30px 0;
    }
    .id_input {
      width: 300px;
      height: 40px;
      border : 1px solid rgb(89,117,196);
      border-radius:5px;
      padding: 0 10px;
      margin-bottom: 10px;
    }
     /*중복 아이디 존재하지 않는경우*/
    .id_input_re_1 {
      color : green;
      display: none;
    }
    /*중복아이디 존재하는 경우*/
    .id_input_re_2 {
      color: red;
      display: none;
    }

    .title {
      font-size : 50px;
      margin: 40px 0 30px 0;
    }
    .msg {
      height: 30px;
      text-align:center;
      font-size:16px;
      color:red;
      margin-bottom: 20px;
    }

    .sns-chk {
      margin-top : 5px;
    }
  </style>
  <title>Register</title>
</head>
<body>
<form action="<c:url value="/register/add"/>" method="POST" onsubmit="return formCheck(this)">
<form:form modelAttribute="user">
  <div class="title">Register</div>
  <div id="msg" class="msg"><form:errors path="id"/></div>

  <label for="">아이디</label>
  <input class="id_input" type="text" name="id" placeholder="4~12자리의 영어">
  <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
  <span class="id_input_re_2">아이디가 이미 존재합니다.</span>

  <label for="">비밀번호</label>
  <input class="input-field" type="password" name="pwd" placeholder="4~12자리의 영대소문자와 숫자 조합">

  <label for="">이름</label>
  <input class="input-field" type="text" name="name" placeholder="홍길동">

  <label for="">이메일</label>
  <input class="input-field" type="text" name="email" placeholder="example@fastcampus.co.kr">
  <label for="">생일</label>
  <input class="input-field" type="text" name="birth" placeholder="2020-12-31">

  <div class="sns-chk">
  <label><input type="checkbox" name="sns" value="facebook"/>페이스북</label>
  <label><input type="checkbox" name="sns" value="kakaotalk"/>카카오톡</label>
  <label><input type="checkbox" name="sns" value="instagram"/>인스타그램</label>
  </div>

  <label for="">좋아하는 팀</label>
  <select id="" name="favorite_team">
    <option name="favorite_team" value="null" selected>없음</option>
    <option name="favorite_team" value="SSG">SSG</option>
    <option name="favorite_team" value="두산">두산</option>
    <option name="favorite_team" value=키움">키움</option>
    <option name="favorite_team" value="KT">KT</option>
    <option name="favorite_team" value="LG">LG</option>
    <option name="favorite_team" value="한화">한화</option>
    <option name="favorite_team" value="삼성">삼성</option>
    <option name="favorite_team" value="KIA">KIA</option>
    <option name="favorite_team" value="롯데">롯데</option>
    <option name="favorite_team" value="NC">NC</option>
  </select>

  <button>회원 가입</button>
</form:form>
<script>
  function formCheck(frm) {
    var msg ='';
    if(frm.id.value.length<4) {
      setMessage('id의 길이는 4이상이어야 합니다.', frm.id);
      return false;
    }

    if(frm.pwd.value.length<4) {
      setMessage('비밀번호의 길이는 4이상이어야 합니다.', frm.pwd);
      return false;
    }

    if(frm.name.value.length == 0) {
      setMessage('이름을 입력해주세요.', frm.name);
      return false;
    }

    if(frm.email.value.length == 0) {
      setMessage('이메일을 입력해주세요.', frm.email);
      return false;
    }

    if(frm.birth.value.length == 0) {
      setMessage('생일을 입력해주세요.', frm.birth);
      return false;
    }

    return true;
  }

  function setMessage(msg, element){
    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
    if(element) {
      element.select();
    }
  }

  //아이디 중복검사
  $(".id_input").on("propertychange change keyup paste input", function (){
      // console.log("keyup 테스트");
    var id = $('.id_input').val();			// .id_input에 입력되는 값


    $.ajax({
      type : 'POST',
      url : '/KBO/register/memberIdChk',
      data : {id : id},  // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
      success : function (result) {
        // console.log("성공 여부" + result);
        if(result != 'fail'){
          $('.id_input_re_1').css("display","inline-block");
          $('.id_input_re_2').css("display", "none");
        } else {
          $('.id_input_re_2').css("display","inline-block");
          $('.id_input_re_1').css("display", "none");
        }
      }//success 종료
    }); // ajax 종료

  }); // function 종료

</script>
</body>
</html>