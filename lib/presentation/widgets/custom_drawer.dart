import 'package:flutter/material.dart';
//import 'package:primer_parcial/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  
  final String userName;
  
  const CustomDrawer({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {

    final String currentRoute = GoRouterState.of(context).uri.toString();
    debugPrint(currentRoute);

    return Drawer(
      child: ListView(
        children: [
          
          _CustomDrawerHeader(
            userName: userName,
          ),

          // Home Button
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => currentRoute == '/home/$userName' ? Navigator.of(context).pop() : context.push('/home/$userName'), // close drawer or change screen
          ),

          // Settings Button
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap:() => currentRoute == '/settings' ? Navigator.of(context).pop() : context.push('/settings'),
          ),

          // Profile Button
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap:() => currentRoute == '/profile/$userName' ? Navigator.of(context).pop() : context.push('/profile/$userName'),
          ),
          
          Divider(),
          
          // Logout Button 
          // TODO: add a confirmation dialog on tap
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => context.go('/login'),
          ),

      ],),
    );
  }
}

class _CustomDrawerHeader extends StatelessWidget {
  
  final String userName;

  const _CustomDrawerHeader({
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network('https://www.w3schools.com/howto/img_avatar.png',
              height: 80,
              width: 80,
            ), 
          ),
          const SizedBox(height: 20,),
          Text(userName),
      ],),
    );
  }
}