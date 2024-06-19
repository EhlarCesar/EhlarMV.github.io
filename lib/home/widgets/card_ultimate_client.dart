import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; 
import 'package:myapp/home/widgets/item_user.dart';

class CardUltimateClients extends StatefulWidget {
  const CardUltimateClients({super.key});

  @override
  State<CardUltimateClients> createState() => _CardUltimateClientsState();
}

class _CardUltimateClientsState extends State<CardUltimateClients> {
  var db = FirebaseFirestore.instance;
  List<String> clients = [];
  @override
  void initState() {
    db.collection("users").get().then((event) {
      for (var i = 0; i < event.docs.length; i++) {
        String name = event.docs[i]["first"];
        String lastName = event.docs[i]["last"];

        clients.add("$name $lastName ");
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350,
            width: 400,
            child: Card(
              color: const Color.fromARGB(255, 6, 16, 39),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CLIENTES",
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                      SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: clients.map(
                              (client) {
                                return ItemUserWidget(nombre: client);
                              },
                            ).toList(),
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 150,
            width: 400,
            child: Card(
              color: Color.fromARGB(255, 6, 16, 39),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "RECIENTE ACTIVIDAD",
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                      SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              ItemUserWidget(nombre: "Juan Martinez"),
                              ItemUserWidget(nombre: "Juan Martinez"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
