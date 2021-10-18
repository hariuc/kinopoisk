// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_top_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmTopResponse _$FilmTopResponseFromJson(Map<String, dynamic> json) {
  dynamic jsonCountries = json['countries'];
  if (json['countries'] is String) {
    jsonCountries = jsonDecode(jsonCountries);
  }

  dynamic jsonGenres = json['genres'];
  if (json['genres'] is String) {
    jsonGenres = jsonDecode(jsonGenres);
  }

  return FilmTopResponse(
    json['filmId'] as int,
    json['nameRu'] as String,
    json['nameEn'] as String?,
    json['year'] as String,
    json['filmLength'] as String,
    json['rating'] as String,
    json['ratingVoteCount'] as int,
    json['posterUrl'] as String,
    json['posterUrlPreview'] as String,
    (jsonCountries as List<dynamic>)
        .map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList(),
    (jsonGenres as List<dynamic>)
        .map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FilmTopResponseToJson(FilmTopResponse instance) =>
    <String, dynamic>{
      'filmId': instance.filmId,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'year': instance.year,
      'filmLength': instance.filmLength,
      'rating': instance.rating,
      'ratingVoteCount': instance.ratingVoteCount,
      'posterUrl': instance.posterUrl,
      'posterUrlPreview': instance.posterUrlPreview,
      'countries':
          json.encode(instance.countries.map((e) => e.toJson()).toList()),
      'genres': json.encode(instance.genres.map((e) => e.toJson()).toList()),
    };
