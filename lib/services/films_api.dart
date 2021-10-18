import 'package:kinopoisk/services/utils.dart';

class FilmsAPI {
  Future<Map<String, dynamic>> getTopFilmsFromServer() async {
    var uriPath = 'top/';
    return await Utils.getDataFromNet(uriPath: uriPath);
  }

  Future<Map<String, dynamic>> getFilmFromServer({required String idFilm}) async{
    var uriPath = '$idFilm/';
    return await Utils.getDataFromNet(uriPath: uriPath);
  }
}
