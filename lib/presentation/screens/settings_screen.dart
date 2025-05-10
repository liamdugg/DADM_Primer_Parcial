import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primer_parcial/core/theme/app_theme_provider.dart';
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

      body: _SettingsView(),
    );
  }
}

class _SettingsView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return ListView(
      children: [

        SwitchListTile(
          title     : const Text('Dark Mode'),
          subtitle  : const Text('Enable dark mode'),
          secondary : const Icon(Icons.dark_mode),
          value     : ref.watch(themeProvider).isDarkMode,
          onChanged : (value) => ref.read(themeProvider.notifier).toggleDarkMode(),
        ),

        ListTile(
          title    : const Text('Accent Color'),
          subtitle : const Text('Change accent color'),
          leading  : const Icon(Icons.color_lens),
        ),

      ],
    );
  }
}