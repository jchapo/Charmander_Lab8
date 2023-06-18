<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>Página de inicio de sesión</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
      background-image: url("resources/assets/images/fondo.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }
  </style>
</head>
<body>
<div class="container-fluid ">
  <div class="row justify-content-center align-items-center" style="height: 100vh;">
    <div class="col-md-4">
      <div class="card">
        <div class="card-body">
          <h2 class="card-title text-center">Iniciar sesión</h2>
          <form class="form-signin" method="POST" action="<%=request.getContextPath()%>/login">
            <div class="form-group">
              <label for="inputEmail">Correo</label>
              <input type="text" name="inputEmail" class="form-control" id="inputEmail" placeholder="Ingrese correo Pucp" autofocus="" required>

            </div>
            <div class="form-group">
              <label for="password">Contraseña</label>
              <input type="password" class="form-control" id="password" name="inputPassword" placeholder="Ingrese su contraseña" required>
              <% if (request.getAttribute("error") != null) { %>
              <div class="text-danger mb-2"><% System.out.println(request.getAttribute("error"));%></div>
              <% } %>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Ingresar</button>
          </form>
          <div class="text-center d-flex justify-content-center align-items-center pt-3">
            <label><a href="<%=request.getContextPath()%>/ServletRegistroUsuario">Soy nuevo y quiero registrarme</a></label>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
