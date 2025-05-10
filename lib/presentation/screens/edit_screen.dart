import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primer_parcial/presentation/providers/user_provider.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';

class EditScreen extends ConsumerWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username
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