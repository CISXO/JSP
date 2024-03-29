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
	String query = "SELECT * FROM Engineer";
	result = stmt.executeQuery(query);

%>

<body style="background-color: #edf2f9 !important;">
    <div>
        <h1>Engineer</h1>
        <h4>
				show your Engineer!!
        </h4>
        <div>
                <table border = "1">
                    <thead>
                        <tr>
                        <td>ID</td>
                        <td>year</td>
                        <td>variety</td>
                        <td>amount</td>
                        <td>Headquarter_ID</td>
                        </tr>
                    </thead>
                    <%
                    while(result.next()) {
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("year")%></td>
                            <td><%=result.getString("variety")%></td>
                            <td><%=result.getString("amount")%></td>
                            <td><%=result.getString("Headquarter_ID")%></td>
                        </tr>
                   
                    </tbody>
                    <%} %>
                </table>
        </div>
        <form id="Engineer_insert" action ="./manage/Engineer_manage.jsp" method="get">
        <h4>Insert</h4>
        <div class="row">
        <input id="id" name="enginID" type="text" placeHolder="id">
        </div>
        <div class="row">
        <input id="year" name="year" type="text" placeHolder="year">
        </div>
        <div class="row">
        <input id="variety" name="variety" type="text" placeHolder="variety">
        </div>
        <div class="row">
        <input id="amount" name="amount" type="text" placeHolder="amount">
        </div>
        <div class="row">
        <input id="Headquarter_ID" name="Headquarter_ID" type="text" placeHolder="Headquarter_ID">
        </div>
        <div class="hd_insert_button">
        <button id="insert_button1" type = "submit" style="background-color: #4c59fd">insert</button>
        </div>
        <input name="manage_num" type="hidden" value="1">
        </form>
        
       
        <form id="Engineer_update" action="./manage/Engineer_manage.jsp" method="get">
         <h4>Update</h4>
        <p>update할 아이디를 입력하세요!</p>
       <div class="row">
        <input id="Engineer_id" name="Engineerupdate_id" type="text" placeHolder="id">
        </div>
       <div class="row">
      <select name="select">
        <option>year</option>
        <option>variety</option>
        <option>amount</option>
        <option>Headquarter_ID</option>
      </select>
        </div>
       <div class="row">
        <input id="Engineer_id" name="update" type="text" placeHolder="수정값">
        </div>
        <div>
        <button id="update_button1" type = "submit" style="background-color: #4c59fd">update</button>
        </div>
        <input name="manage_num" type="hidden" value="2">
        </form>
        
        <form id="Engineer_delete" action="./manage/Engineer_manage.jsp" method="get">
        <h4>Delete</h4>
        <p>delete할 아이디를 입력하세요!</p>
        <div class="row">
        <input id="Engineer_id" name="Engineerdelete_id" type="text" placeHolder="id">
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