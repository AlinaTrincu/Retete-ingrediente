<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Retete</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Retete:</h1>
	<br />
	<p align="center">
		<a href="nou_Reteta.jsp"><b>Adauga o noua reteta.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("retete", "idreteta", aux);
	rs.first();
	String Nume = rs.getString("nume");
	String NumarPortii = rs.getString("numar_portii");
	String Dificultate = rs.getString("dificultate");
	String TimpDePreparare = rs.getString("timp_de_preparare");
	rs.close();
	jb.disconnect();
	%>
	<form action="m2_Reteta.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IDReteta:</td>
				<td><input type="text" name="idreteta" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="Nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Numar portii:</td>
				<td><input type="text" name="NumarPortii" size="30"
					value="<%=NumarPortii%>" /></td>
			</tr>
			<tr>
				<td align="right">Dificultate:</td>
				<td><input type="text" name="Dificultate" size="30"
					value="<%=Dificultate%>" /></td>
			</tr>
			<tr>
				<td align="right">Timp de preparare:</td>
				<td><input type="text" name="TimpDePreparare" size="30"
					value="<%=TimpDePreparare%>" /></td>
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