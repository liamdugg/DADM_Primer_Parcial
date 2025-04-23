import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:primer_parcial/domain/album.dart';
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
      itemCount: albumList.length,
      itemBuilder: (context, index){
        return _ItemView(
          album: albumList[index]
        );
      }
    );
  }
}

class _ItemView extends StatelessWidget {

  final Album album;

  const _ItemView({required this.album});
  
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(album.cover!, fit: BoxFit.cover,),
          ),
        ),
        title: Text(album.title, style: textStyle.titleMedium,),
        subtitle: Text(album.artist, style: textStyle.bodyMedium),
        trailing: Icon(Icons.arrow_forward),
        onTap: () => context.push('/home/details/a'),
      ),
    );
  }
}

/*SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(album.cover!, fit: BoxFit.fill,),
          ), */