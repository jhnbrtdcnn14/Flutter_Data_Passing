import 'package:flutter/material.dart';

import 'textfield.dart';

class AppSearch extends StatelessWidget {
  final String text;

  const AppSearch({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageWithTextField(
      imagePath: 'assets/search.png',
      text: text,
    );
  }
}
