<%-- 
    Document   : tabela_Medici
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page import="DAOImpl.ReteteDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Retete"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Retete</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css"
	media="screen" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#stergeRetete").hide();
		$("#modificaRetete").hide();

		$("#update").click(function() {
			$("#modificaRetete").show();
			$("#stergeRetete").hide();
		});
		$("#delete").click(function() {
			$("#stergeRetete").show();
			$("#modificaRetete").hide();
		});
	});
</script>

</head>
<body>
	<%
	ReteteDaoImpl reteteDaoImpl = new ReteteDaoImpl();
	List<Retete> listaRetete = new ArrayList();
	listaRetete = reteteDaoImpl.afiseazaRetete();
	request.setAttribute("listaRetete", listaRetete);
	%>

	<div class="content">

		<div class="menu">
			<p align="center">
				<a href="index.html"><b>Home</b></a>
			</p>
			<p align="center">
				<a href="adauga_Retete.jsp"><b>Adauga</b></a>
			</p>
		</div>


		<table border="1" align="center" class="styled-table smaller-table">
			<tr>
				<td><b>IdReteta:</b></td>
				<td><b>Nume:</b></td>
				<td><b>Timp Preparare:</b></td>
				<td><b>Dificultate:</b></td>
				<td><b>Numar Portii:</b></td>
			</tr>
			<c:forEach var="retete" items="${listaRetete}">
				<tr>
					<td>${retete.idreteta}</td>
					<td>${retete.nume}</td>
					<td>${retete.timpPreparare}</td>
					<td>${retete.dificultate}</td>
					<td>${retete.numarPortii}</td>
				</tr>
			</c:forEach>
		</table>
		<form action="ReteteController" method="POST">
			<div class="actions">
				<div> Modifica: <input type="checkbox"
					id="update"><br> Sterge: <input type="checkbox"
					id="delete"
					onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('timp_de_preparare').disabled = this.checked;
                        document.getElementById('dificultate').disabled = this.checked;
                        document.getElementById('numar_portii').disabled = this.checked;">
					<br> Id reteta<select name="idreteta">
						<c:forEach items="${listaRetete}" var="retete">
							<option value="${retete.idreteta}">${retete.idreteta}</option>
						</c:forEach>
				</select>
				</div>
				
				<br>  Nume: <input id="nume" type="text" name="nume"><br>
				<br>  Timp Preparare: <input id="timp_de_preparare"
					type="text" name="timp_de_preparare"> <br>
				<br>  Dificultate: <input id="dificultate" type="text"
					name="dificultate"> <br>
				<br>  Numar Portii: <input id="numar_portii"
					type="text" name="numar_portii"> <br>
				<br>
				<button type="submit" id="modificaRetete" name="modificaRetete">
					Modifica</button>
				<br> <br>
				<button type="submit" id="stergeRetete" name="stergeRetete">
					Sterge</button>
			</div>
		</form>

	</div>
</body>
</html>
