import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          Text('Menu'),
          Text('Servicios'),
          Text('Usuarios'),
          Text('Configuracion'),
        ],
      ),
    );
  }
}
