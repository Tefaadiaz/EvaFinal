<%-- 
    Document   : index
    Created on : 26-08-2023, 2:20:44
    Author     : steph
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Fontawesome -->
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>

        <!-- Boostrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <title>Listado de productos</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col" colspan="5" class="text-center">Productos</th>
                                <th scope="col">
                                    <a  href="crear.jsp"><i class="fa-solid fa-cart-plus"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre producto</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Stock</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_almacen?user=root");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM tbl_productos ORDER BY 1 DESC");
                                while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("1")%></th>
                                <td><%= rs.getString("2")%></td>
                                <td><%= rs.getString("3")%></td>
                                <td><%= rs.getString("4")%></td>
                                <td><%= rs.getString("5")%></td>
                                <td>

                                        <a  href="editar.jsp?id_producto=<%= rs.getString(1)%>&nombre_producto=<%= rs.getString(2)%>&precio_producto=<%= rs.getString(3)%>&descripción=<%= rs
                                            .getString(4)%>&Stock<%= rs.getString(5)%>"<i class="fa fa-pencil-alt"></i></a>


                                    <a  href="borrar.jsp?id_producto=<%= rs.getString("nombre_producto")%>"><i class="fa fa-trash-alt"></i></a>   
                                </td>
                            </tr>

                            <% }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

