import 'package:flutter/material.dart';

class Mysuds extends StatefulWidget {
  const Mysuds({super.key});

  @override
  State<Mysuds> createState() => _MysudsState();
}

class _MysudsState extends State<Mysuds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 21, 96, 156),
        title: const Text("buscador"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(color: Colors.blue, 
              child: const Text(
                "Bienvenido streming",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _botonLogin(context),
          _background()
        ],
      ),
    );
  }
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
      minimumSize: WidgetStateProperty.all<Size>(const Size(20, 30)),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
      ),
    ),
    onPressed: () {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1058925261.
//        void onEnterLogin(context);
    },
    child: const Text(
      'Entrar',
      style: TextStyle(color: Color.fromARGB(255, 9, 32, 59)),
    ),
  );
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