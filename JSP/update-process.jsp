<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ page import="java.sql.*" %>
<%@page import="com.trainProject.DBconnection"%>
<%!Connection con = DBconnection.connectDB();%>
<%
String TrainNo = request.getParameter("TrainNo");
String TrainName=request.getParameter("TrainName");
String FromStation=request.getParameter("FromStation");
String ToStation=request.getParameter("ToStation");
String Availaiblity=request.getParameter("Availaiblity");
if(TrainNo != null)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con= DBconnection.connectDB();
String sql="Update traindata set TrainNo=?,TrainName=?,FromStation=?,ToStation=?,Availaiblity=? where TrainNo="+TrainNo;
ps = con.prepareStatement(sql);
ps.setString(1,TrainNo);
ps.setString(2, TrainName);
ps.setString(3, FromStation);
ps.setString(4, ToStation);
ps.setString(5, Availaiblity);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
</html>