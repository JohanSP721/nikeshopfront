<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
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
	       <nav>
            <div>
	            <a href = "#"><img src="https://1000marcas.net/wp-content/uploads/2019/11/Logo-Nike-1.png" alt="nike" style="width:50px"></a>
	            <button type="button" data-bs-toggle="collapse" data-bs-target="#navbarT" aria-controls="navbarT" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	        </div>
            <div id="navbarT">
                <ul>
                    <li>
                        <a href = "./Usuarios.jsp">Usuarios</a>
                    </li>
                    <li>
                        <a href = "#">Clientes</a>
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
        </nav>
</body>
</html>