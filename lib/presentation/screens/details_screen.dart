import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:primer_parcial/domain/user.dart';
import 'package:primer_parcial/domain/models/album.dart';
import 'package:primer_parcial/presentation/providers/user_provider.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';


class DetailsScreen extends ConsumerWidget {
  
  final Album album;

  const DetailsScreen({super.key, required this.album,});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Details'),
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
        image   : ref.read(loggedUserProvider).profileImage,
      ),
      
      body: PageView(
        children: [
          _DetailsView(album: album),
          _TrackListView(),
          Center(child: Text('Third Page')),
        ],
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

          Card(
            elevation: 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.album),
                    Padding(padding: const EdgeInsets.only(right: 10)),
                    Text('Album: ${album.title}', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    Padding(padding: const EdgeInsets.only(right: 10)),
                    Text('Artist: ${album.artist}', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackListView extends StatelessWidget {
  //const _TrackListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(

        children: [
          TableRow(
            children: [
              Text('#'),
              Icon(Icons.music_note),
              Icon(Icons.timer_outlined),
            ],
          ),

          TableRow(
            children: [
              Text('1'),
              Text('Track 1'),
              Text('3:45'),
            ],
          ),

          TableRow(
            children: [
              Text('2'),
              Text('Track 2'),
              Text('4:20'),
            ],
          ),
          
          TableRow(
            children: [
              Text('3'),
              Text('Track 3'),
              Text('2:50'),
            ],
          ),
        ],
      ),
    );
  }
}