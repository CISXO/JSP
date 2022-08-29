<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
  <%
Class.forName("org.mariadb.jdbc.Driver");
String jdbcDriver = "jdbc:mariadb://localhost:3306/homework";
String dbUser = "root";
String dbPass = "22489612up!";
String query = "select count(*) as head from headquarter";
String query2= "select count(*) as line from line";
String query3= "select count(*) as engineer from engineer";
String query4= "select count(*) as station from station";
String query5= "select count(*) as train from train";
String query6= "select count(*) as traincode from traincode";
String query7= "select count(*) as vehicle from vehicle";
String query8= "select count(*) as connect from connect";

Connection conn = null;
Statement stmt = null;
ResultSet result = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	result = stmt.executeQuery(query);
	result.next();
	String head = result.getString("head");
	int head2 = Integer.parseInt(head);
	result= stmt.executeQuery(query2);
	result.next();
	String line = result.getString("line");
	int line2 = Integer.parseInt(line);
	result= stmt.executeQuery(query3);
	result.next();
	String engineer = result.getString("engineer");
	int engineer2 = Integer.parseInt(engineer);
	result= stmt.executeQuery(query4);
	result.next();
	String station = result.getString("station");
	int station2 = Integer.parseInt(station);
	result= stmt.executeQuery(query5);
	result.next();
	String train = result.getString("train");
	int train2 = Integer.parseInt(train);
	result= stmt.executeQuery(query6);
	result.next();
	String traincode = result.getString("traincode");
	int traincode2 = Integer.parseInt(traincode);
	result= stmt.executeQuery(query7);
	result.next();
	String vehicle = result.getString("vehicle");
	int vehicle2 = Integer.parseInt(vehicle);
	result= stmt.executeQuery(query8);
	result.next();
	String connect = result.getString("connect");
	int connect2 = Integer.parseInt(connect);
	%>
  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['name', 'score'],
          ['headquarter',     <%=head2%>],
          ['line',      <%=line2%>],
          ['engineer',      <%=engineer2%>],
          ['station',      <%=station2%>],
          ['train',      <%=train2%>],
          ['traincode',      <%=traincode2%>],
          ['vehicle',      <%=vehicle2%>],
          ['connect',      <%=connect2%>],
        ]);

        var options = {
          title: 'db ���'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
    </script><%
    	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println("err."+e.toString());
}%>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
     <iframe src="db_status2.jsp" width="100%" height="500" frameborder="1">
       </div>
  <br><h1>h2</h1>
  </body>
</html>