<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga asociere</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	int idingredient, idreteta;
	String id1, id2, NumeReteta, NumeIngredient, CantitateIngredient;

	id1 = request.getParameter("idingredient");
	id2 = request.getParameter("idreteta");

	CantitateIngredient = request.getParameter("CantitateIngredient");
	if (id1 != null) {
		jb.connect();
		jb.adaugaAsociere(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), java.lang.Integer.parseInt(CantitateIngredient));
		jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
	} else {
	jb.connect();
	ResultSet rs1 = jb.vedeTabela("ingrediente");
	ResultSet rs2 = jb.vedeTabela("retete");
	%>
	<center><h1>Suntem in tabela asocieri ingrediente reteta.</h1></center>
	<form action="nou_Asociere.jsp" method="post">
		<table>
			<tr>
				<td align="right">ID Ingredient:</td>
				<td><SELECT NAME="idingredient">
						<%
						while (rs1.next()) {
							idingredient = rs1.getInt("idingredient");
							NumeIngredient = rs1.getString("nume");
						%>
						<OPTION VALUE="<%=idingredient%>">[<%=idingredient%>] <%=NumeIngredient%></OPTION>
						<%
						}
						%>
				</SELECT>

				</td>
			</tr>
			<tr>
				<td align="right">ID Reteta:</td>
				<td><SELECT NAME="idreteta">
						<%
						while (rs2.next()) {
							idreteta = rs2.getInt("idreteta");
							NumeReteta = rs2.getString("nume");
						%>
						<OPTION VALUE="<%=idreteta%>">[<%=idreteta%>] <%=NumeReteta%></OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td align="right">Cantitate Ingredient:</td>
				<td><input type="text" name="CantitateIngredient" size="30" /></td>
			</tr>
		</table>
		<center>
			<input type="submit" value="Adauga asociere" />
		</center>
	</form>
	<%
	}
	%>
	
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>