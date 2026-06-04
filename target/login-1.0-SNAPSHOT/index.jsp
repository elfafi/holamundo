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

    // Obtener y remover el mensaje de error
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
    <title>Iniciar Sesión - NIKE</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="split-container">
        <!-- Left Panel: Brand Aesthetic Image -->
        <div class="split-image-panel">
            <div class="split-image-bg"></div>
            <div class="split-image-overlay"></div>
            <div class="split-image-content">
                <!-- Nike Swoosh SVG Logo -->
                <svg class="brand-logo-svg" viewBox="0 0 100 38" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M98 4C73 17 38 33 12 37.5 4 38.8 0 36 1 31c1-5 6-9.5 14-12.5L98 4Z"/>
                </svg>
                <h1 class="brand-title">NIKE</h1>
                <p class="brand-subtitle">ATHLETICS DEPT.</p>
            </div>
        </div>

        <!-- Right Panel: Login Form -->
        <div class="split-form-panel">
            <div class="form-wrapper">
                <div class="login-card <%= (errorMsg != null) ? "shake" : "" %>">
                    <div class="form-header">
                        <div class="form-wordmark">NIKE</div>
                        <h2 class="form-title">Portal de Acceso</h2>
                        <p class="form-subtitle">Introduce tus credenciales administrativas.</p>
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
                                <%= errorMsg %>
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

                    <!-- Formulario de Login -->
                    <form action="login_process.jsp" method="POST">
                        <div class="form-group">
                            <label for="username" class="form-label">Usuario</label>
                            <input type="text" id="username" name="username" class="form-input" placeholder="Ingresa tu usuario" required autocomplete="off" <%= (intentos >= 3) ? "disabled" : "" %>>
                        </div>

                        <div class="form-group">
                            <label for="password" class="form-label">Contraseña</label>
                            <input type="password" id="password" name="password" class="form-input" placeholder="Ingresa tu contraseña" required <%= (intentos >= 3) ? "disabled" : "" %>>
                            <% if (intentos > 0 && intentos < 3) { %>
                                <div class="attempts-badge">
                                    Intentos restantes: <%= 3 - intentos %>
                                </div>
                            <% } %>
                        </div>

                        <button type="submit" class="btn" <%= (intentos >= 3) ? "disabled" : "" %>>
                            <span>Ingresar</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
