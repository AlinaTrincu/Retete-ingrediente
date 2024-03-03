<%-- 
    Document   : tabela_Consultatie
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page import="DAOImpl.ReteteDaoImpl"%>
<%@page import="DAOImpl.IngredienteDaoImpl"%>
<%@page import="DAOImpl.AsocieriDaoImpl"%>
<%@page import="pojo.Retete"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Ingrediente"%>
<%@page import="pojo.Asocieri"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Asocieri</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css"
	media="screen" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#stergeAsocieri").hide();
		$("#modificaAsocieri").hide();

		$("#update").click(function() {
			$("#modificaAsocieri").show();
			$("#stergeAsocieri").hide();
		});
		$("#delete").click(function() {
			$("#stergeAsocieri").show();
			$("#modificaAsocieri").hide();
		});
	});
</script>

</head>
<body>
	<%
	ReteteDaoImpl reteteDaoImpl = new ReteteDaoImpl();
	IngredienteDaoImpl ingredienteDaoImpl = new IngredienteDaoImpl();
	AsocieriDaoImpl asocieriDaoImpl = new AsocieriDaoImpl();
	List<Retete> listaRetete = new ArrayList();
	listaRetete = reteteDaoImpl.afiseazaRetete();
	List<Ingrediente> listaIngrediente = new ArrayList();
	listaIngrediente = ingredienteDaoImpl.afiseazaIngrediente();

	List<Asocieri> listaAsocieri = new ArrayList();
	listaAsocieri = asocieriDaoImpl.afiseazaAsocieri();
	request.setAttribute("listaRetete", listaRetete);
	request.setAttribute("listaIngrediente", listaIngrediente);
	request.setAttribute("listaAsocieri", listaAsocieri);
	%>
	<h1 align="center">Tabela Asocieri:</h1>
	<div class="menu">
		<p align="center">
			<a href="index.html"><b>Home</b></a>
		</p>
		<p align="center">
			<a href="adauga_Asocieri.jsp"><b>Adauga</b></a>
		</p>
	</div>
	<table border="1" align="center" class="styled-table smaller-table">
		<tr>
			<td><b>IdLegatura:</b></td>
			<td><b>IdReteta:</b></td>
			<td><b>Nume:</b></td>
			<td><b>Timp Preparare:</b></td>
			<td><b>Dificultate:</b></td>
			<td><b>Numar Portii:</b></td>
			<td><b>IdIngredient:</b></td>
			<td><b>Nume:</b></td>
			<td><b>Pret:</b></td>
			<td><b>Data Expirare:</b></td>
		</tr>
		<c:forEach var="asocieri" items="${listaAsocieri}">
			<tr>
				<td>${asocieri.idlegatura}</td>
				<td>${asocieri.retete.idreteta}</td>
				<td>${asocieri.retete.nume}</td>
				<td>${asocieri.retete.timpPreparare}</td>
				<td>${asocieri.retete.dificultate}</td>
				<td>${asocieri.retete.numarPortii}</td>
				<td>${asocieri.ingrediente.idingredient}</td>
				<td>${asocieri.ingrediente.nume}</td>
				<td>${asocieri.ingrediente.pret}</td>
				<td>${asocieri.ingrediente.dataExpirare}</td>
			</tr>
		</c:forEach>
	</table>
	<form action="AsocieriController" method="POST">
		<div class="actions">
			<div>
				Modifica: <input type="checkbox" id="update"><br> Sterge: <input
					type="checkbox" id="delete"
					onclick="document.getElementById('idingredient').disabled = this.checked;
                        document.getElementById('idreteta').disabled = this.checked;
                        document.getElementById('cantitate_ingredient').disabled = this.checked;">
				<br> Idlegatura: <select name="idlegatura">
					<c:forEach items="${listaAsocieri}" var="asocieri">
						<option value="${asocieri.idlegatura}">${asocieri.idlegatura}</option>
					</c:forEach>
				</select>
			</div>

			<br>
			<br> Ingredient: <select id="idingredient" name="idingredient">
				<c:forEach items="${listaIngrediente}" var="ingrediente">
					<option value="${ingrediente.idingredient}">${ingrediente.idingredient},
						${ingrediente.nume},${ingrediente.pret}${ingrediente.dataExpirare}</option>
				</c:forEach>
			</select> <br>
			<br> Reteta: <select id="idreteta" name="idreteta">
				<c:forEach items="${listaRetete}" var="retete">
					<option value="${retete.idreteta}">${retete.idreteta},
						${retete.nume},
						${retete.timpPreparare}${retete.dificultate}${retete.numarPortii}</option>
				</c:forEach>
			</select> <br>
			<br>Cantitatea ingredientului: <input
				id="cantitate_ingredient" type="text" name="cantitateIngredient">
			<br>
			<br>
			<button type="submit" id="modificaAsocieri" name="modificaAsocieri">
				Modifica</button>
			<br> <br>
			<button type="submit" id="stergeAsocieri" name="stergeAsocieri">
				Sterge</button>
		</div>
	</form>
	<br>

</body>
</html>
