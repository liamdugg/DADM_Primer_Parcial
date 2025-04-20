import 'package:flutter/material.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      
      drawer: CustomDrawer(
        userName: 'liam'
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Settings block'),
          ],
        ),
      ),
    );
  }
}