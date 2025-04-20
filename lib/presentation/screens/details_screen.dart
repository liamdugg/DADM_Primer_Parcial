import 'package:flutter/material.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _DetailsView();
  }
}

class _DetailsView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      
      drawer: CustomDrawer(
        userName: 'liam'
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Details block'),
          ],
        ),
      ),
    );
  }
}