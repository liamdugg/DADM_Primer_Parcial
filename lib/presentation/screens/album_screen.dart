import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
=======
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> working_branch
import 'package:primer_parcial/domain/models/song.dart';
import 'package:primer_parcial/domain/models/album.dart';
import 'package:primer_parcial/data/local_albums_repository.dart';
import 'package:primer_parcial/presentation/widgets/custom_drawer.dart';
import 'package:primer_parcial/presentation/providers/user_provider.dart';
<<<<<<< HEAD
=======
import 'package:primer_parcial/presentation/providers/album_provider.dart';
>>>>>>> working_branch

class AlbumScreen extends ConsumerStatefulWidget{
  
  final int albumId;
<<<<<<< HEAD
  const AlbumScreen({super.key, required this.albumId,});

=======
  const AlbumScreen({super.key, required this.albumId});
  
>>>>>>> working_branch
  @override
  AlbumScreenState createState() => AlbumScreenState();
}

class AlbumScreenState extends ConsumerState<AlbumScreen> {
  
<<<<<<< HEAD
  final _repository = LocalAlbumsRepository();
  late Future<Album?> futureAlbum;
  late Future<List<Song>> futureSongs;
=======
  late Future<List<Song>> futureSongs;
  final _repository = LocalAlbumsRepository();
>>>>>>> working_branch

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    futureAlbum = _repository.getAlbumById(widget.albumId);
=======
    //debugPrint('-----------------------\n\n\nINIT ALBUM SCREEN\n\n\n-----------------------');
>>>>>>> working_branch
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

<<<<<<< HEAD

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
=======
      body: FutureBuilder(
        future: futureSongs, 
        builder: (context, snapshot) {
         
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
        
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Albums loaded
          else if (snapshot.hasData) {
            final songList = snapshot.data!;

            return PageView(
              children: [
                _AlbumDetailsPage(
                  album: ref.watch(albumProvider),
                ),
                
                _TrackListPage(
                  album: ref.watch(albumProvider),
                  songList: songList,
                ),
             ],
            );
          }

          else { return const Text('Something Went Wrong');}
        }
      )
    );   
>>>>>>> working_branch
  }
}

class _AlbumDetailsPage extends StatelessWidget {
  
<<<<<<< HEAD
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
=======
  final Album album;
  const _AlbumDetailsPage({required this.album});
 
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          (album.cover == null || album.cover == '')
            ? Image.asset('assets/messi.jpg', fit: BoxFit.cover)
            : Image.asset(album.cover!, fit: BoxFit.cover),
          const SizedBox(height:20),
          Text(album.title, style: textStyle.titleLarge),
          Text(album.artist, style: textStyle.titleMedium),
          Text(album.releaseYear.toString()),
        ],
      ),
    );      
>>>>>>> working_branch
  }
}

class _TrackListPage extends StatelessWidget {
  
<<<<<<< HEAD
  final int albumId;
  final Future<List<Song>> futureSongs;

  const _TrackListPage({
    required this.albumId, 
    required this.futureSongs
=======
  final Album album;
  final List<Song> songList;

  const _TrackListPage({
    required this.songList,
    required this.album,
>>>>>>> working_branch
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    final textStyle = Theme.of(context).textTheme;

    return ListView.builder(
      itemCount: songList.length +1,
      itemBuilder: (context, i) {
        
        if(i == 0) {
          return ListTile(
            title   : Text('Track Name', style: textStyle.titleMedium),
            trailing: Icon(Icons.watch_later_outlined),
          );
        }

        else {
          return ListTile(
            leading : (album.cover == null || album.cover == '')
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:Image.asset('assets/messi.jpg', height:60, width: 60, fit: BoxFit.cover)
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(album.cover!, height: 60, width: 60, fit: BoxFit.cover)
                ),
            title   : Text(songList[i-1].title, style: textStyle.titleMedium,),
            subtitle: Text(album.artist),
            trailing: Text(songList[i-1].length, style: textStyle.bodyMedium),
          );
        }
      },
    );
  }
}
>>>>>>> working_branch
