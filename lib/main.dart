import 'package:flutter/material.dart';

import 'views/home/status_tab.dart';
import 'views/home/snippets_tab.dart';
import 'views/settings.dart';

void main() {
  runApp(const CompanionApp());
}

class CompanionApp extends StatelessWidget {
  const CompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server Companion',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: const CompanionHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CompanionHome extends StatefulWidget {
  const CompanionHome({super.key});

  @override
  State<CompanionHome> createState() => _CompanionHomeState();
}

class _CompanionHomeState extends State<CompanionHome> {
  int _selectedIndex = 0;
  String _barTitle = 'Unknown';

  @override
  void initState() {
    super.initState();
    _onItemTapped(_selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _barTitle = [
        'Status',
        'Snippets'
      ][_selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( _barTitle),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Open app settings',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage()
                ),
              );
            },
          ),
        ],
      ),
      body: <Widget>[
        const StatusTab(),
        const SnippetsTab(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: 'Status',
            tooltip: 'Track your servers current status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Snippets',
            tooltip: 'View and manage your snippets',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
