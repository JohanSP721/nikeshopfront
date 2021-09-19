<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="./bootstrap-5.1.0-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/styles.css">
	<link rel="stylesheet" href="./css/Global.css">
	<title>NikeShop | Usuarios</title>
</head>
<body>
	<%
		try
		{
			boolean logged = (Boolean) session.getAttribute("logged");
			
			if( !logged )
			{
				response.sendRedirect("./Login.jsp");
				session.setAttribute("logged", null);
			}
		}
		
		catch (Exception e)
		{
			response.sendRedirect("./Login.jsp");
			session.setAttribute("logged", null);
		}
	%>
	<nav class = "navbar navbar-light navbar-expand-md fixed-top bg-light bg-colorNav">
            <div class = "container">
	            <a href = "./index.jsp" class= "navbar-brand"><img src="https://1000marcas.net/wp-content/uploads/2019/11/Logo-Nike-1.png" alt="nike" style="width:50px"></a>
	            <div class="collapse navbar-collapse d-md-flex justify-content-md-end" id="navbarT">
	                <ul class = "navbar-nav">
	                    <li class = "nav-item">
	                        <a href = "#" class = "nav-link active">Usuarios</a>
	                    </li>
	                    <li class = "nav-item">
	                        <a href = "#" class = "nav-link">Clientes</a>
	                    </li>
	                    <li class = "nav-item">
	                        <a href = "#" class = "nav-link">Proveedores</a>
	                    </li>
	                    <li class = "nav-item">
	                        <a href = "#" class = "nav-link">Productos</a>
	                    </li>
	                    <li class = "nav-item">
	                        <a href = "#" class = "nav-link">Ventas</a>
	                    </li>
	                    <li class = "nav-item">
	                        <a href = "#" class = "nav-link">Reportes</a>
	                    </li>
	                </ul>
	            </div>
			</div>
        </nav>
        <div class="container containerP">
            <div class="col-12">
                <form action="" class = "row" method = "POST">
                    <div class="col-12 col-md-6">
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-4">
                            <input type="text" class = "form-control" name="id-card" id = "id" placeholder = "Cédula">
                        </div>
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-4">
                        	<input type="text" class = "form-control" name="name" id = "name" placeholder = "Nombre Completo">
                        </div>
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-4">
                        	<input type="text" class = "form-control" name="email" id = "email" placeholder = "Correo Electrónico">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-0">
                        	<input type="text" class = "form-control" name = "user" id = "user" placeholder = "Usuario">
                        </div>
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-0">
                        	<input type="text" class = "form-control" name = "password" id = "password" placeholder = "Contraseña">
                        </div>
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" name="Consultar" value="Consultar">
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" name="Crear" value="Crear">
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" name="Actualizar" value="Actualizar">
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" name="Borrar" value="Borrar">
                    </div>
                </form>
            </div>
        </div>
        <script src = "./bootstrap-5.1.0-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>