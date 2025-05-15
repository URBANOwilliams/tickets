import 'package:flutter/material.dart';
//import 'ticket_page.dart';
import 'mis_tickets_page.dart';
import 'crear_incidencia_page.dart'; // <--- asegúrate de importar esta

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido a Probela Profesional"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "¡Hola, Usuario!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Bienvenido a la página principal de Probela Profesional.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // ✅ Botón para ir a Crear Incidencia Page (NO TicketPage directamente)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CrearIncidenciaPage()),
                  );
                },
                child: const Text("Generar Ticket"),
              ),
              const SizedBox(height: 20),

              // Botón para ver Mis Tickets
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MisTicketsPage()),
                  );
                },
                child: const Text("Mis tickets"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
