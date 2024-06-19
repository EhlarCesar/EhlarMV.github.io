import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:myapp/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          _card(context),
        ],
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Center(
        child: Card(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: Container(
        height: 365,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent.withOpacity(0.5),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: contentCard(context),
        ),
      ),
    ));
  }

  Widget contentCard(context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.white54,
            size: 50,
          ),
          const SizedBox(height: 20),
          const Text(
            "Bienvenido a Streaming",
            style: TextStyle(color: Colors.white54, fontSize: 20),
          ),
          _textFieldUser(),
          _textFieldPass(),
          const SizedBox(height: 40),
          _botonLogin(context)
        ],
      ),
    );
  }

  Widget _textFieldPass() {
    return TextFormField(
      controller: passController,
      style: const TextStyle(color: Colors.white54),
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        labelStyle:
            const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.541)),
        hintStyle: const TextStyle(color: Colors.white54),
        hintText: "ingresa tu contraseña",
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white54,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "La contraseña no puede estar vacía";
        } else if (value.length < 8) {
          return "La contraseña debe tener al menos 8 caracteres";
        } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return "La contraseña debe contener al menos una letra mayúscula";
        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
          return "La contraseña debe contener al menos un número";
        } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          return "La contraseña debe contener al menos un carácter especial";
        }
        return null;
      },
    );
  }

  Widget _textFieldUser() {
    return TextFormField(
      validator: (value) {
        if (!GetUtils.isEmail(value ?? "")) {
          return "Ingrese un correo válido";
        }
        return null;
      },
      controller: userController,
      style: const TextStyle(color: Colors.white54),
      decoration: const InputDecoration(
        labelText: 'Usuario',
        labelStyle: TextStyle(color: Colors.white54),
        hintStyle: TextStyle(color: Colors.white54),
        hintText: "ingresa tu usuario",
      ),
    );
  }

  Widget _botonLogin(context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        minimumSize: WidgetStateProperty.all<Size>(const Size(400, 50)),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          onEnterLogin(context);
        }
      },
      child: const Text(
        'Entrar',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void onEnterLogin(context) async {
    try {
      // ignore: unused_local_variable
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userController.text,
        password: passController.text,
      );

      Get.to(const HomePage());
    } on FirebaseAuthException {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error de inicio de sesión'),
          content: const Text(
              'Por favor, verifica tus credenciales e inténtalo de nuevo.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }

  Widget _background() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 20, 106, 176),
              Color.fromARGB(255, 9, 3, 29),
            ],
          ),
        ),
      ),
    );
  }
}
