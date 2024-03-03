<%-- 
    Document   : adauga_Medic
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
        <title>Ingrediente</title>
    </head>
    <body>

        <div id="add">
            <h1> Adauga Ingrediente </h1>
            <form action="IngredienteController" method="GET">
                <table>
                    <tr>
                        <td> Nume Ingredient: </td>
                        <td><input type="text" name="nume"></td>
                    </tr>
                    <tr>
                        <td> Unitate de Masura: </td>
                        <td><input type="text" name="unitateDeMasura"></td>
                    </tr>
                    <tr>
                        <td> Pret: </td>
                        <td><input type="text" name="pret"></td>
                    </tr>
                    <tr>
                        <td> Data Expirare: </td>
                        <td><input type="text" name="dataExpirare"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaIngrediente" value="Adauga"></td>
                    </tr>
                </table>
            </form>
        </div>

        <form action="IngredienteController" method="POST">
            <input type="submit" name="afiseazaIngrediente" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a><br/>
    </body>
</html>
