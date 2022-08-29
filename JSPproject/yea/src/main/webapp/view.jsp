<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="CSS/view.css">

    <title>Story View</title>
</head>

<body><%

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
	String query = "SELECT * FROM board ";
	result = stmt.executeQuery(query);
	int check = Integer.parseInt(request.getParameter("indexNum"));
%>

    <div class="viewSection">
        <div class="titleBox">
            <h1 class="pageTitle">Someone's Story
                <a href="board.jsp" class="linkButton">목록으로</a>
            </h1>
        </div>
        <%
	while(result.next()) {
		if(check == result.getInt("boardID")){
		String update_Available = "UPDATE board SET boardAvailable = boardAvailable + 1 WHERE BoardID = '"+ check +"'";
				//UPDATE board SET boardAvailable = boardavailable+1 WHERE BoardID=check

		stmt.executeUpdate(update_Available);
	%>
        <div class="pageBody">
            <div class="setLine">story</div>
            <div class="setBox">
                <div class="storyHeader">
                    <div class="header">
                        <span class="user"><%=result.getString("userID")%></span>
                        <div class="date"><%=result.getString("boardDate")%></div>
                    </div>
                </div>
                <div class="storyBody">
                    <h2 class="storyTitle"><%=result.getString("boardTitle")%></h2>
                    <div class="story">
                    <%=result.getString("boardContent")%>
                    </div>
                </div>
            </div>
        </div>
        <% }
	} %>
    </div>
    <%
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println("err."+e.toString());
}
	%>
</body>

</html>