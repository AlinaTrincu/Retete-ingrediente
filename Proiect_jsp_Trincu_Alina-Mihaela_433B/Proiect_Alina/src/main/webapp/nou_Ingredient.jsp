<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga ingredient</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	String Nume = request.getParameter("Nume");
	String DataExpirare = request.getParameter("DataExpirare");
	String Pret = request.getParameter("Pret");
	String UnitateMasura = request.getParameter("UnitateMasura");
	
	if (Nume != null) {
		jb.connect();
		jb.adaugaIngredient(Nume, DataExpirare, Pret, UnitateMasura);
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	%>
	<h1>Suntem in tabela Ingredient.</h1>
	<form action="nou_Ingredient.jsp" method="post">
		<table>
			<tr>
				<td align="right">Nume Ingredient:</td>
				<td><input type="text" name="Nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Data Expirare (YYYY-MM-DD):</td>
				<td><input type="text" name="DataExpirare" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Pret:</td>
				<td><input type="text" name="Pret" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Unitate de masura:</td>
				<td><input type="text" name="UnitateMasura" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga ingredient" />
	</form>
	<%
	}
	%>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>