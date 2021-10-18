class FilmTopResponseTableSetting {
  static const String tableName = 'film_top_response';

  static const String id = 'id';
  static const String filmId = 'filmId';
  static const String nameRu = 'nameRu';
  static const String nameEn = 'nameEn';
  static const String year = 'year';
  static const String filmLength = 'filmLength';
  static const String rating = 'rating';
  static const String ratingVoteCount = 'ratingVoteCount';
  static const String posterUrl = 'posterUrl';
  static const String posterUrlPreview = 'posterUrlPreview';
  static const String countries = 'countries';
  static const String genres = 'genres';

  static String createFilmResponseTable() {
    final strBuffer = StringBuffer();

    strBuffer.write("CREATE TABLE $tableName (");
    strBuffer.write(
        "${FilmTopResponseTableSetting.id} INTEGER PRIMARY KEY AUTOINCREMENT, ");
    strBuffer.write("${FilmTopResponseTableSetting.filmId} INTEGER, ");
    strBuffer.write("${FilmTopResponseTableSetting.nameRu} VARCHAR(100), ");
    strBuffer.write("${FilmTopResponseTableSetting.nameEn} VARCHAR(100), ");
    strBuffer.write("${FilmTopResponseTableSetting.year} VARCHAR(4), ");
    strBuffer.write("${FilmTopResponseTableSetting.filmLength} VARCHAR(5), ");
    strBuffer.write("${FilmTopResponseTableSetting.rating} VARCHAR(5), ");
    strBuffer.write("${FilmTopResponseTableSetting.countries} VARCHAR(1000), ");
    strBuffer.write("${FilmTopResponseTableSetting.genres} VARCHAR(1000), ");
    strBuffer.write("${FilmTopResponseTableSetting.ratingVoteCount} INTEGER, ");
    strBuffer.write("${FilmTopResponseTableSetting.posterUrl} VARCHAR(1000), ");
    strBuffer.write(
        "${FilmTopResponseTableSetting.posterUrlPreview} VARCHAR(1000))");

    return strBuffer.toString();
  }

  //SELECT * FROM film_top_response
  static String sqlQueryGetAllFilms() => 'SELECT * FROM $tableName';
  
}
