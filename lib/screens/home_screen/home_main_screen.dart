import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_bloc.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_event.dart';
import 'package:kinopoisk/blocs/film_top_response_bloc/film_top_response_state.dart';
import 'package:kinopoisk/common_widgets/common_error_widget.dart';
import 'package:kinopoisk/common_widgets/common_indicator.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  void initState() {
    BlocProvider.of<FilmTopResponseBloc>(context)
        .add(FilmTopResponseLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text(
                'КИНОПОИСК',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
              _createSizedBoxHeight(),
              _createFilmPart(),
            ],
          ),
        ),
      );

  Widget _createFilmPart() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _createFilmElement(text: 'Фильмы'),
              _createSizedBoxWidth(),
              _createFilmElement(text: 'Мультфильмы'),
            ],
          ),
          _createSizedBoxHeight(),
          Row(
            children: [
              _createFilmElement(text: 'Сериалы'),
              _createSizedBoxWidth(),
              _createFilmElement(text: 'Шоу'),
            ],
          ),
          _createSizedBoxHeight(),
          const Text(
            'Продолжить просмотр',
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.0, fontWeight: FontWeight.w700),
          ),
          _createSizedBoxHeight(),
          _createListContinueViewing(),
          _createSizedBoxHeight(),
          const Text(
            'Вам понравится',
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.0, fontWeight: FontWeight.w700),
          ),
          _createSizedBoxHeight(),
          _createListContinueViewing(),
        ],
      );

  Widget _createFilmElement({required String text}) => Expanded(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.network(
                'https://funart.pro/uploads/posts/2020-05/1590054421_7-p-titanik-film-26.jpg'),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );

  Widget _createListContinueViewing() => SizedBox(
        height: 290,
        child: BlocBuilder<FilmTopResponseBloc, FilmTopResponseState>(
          builder: (context, state) {
            if (state is FilmTopResponseLoadingState) {
              return const CommonIndicator();
            }

            if (state is FilmTopResponseLoadedState) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.filmsList.length,
                  itemBuilder: (context, index) =>
                      _createElementListContinueView(
                          srcPath: state.filmsList[index].posterUrlPreview));
            }

            return const CommonErrorWidget(errorText: 'errorText');
          },
        ),
      );

  Widget _createElementListContinueView({required String srcPath}) => Container(
        width: 200,
        child: Image.network(srcPath),
      );

  Widget _createSizedBoxWidth() => const SizedBox(
        width: 10,
      );

  Widget _createSizedBoxHeight() => const SizedBox(
        height: 10,
      );
}
