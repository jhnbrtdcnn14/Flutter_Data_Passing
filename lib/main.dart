import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/screens/login_page.dart';
import 'bloc/navigation_bloc.dart';
import 'src/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyApp: Building the app'); // Track MyApp execution
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: LoginPage(),
      ),
    );
  }
}
