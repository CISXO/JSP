<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<style>

body {
    font-family: 'Noto Sans KR', sans-serif;
    display: flex;
    justify-content: center;
    height: 95vh;
}

</style>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head><%

Class.forName("org.mariadb.jdbc.Driver");
String jdbcDriver = "jdbc:mariadb://localhost:3306/homework";
String dbUser = "root";
String dbPass = "22489612up!";


Connection conn = null;
Statement stmt = null;
ResultSet result = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	String query = "SELECT * FROM connect";
	result = stmt.executeQuery(query);

%>

<body style="background-color: #edf2f9 !important;">
    <div>
        <h1 class="title">connect</h1>
        <h4 class="titleScript">
				show your Connect
        </h4>
        <div>
                <table border = "1">
                    <thead>
                        <tr>
                        <td>Station_ID</td>
                        <td>Line_ID</td>
                        </tr>
                    </thead>
                    <%
                    while(result.next()) {
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("Station_ID")%></td>
                            <td><%=result.getString("Line_ID")%></td>
                        </tr>
                   
                    </tbody>
                    <%} %>
                </table>
        </div>
        <form id="connect_insert" action ="./manage/connect_manage.jsp" method="get">
        <h4>Insert</h4>
        <div class="row">
        <input id="Station_ID" name="Station_ID" type="text" placeHolder="Station_ID">
        </div>
        <div class="row">
        <input id="Line_ID" name="Line_ID" type="text" placeHolder="Line_ID">
        </div>
        <div class="connect_insert_button">
        <button id="insert_button1" type = "submit" style="background-color: #4c59fd">insert</button>
        </div>
        <input name="manage_num" type="hidden" value="1">
        </form>
        
        
        <form id="connect_delete" action="./manage/connect_manage.jsp" method="get">
        <h4>Delete</h4>
        <p>delete할 아이디를 입력하세요!</p>
        <div class="row">
        <input id="connect_id" name="connectdelete_id" type="text" placeHolder="Station_ID">
        </div>
        <div class="row">
        <input id="connect_id" name="connectdelete_id2" type="text" placeHolder="Line_ID">
        </div>
        <div>
        <button id="delete_button1" type = "submit" style="background-color: #4c59fd">delete</button>
        </div>
        <input name="manage_num" type="hidden" value="3">
        </form>
        
        
        <form action="../Sys_admin.jsp" method="get">
        <h4>목록으로 이동하기!</h4>
        <div>
        <button>목록</button>
        </div>
        <br><br><br><br><br><br><br><br>
        </form>
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