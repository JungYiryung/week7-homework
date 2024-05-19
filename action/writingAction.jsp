<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%

    request.setCharacterEncoding("utf-8");
    String boardName = request.getParameter("boardName");
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String postContents = request.getParameter("post_contents");

    if(boardName== "notice")
    {
        boardName = 1;
    }
    else if(boardName == "QAndA")
    {
        boardName = 2;
    }
    else
    {
        boardName = 3;
    }

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web","stageus","1234");
    String sql="INSERT INTO post(, pw) VALUES(?,?);";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);
    //sql은 문자열/ sql을 통신가능한 상태로 만든게 query

    //query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>
        console.log("<%=boardName%>")

    </script>

</body>
