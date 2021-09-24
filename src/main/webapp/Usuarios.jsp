<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="co.edu.unbosque.nikeshopfront.usuarios.Usuarios" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="./css/Global.css">
	<link rel="stylesheet" href="./css/Header.css">
	<link rel="stylesheet" href="./css/Usuarios.css">
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
	
	<%@ include file="./Header.jsp" %>
	
	<form action="./UserServlet" class="usuarios-form" method="post">
		<article class="usuarios-inputs">
			<input type="number" class="usuarios-input" name="id-card" placeholder="Cédula">
			<input type="text" class="usuarios-input" name="name" placeholder="Nombre Completo">
			<input type="text" class="usuarios-input" name="email" placeholder = "Correo Electrónico">
			<input type="text" class="usuarios-input" name="user" placeholder = "Usuario">
			<input type="text" class="usuarios-input" name="password" placeholder = "Contraseña">
		</article>
		<article class="usuarios-buttons">
			<button type="submit" class="usuarios-button" name="Crear">Crear</button>
			<button type="submit" class="usuarios-button" name="Consultar">Consultar</button>
			<button type="submit" class="usuarios-button" name="Actualizar">Actualizar</button>
			<button type="submit" class="usuarios-button" name="Borrar">Borrar</button>
			<button type="submit" class="usuarios-button" name="Listar">Listar</button>
		</article>

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
					out.println("<p class='message error'>Ingrese una cedula mayor que 0</p>");

					session.setAttribute("userSearchParameter", null);
				}

				else if(error == true)
				{
					out.println("<p class='message error'>Usuario Inexistente</p>");

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

			try
			{
				ArrayList<Usuarios> lista = (ArrayList<Usuarios>) session.getAttribute("lista");

				if(lista != null)
				{
					%>
						<table class="usuarios-table">
							<tbody>
								<tr>
									<td><label>Cedula</label></td>
									<td><label>Nombre</label></td>
									<td><label>Email</label></td>
									<td><label>Usuario</label></td>
									<td><label>Contraseña</label></td>
								</tr>
					<%

					for(Usuarios usuario : lista)
					{
						%>
							<tr>
								<td><%=usuario.getCedula_usuario()%></td>
								<td><%=usuario.getNombre_usuario() %></td>
								<td><%=usuario.getEmail_usuario()%></td>
								<td><%=usuario.getUsuario()%></td>
								<td><%=usuario.getPassword()%></td>
							</tr>
						<%
					}
					%>

						</tbody>
					</table>
					
					<%

					session.setAttribute("lista", null);
				}
			}

			catch (Exception e)
			{
				out.println("");
			}
			
			try
			{
				Boolean update = (Boolean) session.getAttribute("userUpdate");

				Boolean notExist = (Boolean) session.getAttribute("userNotExistUpdate");

				if(!update && !notExist)
				{
					out.println("<p class='message error'>Datos faltantes</p>");

					session.setAttribute("userUpdate", null);
					session.setAttribute("userNotExistUpdate", null);
				}

				else if(update && !notExist)
				{
					out.println("<p class='message'>Datos del Usuario Actualizados</p>");

					session.setAttribute("userUpdate", null);
					session.setAttribute("userNotExistUpdate", null);
				}

				else if(!update && notExist )
				{
					out.println("<p class='message error'>Usuario Inexistente</p>");

					session.setAttribute("userUpdate", null);
					session.setAttribute("userNotExistUpdate", null);
				}
			}
			
			catch (Exception e)
			{
				out.println("");
			}
			
			try
			{
				Boolean update = (Boolean) session.getAttribute("userDelete");

				Boolean notExist = (Boolean) session.getAttribute("userNotExistDelete");

				if(!update && !notExist)
				{
					out.println("<p class='message error'>Datos faltantes</p>");

					session.setAttribute("userUpdate", null);
					session.setAttribute("userNotExistDelete", null);
				}

				else if(update && !notExist)
				{
					out.println("<p class='message'>Datos del Usuario Borrados</p>");

					session.setAttribute("userUpdate", null);
					session.setAttribute("userNotExistDelete", null);
				}

				else if(!update && notExist )
				{
					out.println("<p class='message error'>Cédula Errada</p>");

					session.setAttribute("userUpdate", null);
					session.setAttribute("userNotExistDelete", null);
				}
			}
			
			catch (Exception e)
			{
				out.println("");
			}
		%>
	</form>
</body>
</html>