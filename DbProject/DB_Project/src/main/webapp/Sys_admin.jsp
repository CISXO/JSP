<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.loginButtonL{
float:left;
}

.loginButtonR{
float:left;

}
#loginButton{
width: 360px;
    height: 50px;
    margin: 0px 10px;
    color: #fff;
    background: #166caa;
    border: none;
    border-radius: 20px;
    font-size: 20px;
    cursor: pointer;
    margin-top:20px;
}


</style>
</head>
<body>
<%
String user_name = (String) session.getAttribute("user_name");

%>
<h1>HELLOW <%=user_name%> SYSTEM ADMIN!</h1>
<form id="station_update" action="DB/Headquarter.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">Headquater</button>
            </div>
            </form>
            <form id="station_update" action="DB/Engineer.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">Engineer</button>
            </div>
            </form>
            <form id="station_update" action="DB/line.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">line</button>
            </div>
            </form>
            <form id="station_update" action="DB/station.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">station</button>
            </div>
            </form>
            <form id="station_update" action="DB/train.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">train</button>
            </div>
            </form>
            <form id="station_update" action="DB/traincode.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">traincode</button>
            </div>
            </form>
            <form id="station_update" action="DB/vehicle.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">vehicle</button>
            </div>
            </form>
            <form id="station_update" action="DB/connect.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">connect</button>
            </div>
            </form>
            <form id="station_update" action="db_stats.jsp" method="get">
            <div class="loginButtonL">
                    <input name="checkcheck" type="hidden" value="1">
                    <button id="loginButton" type="submit">통계보기!!</button>
            </div>
            </form>
            <div class="loginButtonR">
                <a href="DB/Search.jsp"><button id="loginButton" type="button">검색하기!!</button></a>
            </div>
            
</body>
</html>