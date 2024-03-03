<%-- 
    Document   : adauga_Medic
    Created on : Nov 22, 2016, 6:19:27 PM
    Author     : vali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retete</title>
    </head>
    <body>

        <div id="add">
            <h1> Adauga Reteta </h1>
            <form action="ReteteController" method="GET">
                <table>
                    <tr>
                        <td> Nume Reteta: </td>
                        <td><input type="text" name="nume"></td>
                    </tr>
                    <tr>
                        <td> Timp de preparare: </td>
                        <td><input type="text" name="timp_de_preparare"></td>
                    </tr>
                    <tr>
                        <td> Dificultate: </td>
                        <td><input type="text" name="dificultate"></td>
                    </tr>
                    <tr>
                        <td> Numar de Portii: </td>
                        <td><input type="text" name="numar_portii"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaRetete" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <form action="ReteteController" method="POST">
            <input type="submit" name="afiseazaRetete" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
