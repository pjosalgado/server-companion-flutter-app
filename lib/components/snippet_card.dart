import 'package:flutter/material.dart';

class SnippetCard extends StatelessWidget {
  final String name;
  const SnippetCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(name),
          ),
          const ListTile(
            leading: Icon(Icons.terminal),
            title: Text('Command'),
          ),
        ],
      ),
    );
  }
}
