<!DOCTYPE html>
<html>
<head>
  <title>Registro de Usuario</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    .navbar {
      background-color: blue;
      color: white;
    }

    .navbar-brand {
      font-weight: bold;
    }

    .container {
      max-width: 800px;
      margin: 20px auto;
    }
  </style>
</head>
<body>
<nav class="navbar">
  <div class="container">
    <span class="navbar-brand">Nombre de Usuario</span>
    <span class="navbar-text">Categor�a: Gold</span>
    <button class="btn btn-light ml-auto">Cerrar sesi�n</button>
  </div>
</nav>

<div class="container">
  <h2>Registro de Usuario</h2>
  <form>
    <div class="form-group">
      <label for="nombre">Nombre</label>
      <input type="text" id="nombre" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="apellido">Apellido</label>
      <input type="text" id="apellido" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="edad">Edad</label>
      <input type="number" id="edad" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="codigo-pucp">C�digo PUCP</label>
      <input type="text" id="codigo-pucp" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="correo">Correo Electr�nico</label>
      <input type="email" id="correo" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="especialidad">Especialidad</label>
      <select id="especialidad" class="form-control" required>
        <option value="">Seleccione una opci�n</option>
        <option value="Ing. Telecomunicaciones">Ing. Telecomunicaciones</option>
        <option value="Ing. Industrial">Ing. Industrial</option>
      </select>
    </div>
    <div class="form-group">
      <label for="contrasena">Contrase�a</label>
      <input type="password" id="contrasena" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="confirmar-contrasena">Confirmar Contrase�a</label>
      <input type="password" id="confirmar-contrasena" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Finalizar Registro</button>
    <button type="button" class="btn btn-secondary">Cancelar</button>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
