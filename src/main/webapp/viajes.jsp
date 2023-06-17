<%@page import="charmander.Models.Beans.ViajesBeans" %>
<jsp:useBean id="listaViajes" type="java.util.ArrayList<charmander.Models.Beans.ViajesBeans>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Página de Viajes</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    .navbar {
      background-color: blue;
      color: white;
    }

    .navbar-brand {
      font-weight: bold;
    }

    .table-container {
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

<div class="container table-container">
  <h2>Tabla de Viajes</h2>
  <div class="form-group">
    <input type="text" id="buscador" class="form-control" placeholder="Buscar...">
  </div>
  <table id="tabla-viajes" class="table table-auto">
    <thead>
    <tr>
      <th>Identificador del Viaje</th>
      <th>Fecha de Reserva</th>
      <th>Ciudad Origen</th>
      <th>Ciudad Destino</th>
      <th>Empresa de Seguros</th>
      <th>Número de Boleto</th>
      <th>Costo Total</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <%for (ViajesBeans viajesbeans : listaViajes) {%>
    <tr>
      <th><%=viajesbeans.getIdentificadorViaje()%></th>
      <th><%=viajesbeans.getFechaReserva()%></th>
      <th><%=viajesbeans.getFechaViaje()%></th>
      <th><%=viajesbeans.getCiudadOrigen()%></th>
      <th><%=viajesbeans.getCiudadDestino()%></th>
      <th><%=viajesbeans.getNombreEmpresaSeguro()%></th>
      <th><%=viajesbeans.getNumeroBoletos()%></th>
      <th>$150.00</th>
      <th><button class="btn btn-primary btn-editar">Editar</button></th>
      <th><button class="btn btn-danger btn-eliminar">Eliminar</button></th>
    </tr>
    <%}%>
    </tbody>
  </table>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
  $(document).ready(function() {
    $('#buscador').on('keyup', function() {
      var value = $(this).val().toLowerCase();
      $('#tabla-viajes tbody tr').filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      });
    });
  });
</script>
</body>
</html>
