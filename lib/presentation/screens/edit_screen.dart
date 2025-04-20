import 'package:flutter/material.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';


class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      
      drawer: CustomDrawer(
        userName: 'liam'
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Edit block'),
        ],
      ),
    );
  }
}