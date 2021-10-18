import 'package:flutter/material.dart';
import 'package:kinopoisk/screens/favourites_screen/favourites_main_screen.dart';
import 'package:kinopoisk/screens/home_screen/home_main_screen.dart';
import 'package:kinopoisk/screens/search_screen/search_main_screen.dart';
import 'package:kinopoisk/screens/top_screen/top_main_screen.dart';
import 'package:kinopoisk/screens/user_profile_screen/user_profile_main_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _titleStr = ['Главная', 'Топ', 'Избранное', 'Поиск', 'Профиль'];
  //final _titleScreen = 'Кинопоиск';
  final _widgetsList = [
    const HomeMainScreen(),
    const TopMainScreen(),
    const FavouritesMainScreen(),
    const SearchMainScreen(),
    const UserProfileMainScreen()
  ];
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createBody(),
      bottomNavigationBar: _creageBottomNavigationBar(),
    );
  }

  AppBar _createAppBar() => AppBar(
        title: Text(_titleStr.elementAt(_selectIndex)),
      );

  Widget _createBody() => _widgetsList.elementAt(_selectIndex);

  BottomNavigationBarItem _createBottomNavigationBarItem(
          {required Icon icon, required String label}) =>
      BottomNavigationBarItem(icon: icon, label: label);

  Widget _creageBottomNavigationBar() => BottomNavigationBar(
          elevation: 3.0,
          currentIndex: _selectIndex,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          onTap: _onItemTap,
          items: [
            _createBottomNavigationBarItem(
                icon: const Icon(Icons.home), label: _titleStr[0]),
            // Главная
            _createBottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today), label: _titleStr[1]),
            // Топ
            _createBottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border), label: _titleStr[2]),
            // Избранное
            _createBottomNavigationBarItem(
                icon: const Icon(Icons.search), label: _titleStr[3]),
            // Поиск
            _createBottomNavigationBarItem(
                icon: const Icon(Icons.account_circle_outlined),
                label: _titleStr[4]),
            // Профиль
          ]);

  void _onItemTap(int index) => setState(() {
        _selectIndex = index;
      });
}
