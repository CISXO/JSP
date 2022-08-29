<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
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
	String query = "SELECT * FROM operation";
	result = stmt.executeQuery(query);
	String user_name = (String) session.getAttribute("user_name");
	String Engineer_ID = (String) session.getAttribute("Engineer_ID");
	int Engin = Integer.parseInt(Engineer_ID);

	String query2 = "select A.DeptStatus, A.ArvStatus , B.StartStation, B.StartTime, B.EndStation, B.EndTime, C.Type, C.Conditions from (select * from operation where Engineer_ID="+ Engin +") as A, Traincode B, train C where A.Traincode_ID=B.ID AND A.Train_ID = C.ID;";

%>

<body style="background-color: #edf2f9 !important;">
    <div><p>operation 자신과 관련된 데이터만 관리함. 섹션에서 유저 아이디 받아와서 자신 데이터만 관리 
      운행 기록 생성 업데이트 삭제 + 모든 운행 한눈에 보기 기능(바로 그냥 띄어줌 )</p>
        <h1 class="title"><%=user_name%> 기관사님 반갑습니다.</h1><p>기관사님의 코드번호는 <%=Engineer_ID%>입니다.</p>
        <h4 class="titleScript">
				운행관리
        </h4>
        <div style="float:left;">
                <table border = "1" >
                    <thead class="table-primary" >
                        <tr>
                        <td>ID</td>
                        <td>DeptStatus</td>
                        <td>ArvStatus</td>
                        <td>UpdateTime</td>
                        <td>Engineer_ID</td>
                        <td>TrainCode_ID</td>
                        <td>Train_ID</td>
                        </tr>
                    </thead>
                    <%
                    while(result.next()) {
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("DeptStatus")%></td>
                            <td><%=result.getString("ArvStatus")%></td>
                            <td><%=result.getString("UpdateTime")%></td>
                            <td><%=result.getString("Engineer_ID")%></td>
                            <td><%=result.getInt("TrainCode_ID") %></td>
                            <td><%=result.getInt("Train_ID") %></td>
                        </tr>
                   
                    </tbody>
                    <%} query = "SELECT * FROM Traincode";
					result = stmt.executeQuery(query);
					%>
                <table border = "1">
                <h2> TrainCode table</h2>
                    <thead>
                        <tr>
                        <td>ID</td>
                        <td>Code</td>
                        <td>Day</td>
                        <td>StartStation</td>
                        <td>StartTime</td>
                        <td>EndStation</td>
                        <td>EndTime</td>
                        <td>Line_ID</td>
                        </tr>
                    </thead><%
                    while(result.next()) {
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("Code")%></td>
                            <td><%=result.getString("Day")%></td>
                            <td><%=result.getString("StartStation")%></td>
                            <td><%=result.getString("StartTime")%></td>
                            <td><%=result.getString("EndStation")%></td>
                            <td><%=result.getString("EndTime")%></td>
                            <td><%=result.getInt("Line_ID")%></td>
                        </tr>
                   
                    </tbody>
                    <%}
                    query = "SELECT * FROM Train";
					result = stmt.executeQuery(query);
					%>
                <table border = "1">
                <h2> Train table</h2>
                    <thead>
                        <tr>
                        <td>ID</td>
                        <td>Type</td>
                        <td>Conditions</td>
                        </tr>
                    </thead><%
                    while(result.next()) {
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("Type")%></td>
                            <td><%=result.getString("Conditions")%></td>
                        </tr>
                    </tbody>
                    <%} 
					result = stmt.executeQuery(query2);
					%>
                <table border = "1">
                <h2><%=user_name%>기관사님 운행 정보입니다.</h2>
                    <thead>
                        <tr>
                        <td>DeptStatus</td>
                        <td>ArvStatus</td>
                        <td>StartStation</td>
                        <td>StartTime</td>
                        <td>EndStation</td>
                        <td>EndTime</td>
                        <td>Type</td>
                        <td>Conditions</td>
                        </tr>
                    </thead><%
                    while(result.next()) {
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getString("A.DeptStatus")%></td>
                            <td><%=result.getString("A.ArvStatus")%></td>
                            <td><%=result.getString("B.StartStation")%></td>
                            <td><%=result.getString("B.StartTime")%></td>
                            <td><%=result.getString("B.EndStation")%></td>
                            <td><%=result.getString("B.EndTime")%></td>
                            <td><%=result.getString("C.Type")%></td>
                            <td><%=result.getString("C.Conditions")%></td>
                        </tr>
                    </tbody><%} 
                    
					%>
                </table>
        </div>
        <form action ="master_engineer_manage.jsp" method="get" style="width:300px; float:left;">
        <h4>Insert</h4>
        <div class="row">
      <select name="DeptStatus">
        <option>준비중</option>
        <option>정시출발</option>
        <option>지연출발</option>
      </select>
        </div>
        <div class="row">
      <select name="ArvStatus">
        <option>출발전</option>
        <option>운행중</option>
        <option>정시도착</option>
        <option>지연도착</option>
      </select>
        </div>
        <div class="row">
        <input name="UpdateTime" type="text" placeHolder="UpdateTime">
        </div>
        <div class="row">
        <input name="Engineer_ID" type="hidden" value="<%=Engineer_ID%>">
        </div>
        <div class="row">
        <input name="TrainCode_ID" type="text" placeHolder="TrainCode_ID">
        </div>
        <div class="row">
        <input name="Train_ID" type="text" placeHolder="Train_ID">
        </div>
        <div>
        <button id="insert_button1" type = "submit" style="background-color: #4c59fd">insert</button>
        </div>
        <input name="manage_num" type="hidden" value="1">
        </form>
        
        
          
        <form action="master_engineer_manage.jsp" method="get"style="width:300px; float:left;">
         <h4>Update</h4>
        <p>update할 아이디를 입력하세요!</p>
       <div class="row">
        <input name="masterupdate_id" type="text" placeHolder="id">
        </div>
       <div class="row">
      <select name="select">
        <option>DeptStatus</option>
        <option>ArvStatus</option>
        <option>UpdateTime</option>
        <option>Engineer_ID</option>
        <option>TrainCode_ID	</option>
        <option>Train_ID</option>
      </select>
        </div>
       <div class="row">
        <input name="update" type="text" placeHolder="수정값">
        </div>
        <div>
        <button type = "submit" style="background-color: #4c59fd">update</button>
        </div>
        <input name="manage_num" type="hidden" value="2">
        </form>
        
        <form action="master_engineer_manage.jsp" method="get" style="width:300px; float:left;">
        <h4>Delete</h4>
        <p>delete할 아이디를 입력하세요!</p>
        <div class="row">
        <input name="masterdelete_id" type="text" placeHolder="id">
        </div>
        <div>
        <button type = "submit" style="background-color: #4c59fd">delete</button>
        </div>
        <input name="manage_num" type="hidden" value="3">
        </form>
        
        
     <iframe src="operation_status.jsp" width="100%" height="500" frameborder="1"></frame>
  
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
</body>
</html>