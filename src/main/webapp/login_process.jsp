<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Solo permitir solicitudes POST para procesar el inicio de sesión
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Obtener los parámetros enviados por el formulario
    String usuarioInput = request.getParameter("username");
    String contrasenaInput = request.getParameter("password");

    // Verificar si el usuario ya está bloqueado antes de procesar
    Integer intentosObj = (Integer) session.getAttribute("intentos");
    int intentos = (intentosObj != null) ? intentosObj : 0;

    if (intentos >= 3) {
        session.setAttribute("error_msg", "Acceso denegado. Has superado el límite de intentos.");
        response.sendRedirect("index.jsp");
        return;
    }

    // Validar las credenciales
    if ("fabian".equals(usuarioInput) && "ingeniero".equals(contrasenaInput)) {
        // Credenciales correctas:
        // 1. Guardar el usuario en la sesión
        session.setAttribute("user", usuarioInput);
        
        // 2. Limpiar/Resetear el contador de intentos fallidos
        session.removeAttribute("intentos");
        
        // 3. Redirigir al panel de control (dashboard)
        response.sendRedirect("dashboard.jsp");
    } else {
        // Credenciales incorrectas:
        // 1. Incrementar el contador de intentos
        intentos++;
        session.setAttribute("intentos", intentos);
        
        // 2. Establecer el mensaje de error correspondiente
        if (intentos >= 3) {
            session.setAttribute("error_msg", "Has alcanzado el máximo de intentos. Sesión bloqueada.");
        } else {
            session.setAttribute("error_msg", "Usuario o contraseña incorrectos. Intentos restantes: " + (3 - intentos));
        }
        
        // 3. Redirigir de vuelta al formulario de login
        response.sendRedirect("index.jsp");
    }
%>
