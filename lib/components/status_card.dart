import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String name;
  const StatusCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(name),
          ),
          const Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.computer),
                  title: Text('CPU'),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.memory),
                  title: Text('RAM'),
                ),
              ),
            ],
          ),
          const Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.storage),
                  title: Text('Disk'),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.thermostat),
                  title: Text('Temp'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
