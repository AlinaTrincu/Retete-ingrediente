<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java"
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Ingrediente</title>
    <link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />

<body>
    <div class="container">
        <h1 align="center">Tabela Ingrediente:</h1>
        <br />
        <p align="center">
            <a href="nou_Ingredient.jsp" class="button"><b>Adauga un nou ingredient.</b></a>
        </p>
        <form action="sterge_Ingredient.jsp" method="post">
            <table class="styled-table smaller-table" align="center">
                <tr>
                    <th class="mark-col">Mark</th>
                    <th class="id-ingredient-col">Id Ingredient</th>
                    <th class="nume-col">Nume</th>
                    <th class="um-col">UM</th>
                    <th class="pret-col">Pret</th>
                    <th class="data-expirare-col">Data Expirare</th>
                </tr>
                <%
                jb.connect();
                ResultSet rs = jb.vedeTabela("ingrediente");
                long x;
                while (rs.next()) {
                    x = rs.getInt("idingredient");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%=x%>" class="styled-checkbox" /></td>
                    <td><%=x%></td>
                    <td><%=rs.getString("nume")%></td>
                    <td><%=rs.getString("unitate_de_masura")%></td>
                    <td><%=rs.getString("pret")%></td>
                    <td><%=rs.getDate("data_expirare")%></td>
                    <%
                    }
                    rs.close();
                    jb.disconnect();
                    %>
                </tr>
            </table>
            <br />
            <p align="center">
                <input type="submit" value="Sterge liniile marcate" class="button">
            </p>
        </form>
        <br />
        <p align="center">
            <a href="index.html" class="button"><b>Home</b></a> <br />
        </p>
    </div>
</body>

</html>
