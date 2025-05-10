import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primer_parcial/presentation/providers/user_provider.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
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