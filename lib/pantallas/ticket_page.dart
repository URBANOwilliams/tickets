import 'package:flutter/material.dart';
import 'home_page.dart';

class TicketPage extends StatelessWidget {
  final String descripcion;

  const TicketPage({super.key, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    final String ticketId = "INC00001"; // Puedes generar un ID dinámico si lo deseas
    final String ticketDate = DateTime.now().toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generar Ticket"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ticket de Incidencia",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 30),

            // Tarjeta con información del ticket
            Card(
              elevation: 5,
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ticket ID: $ticketId",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Fecha: $ticketDate",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Tu incidencia se ha creado correctamente",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      descripcion,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false, // 🔁 Elimina todo el stack anterior
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Regresar al Home"),
            ),
          ],
        ),
      ),
    );
  }
}
