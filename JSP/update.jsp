<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.trainProject.DBconnection"%>
<%
String TrainNo = request.getParameter("TrainNo");
Connection con = DBconnection.connectDB();
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DBconnection.connectDB();
statement=connection.createStatement();
String sql ="select * from traindata where TrainNo="+TrainNo;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body>
<h1>Update Your Train Details</h1>
<form method="post" action="update-process.jsp">
<input type="hidden" name="TrainNo" value="<%=resultSet.getString("TrainNo") %>">
<input type="text" name="TrainNo" value="<%=resultSet.getString("TrainNo") %>">
<br>
Train Name:<br>
<input type="text" name="TrainName" value="<%=resultSet.getString("TrainName") %>">
<br>
From Station:<br>
<input type="text" name="FromStation" value="<%=resultSet.getString("FromStation") %>">
<br>
To Station:<br>
<input type="text" name="ToStation" value="<%=resultSet.getString("ToStation") %>">
<br>
Seat Availablity:<br>
<input type="text" name="Availaiblity" value="<%=resultSet.getString("Availaiblity") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>