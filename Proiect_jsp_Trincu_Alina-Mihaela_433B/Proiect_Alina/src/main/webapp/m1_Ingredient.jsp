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
	<h1 align="center">Tabela Ingrediente:</h1>
	<br />
	<p align="center">
		<a href="nou_Ingredient.jsp"><b>Adauga un nou ingredient.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("ingrediente", "idingredient", aux);
	rs.first();
	String Nume = rs.getString("nume");
	String UnitateMasura = rs.getString("unitate_de_masura");
	String Pret = rs.getString("pret");
	String DataExpirare = rs.getString("data_expirare");
	rs.close();
	jb.disconnect();
	%>
	<form action="m2_Ingredient.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IDIngredient:</td>
				<td><input type="text" name="idingredient" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="Nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Unitate Masura:</td>
				<td><input type="text" name="UnitateMasura" size="30"
					value="<%=UnitateMasura%>" /></td>
			</tr>
			<tr>
				<td align="right">Pret:</td>
				<td><input type="text" name="Pret" size="30"
					value="<%=Pret%>" /></td>
			</tr>
			<tr>
				<td align="right">Data expirare:</td>
				<td><input type="text" name="DataExpirare" size="30"
					value="<%=DataExpirare%>" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>