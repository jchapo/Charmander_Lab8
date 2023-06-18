<%@page import="charmander.Models.Beans.ViajesBeans" %>
<jsp:useBean id="listaViajes" type="java.util.ArrayList<charmander.Models.Beans.ViajesBeans>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="charmander.Models.Beans.Usuario"
             class="charmander.Models.Beans.Usuario"/>
<!DOCTYPE html>
<html>
<head>
  <title>Página de Viajes</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
    background-image: url("resources/assets/images/manu.jpg");
    background-repeat: no-repeat;
    background-size: cover;
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
  <h2>Tabla de Viajes</h2>
  <br>
  <div class="col-md-5 col-lg-4 ms-auto my-auto text-md-end">
    <a href="<%= request.getContextPath()%>/ServletViajes?action=agregar" class="btn btn-success">Agregar
      nuevo viaje</a>
  </div>
  <br>
  <table id="tabla-viajes" class="table table-auto">
    <thead>
    <tr>
      <th>Identificador del Viaje</th>
      <th>Fecha de Reserva</th>
      <th>Fecha de Viaje</th>
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
      <th><%=viajesbeans.getCiudadOrigen().getNombreCiudad()%></th>
      <th><%=viajesbeans.getCiudadDestino().getNombreCiudad()%></th>
      <th><%=viajesbeans.getNombreEmpresaSeguro()%></th>
      <th><%=viajesbeans.getNumeroBoletos()%></th>
      <th><%=viajesbeans.getNumeroBoletos()*viajesbeans.getPrecioDestino()%></th>
      <th><a href="<%=request.getContextPath()%>/ServletViajes?action=editar&id=<%= viajesbeans.getIdentificadorViaje()%>"
         type="button" class="btn btn-primary"> Editar
        <i class="bi bi-pencil-square"></i></a></th>
      <td>
        <a onclick="return confirm('¿Estas seguro de borrar?');"
           href="<%=request.getContextPath()%>/EmployeeServlet?action=editar&id=<%= viajesbeans.getIdentificadorViaje()%>"
           type="button" class="btn btn-danger"> Eliminar
          <i class="bi bi-trash"></i>
        </a>
      </td>
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
