package global;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;


//path
@WebServlet("/formulario")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ejercicio = request.getParameter("ejercicio");

        if (ejercicio != null) {
            procesarEjercicio(request, ejercicio);
        } else {
            procesarFormulario(request);
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private void procesarFormulario(HttpServletRequest request) {
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");

        if (nombre == null || nombre.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {

            request.setAttribute("error", "Todos los campos son obligatorios");
            request.setAttribute("nombre", nombre);
            request.setAttribute("email", email);
        } else {
            request.setAttribute("exito", "¡Datos enviados correctamente!");
            request.setAttribute("nombre", nombre);
            request.setAttribute("email", email);
        }
    }

    private void procesarEjercicio(HttpServletRequest request, String ejercicio) {
        try {
            switch (ejercicio) {
                case "primos":
                    int numero = Integer.parseInt(request.getParameter("numero"));
                    request.setAttribute("resultado", esPrimo(numero) ?
                            numero + " es un número primo" : numero + " no es un número primo");
                    break;

                case "fibonacci":
                    int limite = Integer.parseInt(request.getParameter("limite"));
                    if (limite < 1 || limite > 20) {
                        request.setAttribute("errorEjercicio", "El límite debe estar entre 1 y 20");
                    } else {
                        request.setAttribute("resultado", generarFibonacci(limite));
                    }
                    break;

                case "factorial":
                    int numFactorial = Integer.parseInt(request.getParameter("numFactorial"));
                    if (numFactorial < 0 || numFactorial > 20) {
                        request.setAttribute("errorEjercicio", "El número debe estar entre 0 y 20");
                    } else {
                        request.setAttribute("resultado", calcularFactorial(numFactorial));
                    }
                    break;
            }
            request.setAttribute("ejercicio", ejercicio);
        } catch (NumberFormatException e) {
            request.setAttribute("errorEjercicio", "Por favor ingrese un número válido");
        }
    }

    // Métodos de lógica matemática

    private boolean esPrimo(int n) {
        if (n <= 1) return false;
        if (n == 2) return true;
        if (n % 2 == 0) return false;
        for (int i = 3; i * i <= n; i += 2) {
            if (n % i == 0) return false;
        }
        return true;
    }

    private List<Integer> generarFibonacci(int n) {
        List<Integer> secuencia = new ArrayList<>();
        if (n >= 1) secuencia.add(0);
        if (n >= 2) secuencia.add(1);

        for (int i = 2; i < n; i++) {
            secuencia.add(secuencia.get(i-1) + secuencia.get(i-2));
        }
        return secuencia;
    }

    private long calcularFactorial(int n) {
        if (n == 0) return 1;
        long factorial = 1;
        for (int i = 1; i <= n; i++) {
            factorial *= i;
        }
        return factorial;
    }
}