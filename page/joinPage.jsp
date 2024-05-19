<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <h2> 회원가입 </h2>
    <form action="../action/joinAction.jsp">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" maxlength="10" id="idValue" name="idValue"></td>
                <td><input type="button" value="중복체크" onclick="checkId()"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" maxlength="10" id="pwValue" name="pwValue"></td>
            </tr>
            <tr>
                <td>비밀번호확인</td>
                <td><input type="password" maxlength="10" id="pwValueCheck" name="pwValueCheck"></td>
                <td><div id="pwCheck hide"></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" maxlength="10" id="nicknameValue" name="nicknameValue"></td>
                <td><input type="button" value="중복체크" onclick="checkNickname()"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input tyoe="text" maxlength="5" name="nameValue"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="date" name="birthValue"></td>
            </tr>
        </table>
        <input type="submit" value="가입하기">
    </form>

    <script>
        var sendIdValue;
        var sendNicknameValue;
        var checkIdRule = /^[A-Za-z]{4,20}$/;
        var chechPwRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,20}$/
        var checkNickRule= /^[가-힣]{1,20}$/
        var checkNameRule=/^[가-힣]{2,4}$/

        function checkId()
        {
            var idValue = document.getElementById("idValue").value;

            if(!(checkIdRule.test(idValue)))
            {
                alert("아이디는 영대소문자 4자리에서 20자리 사이입니다.");
            }
            else{
                window.open("./duplicateCheckIdPage.jsp?sendIdValue=" + idValue,
                "아이디중복체크","width=400, height=300, top=50, left=50");
            }
        }
        function checkNickname()
        {
            var nicknameValue =document.getElementById("nicknameValue").value;

            if(!(checkNameRule.test(nicknameValue)))
            {
                alert("닉네임은 한글로 1자리에서 20자리 사이입니다.");
            }
            else{
                window.open("./duplicateCheckNicknamePage.jsp?sendNicknameValue="+nicknameValue,
                "닉네임중복체크", "width=400, height=300, top=50, left=50")
            }
        }



    
     
        
    </script>
</body>