<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Asociere</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Asociere:</h1>
	<br />
	<p align="center">
		<a href="nou_Asociere.jsp"><b>Adauga o noua asociere
				ingredient reteta.</b></a> <a href="index.html"><b>Home</b></a>
	</p>
	<form action="m1_Asociere.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Id asociere :</b></td>
				<td><b>Id reteta :</b></td>
				<td><b>Nume Reteta:</b></td>
				<td><b>Id Ingredient:</b></td>
				<td><b>Nume Ingredient:</b></td>
				<td><b>Cantitate ingredient:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeAsociere();
			long x;
			while (rs.next()) {
				x = rs.getInt("idlegatura");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getInt("idreteta")%></td>
				<td><%=rs.getString("NumeReteta")%></td>
				<td><%=rs.getInt("idingredient")%></td>
				<td><%=rs.getString("NumeIngredient")%></td>
				<td><%=rs.getInt("CantitateIngredient")%></td>
				<%
				}
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<%
	jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>