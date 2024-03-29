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
	String query = "SELECT * FROM station";
	result = stmt.executeQuery(query);
	int check=1;
	if(request.getParameter("checkcheck") == null) {
		
	} else {
	check = Integer.parseInt(request.getParameter("checkcheck"));
	}
%>

<body style="background-color: #edf2f9 !important;">
    <div>
        <h1 class="title">station</h1>
        <h4 class="titleScript">
				show your station!!
        </h4>
        <div>
                <table border = "1">
                    <thead>
                        <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Address</td>
                        <td>Tel</td>
                        <td>ManagerName</td>
                        <td>Budget</td>
                        <td>Headquarter_ID</td>
                        </tr>
                    </thead><%
                    while(result.next()) {
                    	if(check==1){
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("Name")%></td>
                            <td><%=result.getString("Address")%></td>
                            <td><%=result.getString("Tel")%></td>
                            <td><%=result.getString("ManagerName")%></td>
                            <td><%=result.getInt("Budget") %></td>
                            <td><%=result.getInt("Headquarter_ID") %></td>
                        </tr>
                   
                    </tbody>
                    <%} else if(check==2) {

                    	String search = request.getParameter("search");
                		String Text = result.getString("ManagerName");
                		if(search.equals(Text)){

                    	%> <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("Name")%></td>
                            <td><%=result.getString("Address")%></td>
                            <td><%=result.getString("Tel")%></td>
                            <td><%=result.getString("ManagerName")%></td>
                            <td><%=result.getInt("Budget") %></td>
                            <td><%=result.getInt("Headquarter_ID") %></td>
                        </tr>
                   
                    </tbody><%
                    }
                    }
                    	} %>
                </table>
        </div>
        
        <form id="station_insert" action ="./manage/station_manage.jsp" method="get">
        <h4>Insert</h4>
        <div class="row">
        <input id="Name" name="Name" type="text" placeHolder="Name">
        </div>
        <div class="row">
        <input id="Address" name="Address" type="text" placeHolder="Address">
        </div>
        <div class="row">
        <input id="Tel" name="Tel" type="text" placeHolder="Tel">
        </div>
        <div class="row">
      <select name="ManagerName">
        <option>Michle</option>
        <option>Jo</option>
        <option>Jk122</option>
        <option>brok</option>
      </select>
        </div>
        <div class="row">
        <input id="Budget" name="Budget" type="text" placeHolder="Budget">
        </div>
        <div class="row">
        <input id="Headquarter_ID" name="Headquarter_ID" type="text" placeHolder="Headquarter_ID">
        </div>
        <div class="station_insert_button">
        <button id="insert_button1" type = "submit" style="background-color: #4c59fd">insert</button>
        </div>
        <input name="manage_num" type="hidden" value="1">
        </form>
          
        <form id="station_update" action="./manage/station_manage.jsp" method="get">
         <h4>Update</h4>
        <p>update할 아이디를 입력하세요!</p>
       <div class="row">
        <input id="station_id" name="stationupdate_id" type="text" placeHolder="id">
        </div>
       <div class="row">
      <select name="select">
        <option>Name</option>
        <option>Address</option>
        <option>Tel</option>
        <option>ManagerName</option>
        <option>Budget</option>
        <option>Headquarter_ID</option>
      </select>
        </div>
       <div class="row">
        <input id="station_id" name="update" type="text" placeHolder="수정값">
        </div>
        <div>
        <button id="update_button1" type = "submit" style="background-color: #4c59fd">update</button>
        </div>
        <input name="manage_num" type="hidden" value="2">
        </form>
        
        <form id="station_delete" action="./manage/station_manage.jsp" method="get">
        <h4>Delete</h4>
        <p>delete할 아이디를 입력하세요!</p>
        <div class="row">
        <input name="stationdelete_id" type="text" placeHolder="id">
        </div>
        <div>
        <button type = "submit" style="background-color: #4c59fd">delete</button>
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