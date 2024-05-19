<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");
    String pwValueCheck = request.getParameter("pwValueCheck");
    String nickname = request.getParameter("nicknameValue");
    String realname = request.getParameter("nameValue");
    String birth = request.getParameter("birthValue");


    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/homework","stageus","1234");
    String sql="INSERT INTO member(id, password, nickname, name, birth) VALUES(?,?,?,?,?);";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);
    query.setString(3, nickname);
    query.setString(4, realname);
    query.setString(5, birth);

    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        <%-- console.log("<%=idValue%>") --%>
        alert("회원가입에 성공하였습니다.")
        location.href="../index.jsp"
        if()
    </script>

</body>
