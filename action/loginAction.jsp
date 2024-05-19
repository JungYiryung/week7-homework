<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page session="true" %>

<%
    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/homework","stageus","1234"); 
    String sql="SELECT * FROM member WHERE id = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    //query.setString(2, idValue);
    //아이디 비밀번호 둘다 넣어서 수정하기

    ResultSet result = query.executeQuery();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%-- <p>아이디 : <%=idValue%></p> --%>
    <%
        if(result.next())
        {  
            if(result.getString(3).equals(pwValue))

            {
                session.setAttribute("id",idValue);

    %>          
            <script>  
                var id;
                alert("로그인 성공");
                location.href="../page/Mainpage.jsp";
            </script>
    <%
            }
        }
        else
        {
    %>
            <script>
                alert("로그인 실패")
                history.go(-1);
            </script>
    <%
        }
        
    %>

    <%

    %>
    

</body>
