<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Si ya hay una sesión activa, redirigir al panel de control
    if (session.getAttribute("user") != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }

    // Obtener los intentos de inicio de sesión desde la sesión
    Integer intentosObj = (Integer) session.getAttribute("intentos");
    int intentos = (intentosObj != null) ? intentosObj : 0;

    // Obtener y remover el mensaje de error para que no se quede guardado permanentemente
    String errorMsg = (String) session.getAttribute("error_msg");
    session.removeAttribute("error_msg");

    // Mensaje de éxito al cerrar sesión
    String successMsg = (String) session.getAttribute("success_msg");
    session.removeAttribute("success_msg");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - Sistema de Usuarios</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <!-- Fondos con gradientes decorativos -->
    <div class="bg-gradient-wrapper">
        <div class="gradient-circle-1"></div>
        <div class="gradient-circle-2"></div>
    </div>

    <div class="login-container">
        <div class="login-card <%= (errorMsg != null) ? "shake" : "" %>">
            <div class="login-header">
                <div class="login-logo">
                    <!-- Icono SVG de Llave / Seguridad -->
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                    </svg>
                </div>
                <h1 class="login-title">Acceso al Sistema</h1>
                <p class="login-subtitle">Introduce tus credenciales para continuar</p>
            </div>

            <!-- Notificaciones de Alerta -->
            <% if (errorMsg != null) { %>
                <div class="alert alert-danger">
                    <span class="alert-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path>
                        </svg>
                    </span>
                    <div>
                        <strong>Error:</strong> <%= errorMsg %>
                    </div>
                </div>
            <% } %>

            <% if (successMsg != null) { %>
                <div class="alert alert-success">
                    <span class="alert-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </span>
                    <div>
                        <%= successMsg %>
                    </div>
                </div>
            <% } %>

            <!-- Si se alcanzan 3 intentos, mostrar bloqueo y deshabilitar el formulario -->
            <% if (intentos >= 3) { %>
                <div class="alert alert-danger" style="margin-bottom: 20px;">
                    <span class="alert-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                        </svg>
                    </span>
                    <div>
                        <strong>¡Acceso Bloqueado!</strong> Has alcanzado el máximo de 3 intentos permitidos. El acceso a esta sesión ha sido inhabilitado.
                    </div>
                </div>
            <% } %>

            <form action="login_process.jsp" method="POST">
                <div class="form-group">
                    <label for="username" class="form-label">Usuario</label>
                    <div class="input-wrapper">
                        <input type="text" id="username" name="username" class="form-input" placeholder="Ingresa tu usuario" required autocomplete="off" <%= (intentos >= 3) ? "disabled" : "" %>>
                        <span class="input-icon">
                            <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Contraseña</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" class="form-input" placeholder="Ingresa tu contraseña" required <%= (intentos >= 3) ? "disabled" : "" %>>
                        <span class="input-icon">
                            <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                            </svg>
                        </span>
                    </div>
                    <% if (intentos > 0 && intentos < 3) { %>
                        <div class="attempts-badge">
                            Intentos restantes: <%= 3 - intentos %>
                        </div>
                    <% } %>
                </div>

                <button type="submit" class="btn" <%= (intentos >= 3) ? "disabled" : "" %>>
                    <span>Ingresar</span>
                    <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                    </svg>
                </button>
            </form>
        </div>
    </div>
</body>
</html>
