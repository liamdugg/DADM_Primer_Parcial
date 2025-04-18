import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  
  final String userName;
  
  const HomeScreen({
    super.key,
    required this.userName
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      body: _ItemListView(),
      drawer: _DrawerView(
        userName: userName,
      ),

    );
  }
}

class _DrawerView extends StatelessWidget {
  
  final String userName;
  
  const _DrawerView({required this.userName});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          
          DrawerHeader(
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
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
    
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap:() => context.push('/settings'),
          ),
    
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap:() => context.push('/profile/a'),
          ),
          
          Divider(),
          
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => context.go('/login'),
          ),
        ],
      ),
    );
  }
}

class _ItemListView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index){
        return _ItemView();
      }
    );
  }
}

class _ItemView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network('https://www.actron.com.tw/uploads/images/product/wafer/gallery/bare_die.jpg'),
      title: Text('Element'),
      subtitle: Text('Subtitle'),
      trailing: Icon(Icons.arrow_forward),
      onTap: () => context.push('/home/a'),
    );
  }
}