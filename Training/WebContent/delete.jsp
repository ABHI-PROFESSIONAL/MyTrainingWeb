<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Databse.dbconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <% String id =  request.getParameter("id"); 

dbconnect method  = new dbconnect();
Connection con = method.getDbConnection();
PreparedStatement stmt=con.prepareStatement("delete from training where training_id = ?");
stmt.setInt(1, Integer.parseInt(id));


try{
int row = stmt.executeUpdate();
/* out.print("the training with id "+id+"has been deleted.<br>");
out.print(row); */
response.sendRedirect("connect.jsp");
}catch(Exception ex){
	out.print(ex);
}
  %>
  

</script>
</body>
</html>