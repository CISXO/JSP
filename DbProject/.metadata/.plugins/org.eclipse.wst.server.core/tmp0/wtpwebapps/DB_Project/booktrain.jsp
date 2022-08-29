<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>

tbody td:hover {
    cursor: pointer;
}
</style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<body style="width:90%;">


<h1> Welcome train!</h1>
<p> 운항중인 열차편에 대한 예약 기능 </p>
<%
Class.forName("org.mariadb.jdbc.Driver");
String jdbcDriver = "jdbc:mariadb://localhost:3306/homework";
String dbUser = "root";
String dbPass = "22489612up!";
String query = " select * from operation,TrainCode where operation.TrainCode_ID=TrainCode.ID order by operation.id;";

Connection conn = null;
Statement stmt = null;
ResultSet result = null;


try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	result = stmt.executeQuery(query);
	int check = Integer.parseInt(request.getParameter("indexNum"));
%>  <table class="boardTable table table-hover" border = "1">
                    <thead class="table-primary">
                        <tr>
                        <td>ID</td>
                        <td>DeptStatus</td>
                        <td>ArvStatus</td>
                        <td>Day</td>
                        <td>StartStation</td>
                        <td>StartTime</td>
                        <td>EndStation</td>
                        <td>EndTime</td>
                        </tr>
                    </thead>
                    <%
                    while(result.next()) {
                		if(check == result.getInt("ID")){
                    %>
                    <tbody id="tablebody" class="table-light">
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("DeptStatus")%></td>
                            <td><%=result.getString("ArvStatus")%></td>
                            <td><%=result.getString("Day")%></td>
                            <td><%=result.getString("StartStation")%></td>
                            <td><%=result.getString("StartTime") %></td>
                            <td><%=result.getString("EndStation") %></td>
                            <td><%=result.getString("EndTime") %></td>
                        </tr>
                   
                    </tbody>
                    <%}} %>
                </table>
                <form method="get" action="Login.jsp">
     		 <p>정말 예약하시겠습니까??</p>
     		 <label><input type="radio" name="aaaa" value="1"> yes</label>
     		 <label><input type="radio" name="aaaa" value="0"> No</label>
     		 <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
   			 </form>
                
                
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