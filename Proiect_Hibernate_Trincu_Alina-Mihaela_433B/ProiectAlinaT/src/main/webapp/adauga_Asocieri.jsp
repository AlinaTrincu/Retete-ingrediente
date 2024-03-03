<%-- 
    Document   : adauga_Consultatie
    Created on : Nov 22, 2016, 6:19:27 PM
    Author     : vali
--%>

<%@page import="DAOImpl.ReteteDaoImpl"%>
<%@page import="DAOImpl.IngredienteDaoImpl"%>
<%@page import="pojo.Retete"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Ingrediente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asocieri</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
<%
    ReteteDaoImpl reteteDaoImpl = new ReteteDaoImpl();
    IngredienteDaoImpl ingredienteDaoImpl = new IngredienteDaoImpl();
    List<Retete> listaRetete = reteteDaoImpl.afiseazaRetete();
    List<Ingrediente> listaIngrediente = ingredienteDaoImpl.afiseazaIngrediente();
    request.setAttribute("listaRetete", listaRetete);
    request.setAttribute("listaIngrediente", listaIngrediente);
%>

        <div id="add">
            <h1> Adauga o noua asociere: </h1>
            <form action="AsocieriController" method="GET">
                <table>
                    <tr>
                        <td> Retete: </td>
                        <td>
                            <select name="idreteta">
                                <c:forEach items="${listaRetete}" var="retete">
                                    <option value="${retete.idreteta}">${retete.idreteta}, ${retete.nume}, ${retete.timpPreparare}, ${retete.dificultate}${retete.numarPortii}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Ingrediente: </td>
                        <td>
                            <select name="idingredient">
                                <c:forEach items="${listaIngrediente}" var="ingrediente">
                                    <option value="${ingrediente.idingredient}">${ingrediente.idingredient}, ${ingrediente.nume}, ${ingrediente.pret}, ${ingrediente.dataExpirare}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Cantitate Ingredient: </td>
                        <td><input type="text" name="cantitateIngredient"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaAsociere" value="Adauga"></td>
                    </tr>
                </table>
            </form>
        </div>

        <form action="AsocieriController" method="POST">
            <input type="submit" name="afiseazaAsociere" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
