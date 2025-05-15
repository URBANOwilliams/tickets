import 'package:flutter/material.dart';
import 'home_page.dart';
//import 'ticket_page.dart
import 'package:proyecto/componentes/my_button.dart';
import 'package:proyecto/componentes/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    String user = userController.text.trim();
    String pass = passwordController.text.trim();

    // Si las credenciales son correctas
    if (user == "admin" && pass == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showAlert("Credenciales Incorrectas");
    }
  }

  void showAlert(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'imagenes/logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 15),
                Text(
                  "Probela Profesional",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  hint: "Usuario",
                  obscureText: false,
                  controller: userController,
                ),
                const SizedBox(height: 15),
                MyTextField(
                  hint: "Contraseña",
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "¿Olvidó su contraseña?",
                    style: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(onTap: login),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
