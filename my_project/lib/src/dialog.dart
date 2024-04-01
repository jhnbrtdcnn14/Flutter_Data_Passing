// MyDialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/navigation_bloc.dart';

import '../bloc/navigation_event.dart';
import 'colors.dart';

class MyDialog {
  static void showCustomDialog(BuildContext context,
      {String? toastMessageOnYes,
      Function? path,
      String? title,
      String? content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '$title',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          content: Text('$content'),
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColors.darkgrey,
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'No',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                path!();
                BlocProvider.of<NavigationBloc>(context).add(LogoutEvent());
              },
              child: Text(
                'Yes',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.lightgreen),
              ),
            ),
          ],
        );
      },
    );
  }
}
