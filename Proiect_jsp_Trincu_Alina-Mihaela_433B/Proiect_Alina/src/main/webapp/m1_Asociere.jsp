<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Asocieri</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Asocieri:</h1>
	<br />
	<p align="center">
		<a href="nou_Asociere.jsp"><b>Adauga o noua asociere ingredient reteta.</b></a> <a href="index.html"><b>Home</b></a>
	</p>
	<%
	jb.connect();
	String NumeReteta, NumeIngredient, CantitateIngredient;
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.vedeAsociereDupaId(aux);
	rs.first();
	int id1 = rs.getInt("idingredient");
	int id2 = rs.getInt("idreteta");
	NumeIngredient = rs.getString("NumeIngredient");
	NumeReteta = rs.getString("NumeReteta");
	CantitateIngredient = rs.getString("CantitateIngredient");
	ResultSet rs1 = jb.vedeTabela("ingrediente");
	ResultSet rs2 = jb.vedeTabela("retete");
	int idingredient, idreteta;
	%>
	<form action="m2_Asociere.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">IdLegatura:</td>
				<td><input type="text" name="idlegatura" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Id ingredient:</td>
				<td><SELECT NAME="idingredient">
						<%
						while (rs1.next()) {
							idingredient = rs1.getInt("idingredient");
							NumeIngredient = rs1.getString("Nume");
							if (idingredient != id1) {
						%>
						<OPTION VALUE="<%=idingredient%>"><%=idingredient%>,
							<%=NumeIngredient%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idingredient%>"><%=idingredient%>,
							<%=NumeIngredient%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">idreteta::</td>
				<td><SELECT NAME="idreteta">
						<%
						while (rs2.next()) {
							idreteta = rs2.getInt("idreteta");
							NumeReteta = rs2.getString("Nume");
							if (idreteta != id2) {
						%>
						<OPTION VALUE="<%=idreteta%>"><%=idreteta%>,
							<%=NumeReteta%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idreteta%>"><%=idreteta%>,
							<%=NumeReteta%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">Cantitate:</td>
				<td><input type="text" name="CantitateIngredient" size="30"
					value="<%=CantitateIngredient%>" /></td>
			</tr>
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center"">
		<a href="index.html"><b>Home</b></a> <br />
</body>
<%
rs.close();
rs1.close();
rs2.close();
jb.disconnect();
%>
</html>