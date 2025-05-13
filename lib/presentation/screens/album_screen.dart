import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:primer_parcial/domain/models/song.dart';
import 'package:primer_parcial/domain/models/album.dart';
import 'package:primer_parcial/data/local_albums_repository.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';
import 'package:primer_parcial/presentation/providers/user_provider.dart';

class AlbumScreen extends ConsumerStatefulWidget{
  
  final int albumId;
  const AlbumScreen({super.key, required this.albumId,});

  @override
  AlbumScreenState createState() => AlbumScreenState();
}

class AlbumScreenState extends ConsumerState<AlbumScreen> {
  
  final _repository = LocalAlbumsRepository();
  late Future<Album?> futureAlbum;
  late Future<List<Song>> futureSongs;

  @override
  void initState() {
    super.initState();
    futureAlbum = _repository.getAlbumById(widget.albumId);
    futureSongs = _repository.getSongsByAlbumId(widget.albumId);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Details'),
        actions: [ 
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push('/editor')
          ),
        ],
      ),
      
      drawer: CustomDrawer(
        userName: ref.read(loggedUserProvider).username,
        image   : ref.read(loggedUserProvider).profileImage,
      ),


      body: PageView(
        children: [

          _AlbumDetailsPage(
            albumId: widget.albumId,
            futureAlbum: futureAlbum,),
          
          _TrackListPage(
            albumId: widget.albumId,
            futureSongs: futureSongs,
          ),
        ],
      ),
    );
  }
}

class _AlbumDetailsPage extends StatelessWidget {
  
  final int albumId;
  final Future<Album?> futureAlbum;

  const _AlbumDetailsPage({
    required this.albumId,
    required this.futureAlbum,
  });
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureAlbum, 
      builder: (context, snapshot) {

        // Loading data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        // Error
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));}

        // Albums loaded
        else if (snapshot.hasData) {
          final album = snapshot.data!;
          
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                (album.cover == null || album.cover == '')
                  ? Image.asset('assets/messi.jpg', fit: BoxFit.cover)
                  : Image.asset(album.cover!, fit: BoxFit.cover),
                const SizedBox(height:20),
                Text(album.title),
                Text(album.artist),
                Text(album.releaseYear.toString()),
              ],
            ),
          );
        }

        else {return Container(color: Colors.red);}

      }
    );
  }
}

class _TrackListPage extends StatelessWidget {
  
  final int albumId;
  final Future<List<Song>> futureSongs;

  const _TrackListPage({
    required this.albumId, 
    required this.futureSongs
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureSongs,
      builder:(context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        else if (snapshot.hasData) {
          final songList = snapshot.data;
          debugPrint('--------------\n\n\n LOADED TRACKS \n\n\n--------------');
          return ListView.builder(
            itemCount: songList!.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Text('${songList[i].trackNumber}'),
                title: Text(songList[i].title),
                subtitle: Text('Track length: ${songList[i].length}'),
              );
            },
          );
        }
        else {return Container(color: Colors.red);} 
      },
    );
  }
}