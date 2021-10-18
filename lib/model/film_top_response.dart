import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:kinopoisk/model/country.dart';
import 'package:kinopoisk/model/genre.dart';

part 'film_top_response.g.dart';

@JsonSerializable()
class FilmTopResponse {
  final int filmId;
  final String nameRu;
  final String? nameEn;
  final String year;
  final String filmLength;
  final String rating;
  final int ratingVoteCount;
  final String posterUrl;
  final String posterUrlPreview;

  final List<Country> countries;
  final List<Genre> genres;

  FilmTopResponse(
      this.filmId,
      this.nameRu,
      this.nameEn,
      this.year,
      this.filmLength,
      this.rating,
      this.ratingVoteCount,
      this.posterUrl,
      this.posterUrlPreview,
      this.countries,
      this.genres);

  factory FilmTopResponse.fromJson(Map<String, dynamic> json) =>
      _$FilmTopResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FilmTopResponseToJson(this);
}
