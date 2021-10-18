abstract class FilmEvent {}

class FilmLoadEvent extends FilmEvent {
  final int idFilm;

  FilmLoadEvent({required this.idFilm});
}
