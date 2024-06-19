import 'package:flutter/material.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("usuarios"),

      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: "Ingrese Usuario",

            ),
          ),
          ElevatedButton(onPressed: (){}, child: const Text("Agregar"))

        ],
      ),
    );
  }
}