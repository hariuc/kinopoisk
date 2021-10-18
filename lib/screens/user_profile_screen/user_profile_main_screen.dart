import 'package:flutter/material.dart';

class UserProfileMainScreen extends StatelessWidget {
  const UserProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _createListElement(
              context: context,
              title: 'Подписки',
              icon: Icon(Icons.shop),
            ),
            _createListElement(
              context: context,
              title: 'Бонусы и подарки',
              icon: Icon(Icons.star),
            ),
            _createListElement(
              context: context,
              title: 'Родительский контроль',
              icon: Icon(Icons.dangerous),
            ),
            _createListElement(
              context: context,
              title: 'Ввести промокод',
              icon: Icon(Icons.topic),
            ),
            _createListElement(
              context: context,
              title: 'Настройки',
              icon: Icon(Icons.settings),
            ),
            _createListElement(
              context: context,
              title: 'Личные данные',
              icon: Icon(Icons.person),
            ),
            _createListElement(
              context: context,
              title: 'Поддержка',
              icon: Icon(Icons.info),
            ),
          ],
        ),
      );

  Widget _createListElement(
          {required BuildContext context,
          required String title,
          required Icon icon}) =>
      Card(
        elevation: 3.0,
        child: ListTile(
          title: Text(title),
          trailing: icon,
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(title)));
          },
        ),
      );
}
