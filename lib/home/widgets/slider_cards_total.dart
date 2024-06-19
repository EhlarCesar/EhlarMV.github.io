import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home/widgets/item_card_widget.dart';

class SliderCardsWidget extends StatefulWidget {
  const SliderCardsWidget({super.key});

  @override
  State<SliderCardsWidget> createState() => _SliderCardsWidgetState();
}

class _SliderCardsWidgetState extends State<SliderCardsWidget> {
  var db = FirebaseFirestore.instance;
  int totalClient = 0;
  @override
  void initState() {
    db.collection("users").get().then((event) {
      for (var i = 0; i < event.docs.length; i++) {
        setState(() {
          
        totalClient = totalClient + 1;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemCardWidget(title: "Total de clientes", total: totalClient),
          const ItemCardWidget(title: "Total de productos", total: 69),
          const ItemCardWidget(title: "Total de subscriptores", total: 69),
        ],
      ),
    );
  }
}
