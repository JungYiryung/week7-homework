<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
    String id = (String)session.getAttribute("id");
    request.setCharacterEncoding("utf-8");
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/homework","stageus","1234"); 
    String sql="SELECT nickname FROM member WHERE id = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, id);

    ResultSet result = query.executeQuery();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2> 스테이지어스 게시판 </h2>
    <% if(result.next())
        {
    %>
    <h3> <%=result.getString(1)%> 님, 환영합니다! </h3>
    <%
        }
    %>
    <h2> 공지사항 </h2>

    <input type="button" value="글쓰기" onclick="openWirtingpage()">


    <script>
        function openWirtingpage(){
            location.href="./writingPage.jsp";
        }
    </script>
</body>