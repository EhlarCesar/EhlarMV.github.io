import 'package:flutter/material.dart';
import 'package:myapp/home/widgets/app_bar_widget.dart';
import 'package:myapp/home/widgets/body_widget.dart';
import 'package:myapp/home/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: DrawerWidget(),
      appBar: AppbarWidget(),
      body: BodyWidget(),
    );
  }
}
