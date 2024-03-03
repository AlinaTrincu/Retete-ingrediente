<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Asocieri Ingrediente Retete</title>
    <link href="style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />

<body>
    <div class="container">
        <h1>Tabela Asocieri Ingrediente Retete :</h1>
        <br />
        <div align="center">
            <p class="menu">
                <a href="nou_Asociere.jsp" class="button"><b>Adauga o noua asociere ingrediente retete.</b></a>
            </p>
            <form action="sterge_Asociere.jsp" method="post">
                <table class="styled-table smaller-table">
                    <thead>
                        <tr>
                            <th class="mark-col">Mark</th>
                            <th class="id-asociere-col">Id asociere</th>
                            <th class="id-reteta-col">Id reteta</th>
                            <th class="nume-reteta-col">Nume Reteta</th>
                            <th class="id-ingredient-col">Id Ingredient</th>
                            <th class="nume-ingredient-col">Nume Ingredient</th>
                            <th class="cantitate-ingredient-col">Cantitate ingredient</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        jb.connect();
                        ResultSet rs = jb.vedeAsociere();
                        long x;
                        while (rs.next()) {
                            x = rs.getInt("idlegatura");
                        %>
                        <tr>
                            <td><input type="checkbox" name="primarykey" value="<%=x%>" class="styled-checkbox" /></td>
                            <td><%=x%></td>
                            <td><%=rs.getInt("idreteta")%></td>
                            <td><%=rs.getString("NumeReteta")%></td>
                            <td><%=rs.getInt("idingredient")%></td>
                            <td><%=rs.getString("NumeIngredient")%></td>
                            <td><%=rs.getInt("CantitateIngredient")%></td>
                        </tr>
                        <%
                        }
                        rs.close();
                        jb.disconnect();
                        %>
                    </tbody>
                </table>
                <br />
                <p align="center">
                    <input type="submit" value="Sterge liniile marcate" class="button">
                </p>
            </form>
        </div>
        <br />
        <p align="center">
            <a href="index.html" class="home-button"><b>Home</b></a> <br />
        </p>
    </div>
</body>

</html>
