import 'package:primer_parcial/main.dart';
import 'package:primer_parcial/data/albums_dao.dart';
import 'package:primer_parcial/domain/models/song.dart';
import 'package:primer_parcial/domain/models/album.dart';
import 'package:primer_parcial/domain/repositories/albums_repository.dart';


class LocalAlbumsRepository implements AlbumsRepository {
  final AlbumsDao _albumsDao = albumsDatabase.albumsDao;

  @override
  Future<List<Album>> getAlbums(){
    return _albumsDao.findAllAlbums();
  }

  @override
  Future<Album?> getAlbumById(int id) {
    return _albumsDao.findAlbumById(id);
  }

  @override
  Future<List<Song>> getSongsByAlbumId(int albumId) {
    return _albumsDao.findSongsByAlbumId(albumId);
  }

  @override
  Future<void> insertAlbum(Album album) {
    return _albumsDao.insertAlbum(album);
  }
  
}