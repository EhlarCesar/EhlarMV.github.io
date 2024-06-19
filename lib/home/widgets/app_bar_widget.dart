import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 26, 98, 157),
      title: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(30, 50);
}
