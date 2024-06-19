import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final int selectedPageIndex;
  final Function(int) onPageSelected;

  const AppDrawer({
    super.key,
    required this.selectedPageIndex,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Dashboard Menu'),
          ),
          ListTile(
            title: const Text('Users Table'),
            onTap: () => onPageSelected(0),
            selected: selectedPageIndex == 0,
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () => onPageSelected(1),
            selected: selectedPageIndex == 1,
          ),
        ],
      ),
    );
  }
}
