<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ingreso</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/indexStyles.css">
</head>
<body>
<div class="login-form">
    <h1>Ingreso</h1>
    <img src="https://res.cloudinary.com/dktlpxew2/image/upload/v1721532022/images/LogoRestaurante_awr0vk.png" alt="LogoR&B">
    <form action="${pageContext.request.contextPath}/login" method="post">
        <label for="usuario">Usuario</label>
        <input type="text" id="usuario" name="usuario" placeholder="Usuario">
        <label for="contrasena">Contraseña</label>
        <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña">
        <input type="submit" value="Ingresar" id="ingresar"/>
    </form>
</div>
</body>
</html>