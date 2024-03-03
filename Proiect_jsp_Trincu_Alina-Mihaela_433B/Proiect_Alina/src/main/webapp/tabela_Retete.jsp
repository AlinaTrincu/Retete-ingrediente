<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Retete</title>
    <link href="<%=request.getContextPath()%>/style-jsp.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.ProiectAlina" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div class="container">
        <h1 align="center">Tabela Retete:</h1>
        <br />
        <div align="center">
            <p class="menu">
                <a href="nou_Reteta.jsp" class="button"><b>Adauga o noua reteta.</b></a>
            </p>
            <form action="sterge_Reteta.jsp" method="post">
                <table class="styled-table smaller-table">
                    <thead>
                        <tr>
                            <th class="mark-col">Mark</th>
                            <th class="id-reteta-col">Id Reteta</th>
                            <th class="nume-col">Nume</th>
                            <th class="numar-portii-col">Numar Portii</th>
                            <th class="dificultate-col">Dificultate</th>
                            <th class="timp-preparare-col">Timp Preparare</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% jb.connect();
                        ResultSet rs = jb.vedeTabela("retete");
                        long x;
                        while (rs.next()) {
                            x = rs.getInt("idreteta");
                        %>
                        <tr>
                            <td><input type="checkbox" name="primarykey" value="<%=x%>" class="styled-checkbox" /></td>
                            <td><%=x%></td>
                            <td><%=rs.getString("nume")%></td>
                            <td><%=rs.getString("numar_portii")%></td>
                            <td><%=rs.getString("dificultate")%></td>
                            <td><%=rs.getString("timp_de_preparare")%></td>
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
