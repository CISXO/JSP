<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="CSS/board.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <title>Board</title>
</head>
<%

Class.forName("org.mariadb.jdbc.Driver");
String jdbcDriver = "jdbc:mariadb://localhost:3306/web";
String dbUser = "root";
String dbPass = "22489612up!";


Connection conn = null;
Statement stmt = null;
ResultSet result = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	String search = request.getParameter("search");
	String query = "SELECT * FROM user,board where user.id = board.userID";
	result = stmt.executeQuery(query);
	
	String user_id = (String) session.getAttribute("user_id");
	int check=0;
%>

<body style="background-color: #edf2f9 !important;">
    <div class="headerColor"></div>
    <div class="boardSection">
        <h1 class="title">FREE STORY</h1>
        <h4 class="titleScript">
            Welcome To Visit!<%=user_id%>!!
        </h4>
        <h4 class="titleScript">
            Share your story with everyone
        </h4>
        <div class="tableSection">
            <div class="tableHeader">
                <h3>자유 게시판</h3>
                <a href="write.jsp" class="writingButton dark">글쓰기</a>
            </div>
            <form id="goView" action="view.jsp" method="get">
            	<input type="hidden" id="indexNum" name="indexNum">
            </form>
            <div class="tableBox">
                <table class="boardTable table table-hover">
                    <thead class="table-primary">
                        <tr>
                            <td>Title</td>
                            <td>Writer</td>
                            <td>Date</td>
                            <td>Views</td>
                        </tr>
                    </thead>
                    <%
                    while(result.next()) { 
                    	check++;
                    	session.setAttribute("check",check);
                    %>
                    <tbody id="tablebody" class="table-light">
                        <tr onclick="trClick(this)">
                            <td><%=result.getString("boardTitle")%></td>
                            <td><%=result.getString("user.name")%></td>
                            <td><%=result.getString("boardDate")%></td>
                            <td><%=result.getString("boardAvailable") %></td>
                        </tr>
                   
                    </tbody>
                    <%} %>
                </table>
            </div>
        </div>
    </div>
<%
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println("err."+e.toString());
}
	%>
	
	<script src="JS/board.js"></script>
</body>

</html>