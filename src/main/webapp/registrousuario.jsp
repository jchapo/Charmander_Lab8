<%@ page import="charmander.Models.Beans.Especialidad" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="especialidades" type="java.util.ArrayList<charmander.Models.Beans.Especialidad>" scope="request"/>
<!DOCTYPE html>
<html>
<head>
  <title>Registro de Usuario</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

  <style>
    .container {
      max-width: 600px;
      margin: 20px auto;
      padding: 40px;
      border-radius: 10px;

    }
    body {
      background-image: url("resources/assets/images/fondo.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }

  </style>
</head>
<body>

<div class="container" style="background-color: white">
  <h2>Registro de Usuario</h2>
  <form method="POST" action="<%=request.getContextPath()%>/ServletRegistroUsuario">
    <div class="form-group">
      <label for="nombre">Nombre</label>
      <input type="text" id="nombre" class="form-control" name="nombre" required>
    </div>
    <div class="form-group">
      <label for="apellido">Apellido</label>
      <input type="text" id="apellido" class="form-control" name="apellido" required>
    </div>
    <div class="form-group">
      <label for="nacimiento">Fecha de nacimiento</label>
      <input type="date" id="nacimiento" class="form-control" name="nacimiento"  required>
    </div>
    <div class="form-group">
      <label for="codigoPucp">Código PUCP</label>
      <input type="text" id="codigoPucp" class="form-control" name="codigoPucp"  required>
    </div>
    <div class="form-group">
      <label for="correo">Correo Electrónico</label>
      <input type="email" id="correo" class="form-control" name="correo"  required>
    </div>
    <div class="form-group">
      <label for="especialidad">Especialidad</label>
      <select id="especialidad" class="form-control" name="especialidad" required>
        <option>--Sin especialidad--</option>
        <% for (Especialidad especialidad : especialidades) {%>
        <option value="<%=especialidad.getIdEspecialidad()%>"><%=especialidad.getNombreEspecialidad()%>
        </option>
        <% }%>
      </select>
    </div>
    <div class="form-group">
      <label for="contrasena">Contraseña</label>
      <input type="password" id="contrasena" class="form-control" name="contrasena" required>
    </div>
    <div class="form-group">
      <label for="confirmarContrasena">Confirmar Contraseña</label>
      <input type="password" id="confirmarContrasena" class="form-control" name="confirmarContrasena" required>
    </div>
    <button type="submit" class="btn btn-primary">Finalizar Registro</button>
    <button type="button" class="btn btn-secondary cancel-button" onclick="window.location.href='<%=request.getContextPath()%>/ServletRegistroUsuario?action=regresar'">Cancelar</button>
  </form>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
