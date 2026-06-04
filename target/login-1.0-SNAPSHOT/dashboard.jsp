<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    // Verificar si el usuario ha iniciado sesión
    String user = (String) session.getAttribute("user");
    if (user == null) {
        session.setAttribute("error_msg", "Acceso denegado. Por favor, inicia sesión.");
        response.sendRedirect("index.jsp");
        return;
    }

    // Formatear tiempos de la sesión
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String horaCreacion = sdf.format(new Date(session.getCreationTime()));
    String horaUltimoAcceso = sdf.format(new Date(session.getLastAccessedTime()));
    String fechaActual = sdf.format(new Date());
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Control - Sistema de Usuarios</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar Navigation -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-logo">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                    </svg>
                </div>
                <span class="sidebar-brand-name">Sistema Web</span>
            </div>

            <div class="sidebar-content">
                <!-- Sección Gestión -->
                <div class="menu-section">
                    <h2 class="menu-section-title">Gestión</h2>
                    <ul class="menu-list">
                        <li class="menu-item">
                            <a href="#" class="menu-link active">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
                                <span>Usuarios</span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                                <span>Clientes</span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                                <span>Proveedores</span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path></svg>
                                <span>Productos y Servicios</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Sección Venta -->
                <div class="menu-section">
                    <h2 class="menu-section-title">Ventas</h2>
                    <ul class="menu-list">
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path></svg>
                                <span>Nueva Venta</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Sección Reportería -->
                <div class="menu-section">
                    <h2 class="menu-section-title">Reportería</h2>
                    <ul class="menu-list">
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 002 2h2a2 2 0 002-2z"></path></svg>
                                <span>Reportes Generales</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Sección Actividades de Investigación -->
                <div class="menu-section">
                    <h2 class="menu-section-title">Actividades de Investigación</h2>
                    <ul class="menu-list">
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"></path></svg>
                                <span>Actividad 1</span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"></path></svg>
                                <span>Actividad 2</span>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="#" class="menu-link">
                                <svg class="menu-link-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"></path></svg>
                                <span>Actividad 3</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Footer con datos del usuario e inicio de cierre de sesión -->
            <div class="sidebar-footer">
                <div class="user-profile">
                    <div class="user-avatar">
                        <%= user.substring(0, 1).toUpperCase() %>
                    </div>
                    <div class="user-info">
                        <div class="user-name"><%= user %></div>
                        <div class="user-role">Administrador</div>
                    </div>
                </div>
                <a href="logout.jsp" class="btn-logout">
                    <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                    </svg>
                    <span>Cerrar Sesión</span>
                </a>
            </div>
        </aside>

        <!-- Main Workspace Area -->
        <main class="main-content">
            <header class="header">
                <h1 class="header-title">Panel Principal</h1>
                <div class="header-meta">
                    <span>Fecha: <%= fechaActual %></span>
                    <div class="status-indicator">
                        <span class="status-dot"></span>
                        <span>Sesión Activa</span>
                    </div>
                </div>
            </header>

            <div class="content-body">
                <!-- Welcome Banner -->
                <div class="welcome-banner">
                    <h2 class="welcome-title">¡Bienvenido de vuelta, <%= user.substring(0,1).toUpperCase() + user.substring(1) %>!</h2>
                    <p class="welcome-text">Has iniciado sesión correctamente como administrador del sistema. Aquí puedes ver y gestionar la información relacionada con tu cuenta y los módulos del proyecto.</p>
                </div>

                <!-- Stats Grid -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-header">
                            <span class="stat-title">Estado del Servidor</span>
                            <span class="stat-icon">
                                <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z"></path>
                                </svg>
                            </span>
                        </div>
                        <span class="stat-value">Tomcat</span>
                        <span class="stat-desc">Contenedor de Servlets Activo</span>
                    </div>

                    <div class="stat-card">
                        <div class="stat-header">
                            <span class="stat-title">Intentos Registrados</span>
                            <span class="stat-icon" style="background-color: rgba(16, 185, 129, 0.08); color: var(--color-success);">
                                <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                                </svg>
                            </span>
                        </div>
                        <span class="stat-value">1° Intento</span>
                        <span class="stat-desc">Acceso concedido exitosamente</span>
                    </div>

                    <div class="stat-card">
                        <div class="stat-header">
                            <span class="stat-title">Nivel de Acceso</span>
                            <span class="stat-icon" style="background-color: rgba(99, 102, 241, 0.08); color: #818cf8;">
                                <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                                </svg>
                            </span>
                        </div>
                        <span class="stat-value">Admin</span>
                        <span class="stat-desc">Privilegios totales del sistema</span>
                    </div>
                </div>

                <!-- Session Metadata Table -->
                <div class="data-section">
                    <h3 class="data-section-title">Detalles Técnicos de la Sesión Activa</h3>
                    <div class="info-table-wrapper">
                        <table class="info-table">
                            <thead>
                                <tr>
                                    <th>Propiedad</th>
                                    <th>Valor / Detalle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Usuario Autenticado</strong></td>
                                    <td><span class="code-badge"><%= user %></span></td>
                                </tr>
                                <tr>
                                    <td><strong>ID de Sesión (HTTP Session ID)</strong></td>
                                    <td><span class="code-badge"><%= session.getId() %></span></td>
                                </tr>
                                <tr>
                                    <td><strong>Hora de Creación</strong></td>
                                    <td><%= horaCreacion %></td>
                                </tr>
                                <tr>
                                    <td><strong>Último Acceso</strong></td>
                                    <td><%= horaUltimoAcceso %></td>
                                </tr>
                                <tr>
                                    <td><strong>Servidor de Despliegue</strong></td>
                                    <td><%= application.getServerInfo() %></td>
                                </tr>
                                <tr>
                                    <td><strong>Versión de Servlet API</strong></td>
                                    <td><%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
