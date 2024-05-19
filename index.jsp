<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2> 스테이지어스 게시판 </h2>

    <form action="./action/loginAction.jsp">
        <input type="text" name="id_value">
        <input type="password" name="pw_value">
        <input type="submit" value="로그인">
    </form>

    <button type="button" onclick="openSearchIdAction_Page()">아이디찾기</button>

    <button type="button" onclick="openSearchPwAction_Page()">비밀번호찾기</button>
    
    <button type="button" onclick="openJoin_Page()">회원가입</button>

    <script>
        function openSearchIdAction_Page()
        {
            location.href="./action/searchIdAction.jsp"
        }
        function openSearchPwAction_Page()
        {
            location.href="./action/searchPwAction.jsp"
        }
        function openJoin_Page()
        {
            location.href="./page/joinPage.jsp"
        }
    </script>

</body>