package co.edu.unbosque.nikeshopfront.usuarios;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {    
        String consultar = request.getParameter("Consultar");
        String crear = request.getParameter("Crear");
        String actualizar = request.getParameter("Actualizar");
        String borrar = request.getParameter("Borrar");
        String listar = request.getParameter("Listar");
        
        if(consultar != null)
        {
        	buscarUsuario(request, response);
        }
        
        else if(crear != null)
        {
        	crearUsuario(request, response);
        }
        
        else if(actualizar != null)
        {
        	actualizarUsuario(request, response);
        }
        
        else if(borrar != null)
        {
        	eliminarUsuario(request, response);
        }
        
        else if(listar != null)
        {
        	listarUsuarios(request, response);
        }
    }
    
    public void crearUsuario(HttpServletRequest request, HttpServletResponse response)
    {
    	if(request.getParameter("id-card") == "" || request.getParameter("name") == "" || request.getParameter("email") == "" || request.getParameter("user") == "" || request.getParameter("password") == "" )
    	{
    		request.getSession().setAttribute("userSave", false);
    		request.getSession().setAttribute("userExist", false);
    		
			try
			{
				response.sendRedirect("./Usuarios.jsp");
			}
			
			catch (IOException e)
			{
				e.printStackTrace();
			}
    	}
    	
    	else
    	{
    		Usuarios usuario = new Usuarios();
        	
        	usuario.setCedula_usuario(Long.parseLong( request.getParameter("id-card") ));
        	usuario.setEmail_usuario(request.getParameter("email").toString());
        	usuario.setNombre_usuario(request.getParameter("name").toString());
        	usuario.setPassword(request.getParameter("password").toString());
        	usuario.setUsuario(request.getParameter("user").toString());
        	
        	Usuarios respuesta = null;
        	
        	try
        	{
    			respuesta = TestJSON.postJSON(usuario);
    			
    			if(respuesta.getCedula_usuario() != 0)
    			{
    				request.getSession().setAttribute("userSave", true);
    	    		request.getSession().setAttribute("userExist", false);
    				response.sendRedirect("./Usuarios.jsp");
    			}
    			
    			else
    			{
    				request.getSession().setAttribute("userSave", false);
    	    		request.getSession().setAttribute("userExist", true);
    				response.sendRedirect("./Usuarios.jsp");
    			}
    		}
        	
        	catch (IOException e)
        	{
    			e.printStackTrace();
    		}
    	}
    }
    
    public void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
    {
    	if(request.getParameter("id-card") != "" && (request.getParameter("name") != "" || request.getParameter("email") != "" || request.getParameter("user") != "" || request.getParameter("password") != ""))
    	{
    		Usuarios usuario = new Usuarios();
    		
    		usuario.setCedula_usuario(Long.parseLong( request.getParameter("id-card") ));
        	usuario.setEmail_usuario(request.getParameter("email").toString());
        	usuario.setNombre_usuario(request.getParameter("name").toString());
        	usuario.setPassword(request.getParameter("password").toString());
        	usuario.setUsuario(request.getParameter("user").toString());
    		
    		int respuesta = 0;
			
			try
			{
				respuesta = TestJSON.putJSON(usuario);
				
				if(respuesta == 200)
				{
					request.getSession().setAttribute("userUpdate", true);
		    		request.getSession().setAttribute("userNotExistUpdate", false);
		    		
		    		response.sendRedirect("./Usuarios.jsp");
				}
				
				else
				{
					request.getSession().setAttribute("userUpdate", false);
		    		request.getSession().setAttribute("userNotExistUpdate", true);
		    		
		    		response.sendRedirect("./Usuarios.jsp");
				}
			}
			
			catch (Exception e)
			{
				e.printStackTrace();
			}
    	}
    	
    	else
    	{
    		request.getSession().setAttribute("userUpdate", false);
    		request.getSession().setAttribute("userNotExistUpdate", false);
    		
			try
			{
				response.sendRedirect("./Usuarios.jsp");
			}
			
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
    }
    
    public void buscarUsuario(HttpServletRequest request, HttpServletResponse response)
    {
    	if(request.getParameter("id-card") == "" || Long.parseLong(request.getParameter("id-card")) <= 0)
    	{
    		request.getSession().setAttribute("userSearchParameter", true);
    		request.getSession().setAttribute("userFound", null);
			request.getSession().setAttribute("userNotFound", false);
    		
			try
			{
				response.sendRedirect("./Usuarios.jsp");
			}
			
			catch (IOException e)
			{
				e.printStackTrace();
			}
    	}
    	
    	else
    	{
    		Usuarios usuario = new Usuarios();
        	
        	usuario.setCedula_usuario(Long.parseLong( request.getParameter("id-card") ));
        	
        	Usuarios respuesta = null;
        	
        	try
        	{
    			respuesta = TestJSON.getJSONById(usuario);
    			
    			if(respuesta.getCedula_usuario() != 0)
    			{
    				request.getSession().setAttribute("userSearchParameter", false);
    	    		request.getSession().setAttribute("userFound", respuesta);
    				request.getSession().setAttribute("userNotFound", false);
    				response.sendRedirect("./Usuarios.jsp");
    			}
    			
    			else
    			{
    				request.getSession().setAttribute("userSearchParameter", false);
    	    		request.getSession().setAttribute("userFound", null);
    				request.getSession().setAttribute("userNotFound", true);
    				response.sendRedirect("./Usuarios.jsp");
    			}
    		}
        	
        	catch (IOException | ParseException e)
        	{
    			e.printStackTrace();
    		}
    	}
    }
    
    public void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
    {
    	if(request.getParameter("id-card") != "")
    	{
    		Usuarios usuario = new Usuarios();
    		
    		usuario.setCedula_usuario(Long.parseLong( request.getParameter("id-card") ));
    		
    		int respuesta = 0;
			
			try
			{
				respuesta = TestJSON.deleteJSON(usuario);
				
				if(respuesta == 200)
				{
					request.getSession().setAttribute("userDelete", true);
		    		request.getSession().setAttribute("userNotExistDelete", false);
		    		
		    		response.sendRedirect("./Usuarios.jsp");
				}
				
				else
				{
					request.getSession().setAttribute("userDelete", false);
		    		request.getSession().setAttribute("userNotExistDelete", true);
		    		
		    		response.sendRedirect("./Usuarios.jsp");
				}
			}
			
			catch (Exception e)
			{
				e.printStackTrace();
			}
    	}
    	
    	else
    	{
    		request.getSession().setAttribute("userDelete", false);
    		request.getSession().setAttribute("userNotExistDelete", false);
    		
			try
			{
				response.sendRedirect("./Usuarios.jsp");
			}
			
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
    }
    
    public void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
    {
    	try
    	{
			ArrayList<Usuarios> lista = TestJSON.getJSON();
			
			request.getSession().setAttribute("lista", lista);
			
			response.sendRedirect("./Usuarios.jsp");
		}
    	
    	catch (Exception e)
    	{
			e.printStackTrace();
		}
    }
}
