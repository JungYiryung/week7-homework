<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("sendIdValue");
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/homework","stageus","1234");
    String sql = "SELECT * FROM member WHERE id = ?;";
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

    <h2> 아이디중복체크 </h2>

    <% 
    
        if(result.next())
        {
    %>
            <div> 아이디 : <%=id%> 은 이미 있는 아이디입니다. </div>
            <script>
                window.opener.document.getElementById("idValue").value = "";
            </script>
    <%
        }
        else
        {
    %>
        <div> 아이디 : <%=id%> 사용가능합니다! </div>        
    <%
        }
    %>
    <input type="button" value="확인" onclick="window.close()">
   
</body>