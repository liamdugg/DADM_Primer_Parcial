import 'package:flutter/material.dart';
import 'package:primer_parcial/domain/user.dart';
import 'package:primer_parcial/domain/album.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';


class DetailsScreen extends StatelessWidget {
  
  final Album album;

  const DetailsScreen({super.key, required this.album,});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Details'),
      ),
      
      drawer: CustomDrawer(
        userName: 'liam'
      ),
      
      body: _DetailsView(
        album: album
      ),

    );
  }
}

class _DetailsView extends StatelessWidget {
  final Album album;

  const _DetailsView({required this.album});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Image.asset(album.cover!),
          const SizedBox(height: 20),

          Text(
            album.title, 
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),

          Text(
            album.artist, 
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}