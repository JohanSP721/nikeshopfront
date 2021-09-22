package co.edu.unbosque.nikeshopfront.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;

import co.edu.unbosque.nikeshopfront.usuarios.TestJSON;
import co.edu.unbosque.nikeshopfront.usuarios.Usuarios;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
   
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	// Nombre del controlador JDBC y URL de la base de datos
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/nikeshop";
 
         // Nombre de usuario y contraseña de la base de datos, debe configurarse de acuerdo con los suyos
    static final String USER = "root";
    static final String PASS = "JoSp22132321/_";

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	

        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("user");
        String pwd = request.getParameter("pass");
        //System.out.println(username+":"+pwd);
        Connection conn = null;
        Statement stmt = null;
        try
        {
       	         // Registre el controlador JDBC
            Class.forName(JDBC_DRIVER);
        
                         // abrir enlace
                       //System.out.println ("Conectando a la base de datos ...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
        
                         // ejecuta la consulta
                         //System.out.println ("Instanciar un objeto de declaración ...");
            stmt = conn.createStatement();
            
            String sql = "SELECT * FROM usuarios where usuario='" + username + "' and password= '" + pwd + "'";
        	ResultSet rs = stmt.executeQuery(sql);
      
        	 if(rs.next())
        	 {
        		 request.getSession().setAttribute("logged", true);
        		 response.sendRedirect("./index.jsp");
        	 }
        	 
        	 else
        	 {
        		 request.getSession().setAttribute("logIncorrect", true);
        		 response.sendRedirect("./Login.jsp");
        	 }
        	          // cerrar cuando haya terminado
             rs.close();
             stmt.close();
             conn.close(); 
        }
        
        catch(SQLException se)
        {
                         // Manejar errores JDBC
            se.printStackTrace();
        }
        
        catch(Exception e)
        {
                         // Manejar errores Class.forName
        	e.printStackTrace();
        }
        
        finally
        {
                         // cierra el recurso
            try
            {
                if(stmt!=null) stmt.close();
            }
            
            catch(SQLException se2)
            {
                         } // no hacer nada
            try
            {
                if(conn!=null) conn.close();
            }
            
            catch(SQLException se){
                se.printStackTrace();
            }
        }
   	

    }

}
