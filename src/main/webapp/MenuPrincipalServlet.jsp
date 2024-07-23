<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<html>
<head>
    <title>Menú Principal</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/menuPrincipalStyle.css">
</head>
<body>
    <%
        if (session.getAttribute("nombre_usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        String nombreUsuario = (String) session.getAttribute("nombre_usuario");
    %>
<div class="container">
    <div class="menu-content">
      <h1>Menú Principal</h1>
      <img src="https://res.cloudinary.com/dktlpxew2/image/upload/v1721532022/images/LogoRestaurante_awr0vk.png" alt="LogoR&B">
      <p>¿Qué deseas hacer <%= nombreUsuario != null ? nombreUsuario : "usuario" %>?</p>
      <div class="menu-buttons">
        <input type="submit" value="Pedidos" id="pedidos"/>
        <input type="submit" value="Inventario" id="inventario"/>
        <input type="submit" value="Usuarios" id="usuarios"/>
      </div>
      <p><a class="btn-exit" href="index.html">Salir</a></p>
    </div>
</div>
</body>
</html>
