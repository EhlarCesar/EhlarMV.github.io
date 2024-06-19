import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserTable extends StatelessWidget {
  final List<User> users;

  const UserTable({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Actions')),
          ],
          rows: users
              .map(
                (user) => DataRow(
                  cells: [
                    DataCell(Text(user.displayName ?? "")),
                    DataCell(Text(user.email ?? "")),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => {}, // Implement edit functionality
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => {}, // Implement delete functionality
                        ),
                      ],
                    )),
                  ],
                ),
              )
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New User',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: TextEditingController(), // Implement a controller
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: TextEditingController(), // Implement a controller
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => {}, // Implement add user functionality
                child: const Text('Add User'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
