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
    <h2> 글쓰기 </h2>

    <form action="../action/writingAction.jsp">
        <select name="boardName">
            <option value="noice">공지사항</option>
            <option value="QAndA">묻고답해요</option>
            <option value="free">자유게시판</option>
        </select>
        <div>
        <label>작성자</label>
            <input name="writer" value="<%= result.getString(1)%> " readonly>
        </div>
        <div>
        <label>제목</label>
            <textarea name="title" rows="1" cols="100" maxlength="100" placeholder="제목" required></textarea>
        </div>
        <div>
        <label>내용</label>
            <textarea name="post_contents" rows="5" cols="100" placeholder="내용" required></textarea>
        </div>
        <input type="submit" value="등록하기">
        <input type="button" value="목록으로 이동" onclick="openNoticePage()">
    </form>
    <script>
        function openNoticePage()
        {
            location.href="./noticePage.jsp";
        }
    </script>
</body>