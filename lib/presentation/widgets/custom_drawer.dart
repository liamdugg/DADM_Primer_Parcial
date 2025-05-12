import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// TODO: fix drawer appearing on back arrow tapped instead of going to previous screen.

class CustomDrawer extends StatelessWidget {
  
  final String userName;
  final String image;
  
  const CustomDrawer({
    super.key,
    required this.userName,
    required this.image,
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
            image   : image,
          ),

          // Home Button
          ListTile(
            leading: const Icon(Icons.home),
            title  : const Text('Home'),
            onTap  : () => currentRoute == '/home' ? Navigator.of(context).pop() : context.push('/home'), // close drawer or change screen
          ),

          // Settings Button
          ListTile(
            leading: const Icon(Icons.settings),
            title  : const Text('Settings'),
            onTap  : () => currentRoute == '/settings' ? Navigator.of(context).pop() : context.push('/settings'),
          ),

          // Profile Button
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap:() => currentRoute == '/profile/$userName' ? Navigator.of(context).pop() : context.push('/profile/$userName'),
          ),
          
          Divider(),
          
          // Logout Button TODO: add a confirmation dialog on tap
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
  final String image;

  const _CustomDrawerHeader({
    required this.userName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(image,
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ), 
          ),
          const SizedBox(height: 20,),
          Text(userName),
      ],),
    );
  }
}