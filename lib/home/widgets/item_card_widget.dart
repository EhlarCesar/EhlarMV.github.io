import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String title;

  final int total;

  const ItemCardWidget({
    super.key,
    required this.title,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 6, 16, 39),
      child: SizedBox(
        height: 160,
        width: 220,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "$total",
                    style: const TextStyle(color: Colors.white54, fontSize: 32),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 51, 46, 122),
                        height: 2,
                        width: 200,
                      ),
                      Container(
                        color: const Color.fromARGB(255, 29, 24, 160),
                        height: 2,
                        width: 150,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
