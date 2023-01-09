import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Cooking Up!',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: const Text('Meals'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            size: 26,
          ),
          title: const Text('Filters'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/filters');
          },
        ),
      ],
    );
  }
}
