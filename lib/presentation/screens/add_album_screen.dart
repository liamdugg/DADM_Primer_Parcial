import 'package:flutter/material.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';

class AddAlbumScreen extends StatelessWidget {
  const AddAlbumScreen({super.key});

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
            const Text('Add album'),
          ],
        ),
      ),
    );
  }
}