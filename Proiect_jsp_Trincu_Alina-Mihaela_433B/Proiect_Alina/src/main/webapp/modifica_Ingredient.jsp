<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Ingrediente</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>

	<p align="center" class="meniu">
	    <a href="index.html"><b>Home</b></a>
		<a href="nou_Ingredient.jsp"><b>Adauga un nou ingredient.</b></a>
	</p>
	<h4 align="center">Tabela Ingrediente:</h4>
	<form action="m1_Ingredient.jsp" method="post">
		<table border="1" align="center">
			<tr class="header">
				<td><b>Mark:</b></td>
				<td><b>IdIngredient:</b></td>
				<td><b>Nume:</b></td>
				<td><b>UM:</b></td>
				<td><b>Pret:</b></td>
				<td><b>Data Expirare:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeTabela("ingrediente");
			long x;
			while (rs.next()) {
				x = rs.getLong("idingredient");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getString("nume")%></td>
				<td><%=rs.getString("unitate_de_masura")%></td>
				<td><%=rs.getString("pret")%></td>
				<td><%=rs.getDate("data_expirare")%></td>
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
</body>
</html>