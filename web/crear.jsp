<%-- 
    Document   : crear
    Created on : 26-08-2023, 4:59:50
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
        <title>Nuevos productos</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear.jsp" method="post">
                        <div class="form-group">
                            <label>Producto</label>
                            <input name="nombre_producto" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese producto" required="">
                        </div>
                        <div class="form-group">
                            <label>Precio</label>
                            <input name="precio_producto" type="Int" class="form-control" aria-describedby="emailHelp" placeholder="Ejemplo: 2500" required="">
                        </div>
                        <div class="form-group">
                            <label>Descripción</label>
                            <input name="descripción" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese descripción" required="">
                        </div>
                        <div class="form-group">
                            <label>Stock</label>
                            <input name="stock" type="Int" class="form-control" aria-describedby="emailHelp" placeholder="Ingrese stock inicial" required="">
                        </div> 
                        <br>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-primary">Agregar</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String strProducto = request.getParameter("nombre_producto");
                String strPrecio = request.getParameter("precio_producto");
                String strDescripción = request.getParameter("descripción");
                String strStock = request.getParameter("stock");

                try {

                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_almacen?user=root");
                    st = con.createStatement();
                    st.execute("INSERT INTO tbl_productos(nombre_producto,precio_producto,descripción,stock) VALUE('" + strProducto + "','" + strPrecio + "','" + strDescripción + "','" + strStock + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }

        %>
    </body>
</html>
