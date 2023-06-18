<%@page import="java.time.LocalDate" %>
<%@ page import="charmander.Models.Beans.ViajesBeans" %>
<%@ page import="charmander.Models.Beans.Ciudad" %>
<%@ page import="charmander.Models.Beans.Seguros" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean scope="request" id="viaje" type="charmander.Models.Beans.ViajesBeans"/>
<jsp:useBean scope="request" id="listaCiudades" type="java.util.ArrayList<charmander.Models.Beans.Ciudad>"/>
<jsp:useBean scope="request" id="listaSeguros" type="java.util.ArrayList<charmander.Models.Beans.Seguros>"/>
<jsp:useBean id="usuarioLog" scope="session" type="charmander.Models.Beans.Usuario"
             class="charmander.Models.Beans.Usuario"/>
<!DOCTYPE html>
<html>
<head>
  <title>Añadir Viaje</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
  <style>
    body {
      background-image: url("resources/assets/images/bora.jpg");
      background-repeat: no-repeat;
      background-size: cover;
    }
    .navbar {
      background-color: blue;
      color: white;
    }

    .navbar-brand {
      font-weight: bold;
    }

    .table-container {
      background-color: rgba(255, 255, 255, 0.7);
      padding: 20px;
      margin: 20px auto;
      max-width: 1000px;
    }
  </style>
</head>
<body>
<nav class="navbar" style="background-color:
  <% if (usuarioLog.getCostoTotal() >= 10000) { %>black<% }
     else if (usuarioLog.getCostoTotal() >= 1000) { %>yellowgreen<% }
     else if (usuarioLog.getCostoTotal() >= 100) { %>silver<% }
     else if (usuarioLog.getCostoTotal() < 100) { %>blue<% } %>">
  <div class="container-fluid">
    <span class="navbar-brand">
      <% if (usuarioLog.getIdUsuario() > 0) { //esta logueado %>
          <span><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%></span>
      <% } %>
    </span>
    <span class="navbar-text">
      <% if (usuarioLog.getCostoTotal() >= 10000) { %>Platinum<% }
    else if (usuarioLog.getCostoTotal() >= 1000) { %>Gold<% }
    else if (usuarioLog.getCostoTotal() >= 100) { %>Silver<% }
    else if (usuarioLog.getCostoTotal() < 100) { %>Regular<% } %>
    </span>
    <div class="ml-auto">
      <a class="btn btn-primary" href="<%=request.getContextPath()%>/login?action=logout">Cerrar sesión</a>
    </div>
  </div>
</nav>

<div class="container table-container">
  <h2>Editar Viaje</h2>
  <form method="POST" action="ServletViajes">
    <div class="form-group">
      <input type="hidden" name="viaje-id" value="<%= viaje.getIdentificadorViaje()%>"/>
      <label for="ciudad-origen">Ciudad Origen</label>
      <input type="text" id="ciudad-origen" class="form-control" value="Lima" name="ciudad-origen"readonly>
    </div>
    <div class="form-group">
      <label for="ciudad-destino">Ciudad Destino</label>
      <select id="ciudad-destino" name="ciudad-destino" class="form-control" required>
        <option value=""><%=viaje.getCiudadDestino().getNombreCiudad()%></option>
        <% for (Ciudad ciudad : listaCiudades) {%>
        <option value="<%=ciudad.getIdciudades()%>"><%=ciudad.getNombreCiudad()%></option>
        <% }%>
      </select>
    </div>
    <div class="form-group">
      <label for="fecha-viaje">Fecha de Viaje</label>
      <input type="text" id="fecha-viaje" class="form-control" placeholder="<%=viaje.getFechaViaje()%>" name="fecha-viaje" required>
    </div>
    <div class="form-group">
      <label for="fecha-reserva">Fecha de Reserva</label>
      <input type="text" id="fecha-reserva" class="form-control" value="<%=LocalDate.now()%>" name="fecha-reserva" readonly>
    </div>
    <div class="form-group">
      <label for="empresa-seguros">Empresa de Seguros</label>
      <select id="empresa-seguros" class="form-control" name="empresa-seguros" required>
        <option value=""><%=viaje.getNombreEmpresaSeguro()%></option>
        <% for (Seguros seguros : listaSeguros) {%>
        <option value="<%=seguros.getNombreEmpresa()%>"><%=seguros.getNombreEmpresa()%></option>
        <% }%>
      </select>    </div>
    <div class="form-group">
      <label for="cantidad-boletos">Cantidad de Boletos</label>
      <input type="number" id="cantidad-boletos" name="cantidad-boletos" class="form-control" name="cantidad-boletos" placeholder="<%=viaje.getNumeroBoletos()%>" required min="0">
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
