<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 8/06/2023
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="trabajadorSession" type="admin.Beans.Trabajadores" scope="session" class="admin.Beans.Trabajadores"/>
<header class="header-area header-sticky">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <nav class="main-nav">
          <!-- ***** Logo Start ***** -->
          <a href="index.html" class="logo">
            <img src="resources/assets/images/logo.png" alt="" style="width: 65px;">
          </a>
          <!-- ***** Logo End ***** -->
          <!-- ***** Menu Start ***** -->
          <ul class="nav">
            <li><a class="<%=request.getParameter("page").equals("listaJuegos")? "active": "" %>" href="<%=request.getContextPath()%>/mainservlet">Lista de juegos</a></li>
            <% if(trabajadorSession.getIdTrabajador() == 0) {%>
            <li><a href="<%=request.getContextPath()%>/loginServlet">Inicia sesión</a></li>
            <!-- <li><a href="contact.html">Contacto</a></li>-->
            <%} else {%>
            <li><a class="<%=request.getParameter("page").equals("solicitudes")? "active": "" %>" href="<%=request.getContextPath()%>/mainservlet?action=solicitudes">Solicitudes</a></li>
            <li><a class="<%=request.getParameter("page").equals("propuestas")? "active": "" %>" href="<%=request.getContextPath()%>/mainservlet?action=propuestos">Propuestas</a></li>
            <li><a class="<%=request.getParameter("page").equals("reservas")? "active": "" %>" href="<%=request.getContextPath()%>/mainservlet?action=reservados">Reservas</a></li>
            <li><a class="<%=request.getParameter("page").equals("perfil")? "active": "" %>" href="<%=request.getContextPath()%>/mainservlet?action=perfil&idTrabajador=<%=trabajadorSession.getIdTrabajador()%>">Perfil<img src="<%=request.getContextPath()%>/assets/images/profile-header.jpg" style="border-radius: 50%;
                margin-left: 5px; max-width: 30%;" alt=""></a></li>
            <%}%>
          </ul>
          <a class='menu-trigger'>
            <span>Menu</span>
          </a>
          <!-- ***** Menu End ***** -->
        </nav>
      </div>
    </div>
  </div>
</header>
