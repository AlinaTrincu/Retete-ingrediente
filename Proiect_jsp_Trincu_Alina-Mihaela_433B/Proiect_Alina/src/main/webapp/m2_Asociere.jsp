<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
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
 <h1 align="center"> Tabela Asocieri:</h1>
 <br/>
 <p align="center"><a href="nou_Asociere.jsp"><b>Adauga o noua asociere ingredient reteta.</b></a> <a 
href="index.html"><b>Home</b></a></p>
 <%
 jb.connect();
 int aux = java.lang.Integer.parseInt(request.getParameter("idlegatura"));
 String idingredient = request.getParameter("idingredient");
 String idreteta = request.getParameter("idreteta");
 String CantitateIngredient = request.getParameter("CantitateIngredient");
 String[] valori = {idingredient, idreteta, CantitateIngredient};
 String[] campuri = {"idingredient", "idreteta", "cantitate_ingredient"};
 jb.modificaTabela("ingrediente_reteta", "idlegatura", aux, campuri, valori);
 jb.disconnect();
 %>
 <h1 align="center">Modificarile au fost efectuate !</h1>
 <p align="center">
 <a href="index.html"><b>Home</b></a>
 <br/>
 </body>
</html>