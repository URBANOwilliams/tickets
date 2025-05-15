import 'package:flutter/material.dart';
import 'ticket_page.dart';

class CrearIncidenciaPage extends StatefulWidget {
  const CrearIncidenciaPage({Key? key}) : super(key: key);

  @override
  _CrearIncidenciaPageState createState() => _CrearIncidenciaPageState();
}

class _CrearIncidenciaPageState extends State<CrearIncidenciaPage> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _tiendaController = TextEditingController();
  final _areaController = TextEditingController();
  final _nombreController = TextEditingController();
  final _celularController = TextEditingController();
  final _descripcionController = TextEditingController();

  // Dropdowns
  String? _tipoRequerimiento;
  String? _prioridad;

  final List<String> _tiposRequerimiento = [
    'Soporte Técnico',
    'Mantenimiento',
    'Sistemas',
    'Otro',
  ];

  final List<String> _nivelesPrioridad = ['Alta', 'Media', 'Baja'];

  void _generarTicket() {
    if (_formKey.currentState!.validate()) {
      final descripcion = '''
🛒 Tienda: ${_tiendaController.text}
🏢 Área: ${_areaController.text}
👤 Nombre: ${_nombreController.text}
📞 Celular: ${_celularController.text}
📌 Tipo de requerimiento: $_tipoRequerimiento
⚠️ Prioridad: $_prioridad
📝 Descripción: ${_descripcionController.text}
''';

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TicketPage(descripcion: descripcion),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Incidencia"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_tiendaController, 'Tienda'),
              _buildTextField(_areaController, 'Área'),
              _buildTextField(_nombreController, 'Nombre y Apellido'),
              _buildTextField(
                _celularController,
                'Celular',
                keyboardType: TextInputType.phone,
              ),
              _buildDropdown(
                label: 'Tipo de Requerimiento',
                value: _tipoRequerimiento,
                items: _tiposRequerimiento,
                onChanged: (value) => setState(() => _tipoRequerimiento = value),
              ),
              _buildDropdown(
                label: 'Prioridad',
                value: _prioridad,
                items: _nivelesPrioridad,
                onChanged: (value) => setState(() => _prioridad = value),
              ),
              _buildTextField(
                _descripcionController,
                'Descripción de la Incidencia',
                maxLines: 4,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _generarTicket,
                child: const Text("Generar Ticket"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: (value) =>
            value == null || value.isEmpty ? 'Este campo es obligatorio' : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
        validator: (value) =>
            value == null ? 'Por favor seleccione una opción' : null,
      ),
    );
  }
}
