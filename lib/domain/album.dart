class Album {
  final String title;
  final String artist;
  final int releaseYear;
  final List<Genre> genre;
  final String? cover;

  Album({
    required this.title, 
    required this.artist, 
    required this.releaseYear, 
    required this.genre,
    this.cover,
  });
}

enum Genre {rock,pop,rap,jazz}


final List<Album> albumList = [
  Album(
    title: 'The Dark Side of the Moon',
    artist: 'Pink Floyd',
    releaseYear: 1973,
    genre: [Genre.rock],
    cover: 'assets/dsotm.png',
  ),
  Album(
    title: 'Thriller',
    artist: 'Michael Jackson',
    releaseYear: 1982,
    genre: [Genre.pop],
    cover: 'assets/thriller.jpg',
  ),
  Album(
    title: 'To Pimp a Butterfly',
    artist: 'Kendrick Lamar',
    releaseYear: 2015,
    genre: [Genre.rap, Genre.jazz],
    cover: 'assets/tpab.jpg',
  ),
  Album(
    title: 'Kind of Blue',
    artist: 'Miles Davis',
    releaseYear: 1959,
    genre: [Genre.jazz],
    cover: 'assets/kindofblue.jpg',
  ),
  Album(
    title: 'Back in Black',
    artist: 'AC/DC',
    releaseYear: 1980,
    genre: [Genre.rock],
    cover: 'assets/backinblack.png',
  ),
  Album(
    title: '21',
    artist: 'Adele',
    releaseYear: 2011,
    genre: [Genre.pop],
    cover: 'assets/21.png',
  ),
  Album(
    title: 'Good Kid, M.A.A.D City',
    artist: 'Kendrick Lamar',
    releaseYear: 2012,
    genre: [Genre.rap],
    cover: 'assets/gkmc.jpg',
  ),
  Album(
    title: 'Abbey Road',
    artist: 'The Beatles',
    releaseYear: 1969,
    genre: [Genre.rock, Genre.pop],
    cover: 'assets/abbey_road.jpg',
  ),
  Album(
    title: 'The Eminem Show',
    artist: 'Eminem',
    releaseYear: 2002,
    genre: [Genre.rap],
    cover: 'assets/the_eminem_show.jpg',
  ),
  Album(
    title: 'Blue Train',
    artist: 'John Coltrane',
    releaseYear: 1957,
    genre: [Genre.jazz],
    cover: 'assets/bluetrain.jpg',
  ),
];