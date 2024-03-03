<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga reteta</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	String Nume = request.getParameter("Nume");
	String NumarPortii = request.getParameter("NumarPortii");
	String Dificultate = request.getParameter("Dificultate");
	String TimpDePreparare = request.getParameter("TimpDePreparare");
	
	if (Nume != null) {
		jb.connect();
		jb.adaugaReteta(Nume, NumarPortii, Dificultate, TimpDePreparare);
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	%>
	<h1>Suntem in tabela Retete.</h1>
	<form action="nou_Reteta.jsp" method="post">
		<table>
			<tr>
				<td align="right">Nume Reteta:</td>
				<td><input type="text" name="Nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Numar portii:</td>
				<td><input type="text" name="NumarPortii" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Dificultate:</td>
				<td><input type="text" name="Dificultate" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Timp de preparare:</td>
				<td><input type="text" name="TimpDePreparare" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga reteta" />
	</form>
	<%
	}
	%>
	<br />
	<a href="index.html"><b>Home</b></a>
	<br />
</body>
</html>