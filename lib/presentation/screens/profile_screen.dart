import 'package:flutter/material.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      
      drawer: CustomDrawer(
        userName: 'liam'
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile page'),
          ],
        ),
      ),
    );
  }
}