import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primer_parcial/core/theme/app_theme.dart';
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
    
    return Column(
      children: [

        SwitchListTile(
          title     : const Text('Dark Mode'),
          subtitle  : const Text('Enable dark mode'),
          secondary : const Icon(Icons.dark_mode),
          value     : ref.watch(themeProvider).isDarkMode,
          onChanged : (value) => ref.read(themeProvider.notifier).toggleDarkMode(),
        ),

        ExpansionTile(
          title    : const Text('Accent Color'),
          subtitle : const Text('Change accent color'),
          leading  : const Icon(Icons.color_lens),
          initiallyExpanded: true,
          children : colors.map((color) {
            return RadioListTile(
              title: Text(color.toARGB32().toString()),
              value: colors.indexOf(color),
              groupValue: ref.watch(themeProvider).selectedColor,
              onChanged: (value) => 
                ref.watch(themeProvider.notifier).changeColorTheme(colors.indexOf(color)),
            );
          }).toList(),
        ),
      ],
    );
  }
}