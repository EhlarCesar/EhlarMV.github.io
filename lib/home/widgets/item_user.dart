import 'package:flutter/material.dart';

class ItemUserWidget extends StatelessWidget {
  final String nombre;

  const ItemUserWidget({
    super.key,
    required this.nombre,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              nombre,
              style: const TextStyle(color: Colors.white54, fontSize: 16),
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(height: 13),
        const Divider(thickness: 0.5),
        const SizedBox(height: 13),
      ],
    );
  }
}
