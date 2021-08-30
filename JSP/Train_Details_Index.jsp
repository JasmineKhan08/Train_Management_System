<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Register.css">
</head>
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
String sql ="select * from traindata";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body>
<div class='bold-line'></div>
<div class='container'>
  <div class='window'>
    <div class='overlay'></div>
    <div class='content'>
 <form action="Train_Details_Process.jsp" method = "post">
      <div class='welcome'>Train Management System</div>
      <div class='subtitle'>Enter Your Train number to </div>
      <div class='input-fields'>
Enter your Train number<br><br>
<input type="text" name="TrainNo" class='input-line full-width'  value="<%=resultSet.getString("TrainNo") %>"></input>
<br><br>
<div><button class='ghost-round full-width'>Check Train Details</button></div>
      
      </div>
     
</form>
</div>
</div>
</div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>