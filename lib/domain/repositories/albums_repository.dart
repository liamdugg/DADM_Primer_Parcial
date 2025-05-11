import 'package:primer_parcial/domain/models/album.dart';
import 'package:primer_parcial/domain/models/song.dart';

abstract class AlbumsRepository {
  Future<List<Album>> getAlbums();

  Future<Album?> getAlbumById(int id);
  
  Future<List<Song>> getSongsByAlbumId(int albumId);

  Future<void> insertAlbum(Album album);
}