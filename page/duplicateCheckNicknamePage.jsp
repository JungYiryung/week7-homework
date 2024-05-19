<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
    request.setCharacterEncoding("utf-8");
    String nickname = request.getParameter("sendNicknameValue");
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/homework","stageus","1234");
    String sql = "SELECT * FROM member WHERE nickname = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, nickname);
    ResultSet result = query.executeQuery();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <h2> 닉네임중복체크 </h2>

    <% 
    
        if(result.next())
        {
    %>
            <div> 닉네임 : <%=nickname%> 은 이미 있는 닉네임입니다. </div>
            <script>
                window.opener.document.getElementById("nicknameValue").value = "";
            </script>
    <%
        }
        else
        {
    %>
        <div> 닉네임 : <%=nickname%> 사용가능합니다! </div>        
    <%
        }
    %>
    <input type="button" value="확인" onclick="window.close()">
   
</body>