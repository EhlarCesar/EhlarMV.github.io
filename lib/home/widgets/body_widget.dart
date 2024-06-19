import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home/widgets/background_widget.dart';
import 'package:myapp/home/widgets/card_ultimate_client.dart';
import 'package:myapp/home/widgets/slider_cards_total.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundWidget(),
        _contentBody(),
      ],
    );
  }

  Widget _contentBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _firstRow(),
          _boton(),
          _editar(),
          const SliderCardsWidget(),
          const CardUltimateClients()
        ],
      ),
    );
  }

  Widget _boton() {
    return ElevatedButton(
      child: const Text("Crear usuario"),
      onPressed: () {
        final user = {"first": "brian", "last": "cabrito", "born": 1998};

        db.collection("users").add(user);
      },
    );
  }

  Widget _editar() {
    return ElevatedButton(
      child: const Text("editar usuario"),
      onPressed: () async {
        final user = db.collection("users").doc("49E3LG4OZwx1d4W3QrbU");
        await user.update({"first": "ehlar"});
      },
    );
  }
}

Widget _firstRow() {
  return const Row(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 15),
        child: Text(
          "Dashboard",
          style: TextStyle(fontSize: 20, color: Colors.white54),
        ),
      ),
    ],
  );
}
