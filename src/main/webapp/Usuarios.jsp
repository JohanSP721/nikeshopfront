<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="co.edu.unbosque.nikeshopfront.usuarios.Usuarios" %>
<html lang="es">
<head>
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
                <form action="./UserServlet" class = "row" method = "get">
                    <div class="col-12 col-md-6">
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-4">
                            <input type="number" class = "form-control" name="id-card" id = "id" placeholder = "Cédula">
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
                
                <%
					try
					{
						boolean userSave = (Boolean) session.getAttribute("userSave");
						boolean userExist = (Boolean) session.getAttribute("userExist");
						
						if(userExist == true && userSave == false)
						{
							out.println("<p class='message error'>Ingreso un 0 como cedula o el usuario ya existe use el boton actualizar si lo desea</p>");
							session.setAttribute("userExist", null); 
						}
						
						if(userSave == true && userExist == false)
						{
							out.println("<p class='message'>Usuario Creado</p>");
							session.setAttribute("userSave", null); 
						}
						
						if(userSave == false && userExist == false)
						{
							out.println("<p class='message error'>Faltan datos del usuario</p>");
							session.setAttribute("userSave", null); 
						}
					}
				
					catch (Exception e)
					{
						out.println("");
					}
                	
                	try
                	{
                		Usuarios respuesta = (Usuarios) session.getAttribute("userFound");
                		
                		Boolean error = (Boolean) session.getAttribute("userNotFound");
                		
                		Boolean id = (Boolean) session.getAttribute("userSearchParameter");
                		
                		if(id == true)
                		{
                			%>
	                			<p class="message error">Ingrese una cedula mayor que 0</p>
                			<%
                			
                			session.setAttribute("userSearchParameter", null);
                		}
                		
                		else if(error == true)
                		{
                			%>
                			<p class="message error">Usuario no encontrado</p>
            				<%
            				
            				session.setAttribute("userNotFound", null);
                		}
                		
                		else if(respuesta != null)
                		{
	                		%>
	                			
	                			<article class="message">
	                				<p>Cedula: <%=respuesta.getCedula_usuario()%></p>
	                				<p>Email: <%=respuesta.getEmail_usuario() == null ? "" : respuesta.getEmail_usuario()%></p>
	                				<p>Nombre: <%=respuesta.getNombre_usuario() == null ? "" : respuesta.getNombre_usuario()%></p>
	                				<p>Contraseña: <%=respuesta.getPassword() == null ? "" : respuesta.getPassword()%></p>
	                				<p>Usuario <%=respuesta.getUsuario() == null ? "" : respuesta.getUsuario()%></p>
	                			</article>
	                		<% 
	                		
	                		session.setAttribute("userFound", null);
                		}
                	}
                	
                	catch (Exception e)
                	{
                		out.println("");
                	}
                %>
            </div>
        </div>
        <script src = "./bootstrap-5.1.0-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>