import 'package:flutter/material.dart';

// Modelo de ticket
class Ticket {
  final String id;
  final String fecha;
  final String estado;

  Ticket({required this.id, required this.fecha, required this.estado});
}

class MisTicketsPage extends StatelessWidget {
  const MisTicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista simulada de tickets
    final List<Ticket> tickets = [
      Ticket(id: "INC00001", fecha: "2025-05-14", estado: "En proceso"),
      Ticket(id: "INC00002", fecha: "2025-05-13", estado: "Resuelto"),
      Ticket(id: "INC00003", fecha: "2025-05-12", estado: "Pendiente"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Tickets"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          Color estadoColor;

          switch (ticket.estado) {
            case "Resuelto":
              estadoColor = Colors.green;
              break;
            case "En proceso":
              estadoColor = Colors.orange;
              break;
            case "Pendiente":
            default:
              estadoColor = Colors.redAccent;
              break;
          }

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ticket ID: ${ticket.id}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("Fecha: ${ticket.fecha}", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text("Estado:", style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      Text(
                        ticket.estado,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: estadoColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
