<%-- 
    Document   : tabela_Pacienti
    Created on : Nov 22, 2016, 6:20:29 PM
    Author     : vali
--%>

<%@page import="DAOImpl.IngredienteDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Ingrediente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingrediente</title>
<link href="style-jsp.css" rel="stylesheet" type="text/css"
	media="screen" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#stergeIngrediente").hide();
		$("#modificaIngrediente").hide();

		$("#update").click(function() {
			$("#modificaIngrediente").show();
			$("#stergeIngrediente").hide();
		});
		$("#delete").click(function() {
			$("#stergeIngrediente").show();
			$("#modificaIngrediente").hide();
		});
	});
</script>

</head>
<body>
	<%
	IngredienteDaoImpl ingredienteDaoImpl = new IngredienteDaoImpl();
	List<Ingrediente> listaIngrediente = new ArrayList();
	listaIngrediente = ingredienteDaoImpl.afiseazaIngrediente();
	request.setAttribute("listaIngrediente", listaIngrediente);
	%>
	<h1 align="center">Tabela Ingrediente:</h1>
	<div class="menu">
		<p align="center">
			<a href="index.html"><b>Home</b></a>
		</p>
		<p align="center">
			<a href="adauga_Ingrediente.jsp"><b>Adauga</b></a>
		</p>
	</div>
	<table border="1" align="center" class="styled-table smaller-table">
		<tr>
			<td><b>IdIngredient:</b></td>
			<td><b>Nume:</b></td>
			<td><b>Unitate Masura:</b></td>
			<td><b>Pret:</b></td>
			<td><b>Data Expirare:</b></td>
		</tr>
		<c:forEach var="ingrediente" items="${listaIngrediente}">
			<tr>
				<td>${ingrediente.idingredient}</td>
				<td>${ingrediente.nume}</td>
				<td>${ingrediente.unitateMasura}</td>
				<td>${ingrediente.pret}</td>
				<td>${ingrediente.dataExpirare}</td>
			</tr>
		</c:forEach>
	</table>
	<form action="IngredienteController" method="POST">
		<div class="actions">

			<div>
				Modifica: <input type="checkbox" id="update"><br> Sterge: <input
					type="checkbox" id="delete"
					onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('unitate_de_masura').disabled = this.checked;
                        document.getElementById('pret').disabled = this.checked;
                        document.getElementById('data_expirare').disabled = this.checked;"><br>Id ingredient
				<select name="idingredient">
					<c:forEach items="${listaIngrediente}" var="ingrediente">
						<option value="${ingrediente.idingredient}">${ingrediente.idingredient}</option>
					</c:forEach>
				</select>
			</div>
			<br><br>
			Modifica Nume: <input id="nume" type="text" name="nume"> <br>
			<br> Modifica Unitate de Masura: <input id="unitate_de_masura"
				type="text" name="unitateDeMasura"> <br> <br>
			Modifica Pret: <input id="pret" type="text" name="pret"> <br>
			<br> Modifica Data de Expirare: <input id="data_expirare"
				type="text" name="dataExpirare"> <br> <br>
			<button type="submit" id="modificaIngrediente"
				name="modificaIngrediente">Modifica</button>
			<br> <br>
			<button type="submit" id="stergeIngrediente" name="stergeIngrediente">Sterge</button>
			</p>
	</form>

</body>
</html>
