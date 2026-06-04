<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalida la sesión actual del usuario
    session.invalidate();

    // Inicia una sesión nueva y vacía para almacenar el mensaje de éxito del logout
    HttpSession nuevaSesion = request.getSession(true);
    nuevaSesion.setAttribute("success_msg", "Has cerrado sesión correctamente. ¡Vuelve pronto!");

    // Redirige al formulario de login
    response.sendRedirect("index.jsp");
%>
