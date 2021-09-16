<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="./css/Global.css">
	<title>NikeShop | Usuarios</title>
</head>
<body>
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
	<div class="container containerP">
            <div class="col-12">
                <form action="" class = "row" method = "POST">
                    <div class="col-12 col-md-6">
                        <div class="form-group row mb-3 me-md-4">
                            <label for="id" class = "form-label"></label>
                            <input type="text" class = "form-control" name = "id" id = "id" placeholder = "Cédula">
                        </div>
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-4">
                            <label for="name" class = "form-label"></label>
                            <input type="text" class = "form-control" name = "name" id = "name" placeholder = "Nombre Completo">
                        </div>
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-4">
                            <label for="email" class = "form-label"></label>
                            <input type="text" class = "form-control" name = "email" id = "email" placeholder = "Correo Electrónico">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-0">
                            <label for="user" class = "form-label"></label>
                            <input type="text" class = "form-control" name = "user" id = "user" placeholder = "Usuario">
                        </div>
                        <div class="form-group row mb-3 me-2 ms-2 ms-md-0 me-md-0">
                            <label for="password" class = "form-label"></label>
                            <input type="text" class = "form-control" name = "password" id = "password" placeholder = "Contraseña">
                        </div>
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" value = "Consultar">
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" value = "Crear">
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" value = "Actualizar">
                    </div>
                    <div class="col-12 col-md-3 d-grid mb-5 mb-md-0">
                        <input type = "submit" class = "btn btn-primary" value = "Borrar">
                    </div>
                </form>
            </div>
        </div>
</body>
</html>