package co.edu.unbosque.nikeshopfront.usuarios;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class TestJSON
{
	private static URL url;
	private static String sitio = "http://localhost:8080/";
	
	public static Usuarios parsingUsuarios(String json) throws ParseException
	{
		 JSONParser jsonParser = new JSONParser();
		 Usuarios user = new Usuarios();
		 
		 JSONObject usuarios = (JSONObject) jsonParser.parse(json);
		 
		 if (usuarios != null)
		 {	 
			 user.setCedula_usuario((Long) usuarios.get("cedula_usuario")); 
			 user.setEmail_usuario(usuarios.get("email_usuario") == null ? "" : usuarios.get("email_usuario").toString());
			 user.setNombre_usuario(usuarios.get("nombre_usuario") == null ? "" : usuarios.get("nombre_usuario").toString());
			 user.setPassword(usuarios.get("password") == null ? "" : usuarios.get("password").toString());
			 user.setUsuario(usuarios.get("usuario") == null ? "" : usuarios.get("usuario").toString());
		 }
		 
		 return user;
	}
	
	public static Usuarios getJSON(Usuarios usuario) throws IOException, ParseException
	{
		url = new URL(sitio + "usuarios/listar/" + usuario.getCedula_usuario());
		HttpURLConnection http = (HttpURLConnection)url.openConnection();
		
		http.setRequestMethod("GET");
		http.setRequestProperty("Accept", "application/json");
		
		InputStream respuesta = http.getInputStream();
		byte[] inp = respuesta.readAllBytes();
		String json = "";
		
		for (int i = 0; i<inp.length ; i++)
		{
			json += (char)inp[i];
		}
		
		Usuarios user = new Usuarios();
		user = parsingUsuarios(json);
		http.disconnect();
		
		return user;
	}
	
	public static Usuarios postJSON(Usuarios usuario) throws IOException
	{
			url = new URL(sitio + "usuarios/guardar");
			
			HttpURLConnection http;
			http = (HttpURLConnection)url.openConnection();
			
			try
			{
				http.setRequestMethod("POST");
			}
			
			catch (ProtocolException e)
			{
				e.printStackTrace();
			}
			
			http.setDoOutput(true);
			http.setRequestProperty("Accept", "application/json");
			http.setRequestProperty("Content-Type", "application/json");
			
			String data = "{"
			+ "\"cedula_usuario\":\""+ usuario.getCedula_usuario()
			+"\",\"email_usuario\": \""+usuario.getEmail_usuario()
			+"\",\"nombre_usuario\": \""+usuario.getNombre_usuario()
			+"\",\"password\":\""+usuario.getPassword()
			+"\",\"usuario\":\""+usuario.getUsuario()
			+ "\"}";
			
			byte[] out = data.getBytes(StandardCharsets.UTF_8);
			OutputStream stream = http.getOutputStream();
			stream.write(out);
			
			InputStream respuesta = http.getInputStream();
			byte[] inp = respuesta.readAllBytes();
			String json = "";
			
			
			for (int i = 0; i<inp.length ; i++)
			{
				json += (char)inp[i];
			}
			
			Usuarios user = new Usuarios();
			try
			{
				user = parsingUsuarios(json);
			}
			
			catch (ParseException e)
			{
				e.printStackTrace();
			}
			
			http.disconnect();
			
			return user;
		}
	
	public static int putJSON(Usuarios usuario) throws IOException
	{
			url = new URL(sitio + "usuarios/actualizar/" + usuario.getCedula_usuario());
			
			HttpURLConnection http;
			http = (HttpURLConnection)url.openConnection();
			
			try
			{
				http.setRequestMethod("PUT");
			}
			
			catch (ProtocolException e)
			{
				e.printStackTrace();
			}
			
			http.setDoOutput(true);
			http.setRequestProperty("Accept", "application/json");
			http.setRequestProperty("Content-Type", "application/json");
			
			String data = "{"
			+"\",\"email_usuario\": \""+usuario.getEmail_usuario()
			+"\",\"nombre_usuario\": \""+usuario.getNombre_usuario()
			+"\",\"password\":\""+usuario.getPassword()
			+"\",\"usuario\":\""+usuario.getUsuario()
			+ "\"}";
			
			byte[] out = data.getBytes(StandardCharsets.UTF_8);
			OutputStream stream = http.getOutputStream();
			stream.write(out);
			
			int respuesta = http.getResponseCode();
			http.disconnect();
			return respuesta;
		}
	
	public static int deleteJSON(Usuarios usuario) throws IOException
	{
			url = new URL(sitio + "usuarios/eliminar/" + usuario.getCedula_usuario());
			
			HttpURLConnection http;
			http = (HttpURLConnection)url.openConnection();
			
			try
			{
				http.setRequestMethod("DELETE");
			}
			
			catch (ProtocolException e)
			{
				e.printStackTrace();
			}
			
			http.setDoOutput(true);
			http.setRequestProperty("Accept", "application/json");
			http.setRequestProperty("Content-Type", "application/json");
			
			int respuesta = http.getResponseCode();
			http.disconnect();
			return respuesta;
		}
}
