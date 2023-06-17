<!DOCTYPE html>
<html>
<head>
  <title>Añadir Viaje</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
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
    <span class="navbar-text">Categoría: Gold</span>
    <button class="btn btn-light ml-auto">Cerrar sesión</button>
  </div>
</nav>

<div class="container">
  <h2>Añadir Nuevo Viaje</h2>
  <form>
    <div class="form-group">
      <label for="ciudad-origen">Ciudad Origen</label>
      <input type="text" id="ciudad-origen" class="form-control" value="Ciudad Origen 1" readonly>
    </div>
    <div class="form-group">
      <label for="ciudad-destino">Ciudad Destino</label>
      <select id="ciudad-destino" class="form-control" required>
        <option value="">Seleccione una opción</option>
        <option value="Chiclayo">Chiclayo</option>
        <option value="Arequipa">Arequipa</option>
      </select>
    </div>
    <div class="form-group">
      <label for="fecha-viaje">Fecha de Viaje</label>
      <input type="text" id="fecha-viaje" class="form-control" placeholder="Selecciona una fecha" required>
    </div>
    <div class="form-group">
      <label for="fecha-reserva">Fecha de Reserva</label>
      <input type="text" id="fecha-reserva" class="form-control" value="2023-06-16" readonly>
    </div>
    <div class="form-group">
      <label for="empresa-seguros">Empresa de Seguros</label>
      <select id="empresa-seguros" class="form-control" required>
        <option value="">Seleccione una opción</option>
        <option value="rimac">Rimac</option>
        <option value="pacifico">Pacífico</option>
      </select>
    </div>
    <div class="form-group">
      <label for="cantidad-boletos">Cantidad de Boletos</label>
      <input type="number" id="cantidad-boletos" class="form-control" required>
    </div>
    <div class="form-group">
      <label for="valor-total">Valor Total</label>
      <input type="text" id="valor-total" class="form-control" readonly>
    </div>
    <button type="submit" class="btn btn-primary">Guardar</button>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
  $(document).ready(function() {
    $('#fecha-viaje').datepicker({
      format: 'yyyy-mm-dd',
      startDate: '+1d',
      autoclose: true
    });

    $('#cantidad-boletos').on('input', function() {
      var cantidadBoletos = $(this).val();
      var valorViaje = 100.00; // Valor del viaje por boleto

      var valorTotal = cantidadBoletos * valorViaje;
      $('#valor-total').val('$' + valorTotal.toFixed(2));
    });
  });
</script>
</body>
</html>
