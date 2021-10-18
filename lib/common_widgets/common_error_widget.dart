import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final String errorText;

  const CommonErrorWidget({required this.errorText});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(errorText),
      );
}
