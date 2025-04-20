import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';

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

      drawer: CustomDrawer(
        userName: userName,
      ),

      body: _ItemListView(),

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
      onTap: () => context.push('/home/details/a'),
    );
  }
}