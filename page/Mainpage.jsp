<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
    String id = (String)session.getAttribute("id");
    //이게 된거야?
    //idx 테이블 수정 
    //로그인 페이지 로그인 액션, 사인업 페이지 사인업 액션 메인페이지까지 완성해본다는 생각으로 
    //포스트idx주기 
    //폴더먼저 만들기 
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
    
    <ul>
        <li><a href="./noticePage.jsp"> 공지사항</a></li>
        <li><a href="./QandAPage.jsp"> 묻고답해요</a></li>
        <li><a href="./freeboardPage.jsp"> 자유게시판</a></li>
    </ul>
</body>