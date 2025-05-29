<%--
  Created by IntelliJ IDEA.
  User: ALan Velasco
  Date: 11/5/2025
  Time: 19:38
  Descrpcion: formulario
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulario con Ejercicios Matemáticos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .form-section, .exercises-section {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        label { display: block; margin-top: 10px; }
        input, textarea, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            margin-top: 15px;
        }
        .error { color: red; }
        .success { color: green; }
        .exercise { margin-bottom: 15px; padding: 10px; background-color: #f9f9f9; }
    </style>
</head>
<body>
<div class="container">
    <h1>Formulario con Ejercicios Matemáticos</h1>

        <% if (request.getAttribute("error") != null) { %>
    <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>

        <% if (request.getAttribute("exito") != null) { %>
    <p class="success"><%= request.getAttribute("exito") %></p>
        <% } %>

    <div class="form-section">
        <h2>Datos Personales</h2>
        <form action="formulario" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required
                   value="<%= request.getAttribute("nombre") != null ? request.getAttribute("nombre") : "" %>">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">

            <button type="submit">Enviar</button>
        </form>
    </div>

    <div class="exercises-section">
        <h2>Ejercicios de Lógica Matemática</h2>

        <div class="exercise">
            <h3>1. Números Primos</h3>
            <form action="formulario" method="post">
                <input type="hidden" name="ejercicio" value="primos">
                <label for="numero">Verificar si un número es primo:</label>
                <input type="number" id="numero" name="numero" min="2" required>
                <button type="submit">Verificar</button>
                <% if ("primos".equals(request.getAttribute("ejercicio")) && request.getAttribute("resultado") != null) { %>
                <p>Resultado: <%= request.getAttribute("resultado") %></p>
                <% } %>
            </form>
        </div>

        <div class="exercise">
            <h3>2. Secuencia Fibonacci</h3>
            <form action="formulario" method="post">
                <input type="hidden" name="ejercicio" value="fibonacci">
                <label for="limite">Generar secuencia hasta:</label>
                <input type="number" id="limite" name="limite" min="1" max="20" required>
                <button type="submit">Generar</button>
                <% if ("fibonacci".equals(request.getAttribute("ejercicio"))) { %>
                <% if (request.getAttribute("resultado") != null) { %>
                <p>Secuencia: <%= request.getAttribute("resultado") %></p>
                <% } %>
                <% if (request.getAttribute("errorEjercicio") != null) { %>
                <p class="error"><%= request.getAttribute("errorEjercicio") %></p>
                <% } %>
                <% } %>
            </form>
        </div>

        <div class="exercise">
            <h3>3. Factorial de un número</h3>
            <form action="formulario" method="post">
                <input type="hidden" name="ejercicio" value="factorial">
                <label for="numFactorial">Calcular factorial de:</label>
                <input type="number" id="numFactorial" name="numFactorial" min="0" max="20" required>
                <button type="submit">Calcular</button>
                <% if ("factorial".equals(request.getAttribute("ejercicio"))) { %>
                <% if (request.getAttribute("resultado") != null) { %>
                <p>Factorial: <%= request.getAttribute("resultado") %></p>
                <% } %>
                <% } %>
            </form>
        </div>
    </div>
</body>
</html>