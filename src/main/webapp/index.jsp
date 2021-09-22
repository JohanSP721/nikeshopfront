<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="./bootstrap-5.1.0-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/styles.css">
	<link rel="stylesheet" href="./css/Global.css">
	<title>NikeShop</title>
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
	            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarT" aria-controls="navbarT" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	            <div class="collapse navbar-collapse d-md-flex justify-content-md-end" id="navbarT">
	                <ul class = "navbar-nav">
	                    <li class = "nav-item">
	                        <a href = "./Usuarios.jsp" class = "nav-link active">Usuarios</a>
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
        <script src = "./bootstrap-5.1.0-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>