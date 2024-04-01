import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/screens/about_page.dart';
import 'package:my_project/src/text.dart';

import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';
import 'colors.dart';

class AppTiles extends StatelessWidget {
  final String text;
  final String path;

  const AppTiles({
    Key? key,
    required this.text,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 3),
      minVerticalPadding: 10,
      leading: Container(
        width: 60,
        child: Transform.scale(
          scale: 0.6, // Adjust the scale factor as needed to increase the size
          child: Image.asset(path),
        ),
      ),
      shape: RoundedRectangleBorder(
        // Add this line
        borderRadius: BorderRadius.circular(10.0), // Adjust radius as desired
      ),
      tileColor: AppColors.darkgrey,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text),
        ],
      ),
      onTap: () {},
    );
  }
}

class AvatarTiles extends StatelessWidget {
  final String name;
  final String path;

  const AvatarTiles({
    Key? key,
    required this.name,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is AboutState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AboutPage()));
        }
      },
      child: Container(
        width: double.infinity,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 3),
          minVerticalPadding: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          tileColor: AppColors.lightgrey,
          leading: Container(
            width: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Transform.scale(
                scale: 1.2,
                child: Image.asset(path),
              ),
            ),
          ),
          title: Row(
            children: [
              SizedBox.square(dimension: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: name, size: 20, color: AppColors.white),
                      SizedBox(height: 10),
                      AppText(
                        text: 'View Profile',
                        size: 15,
                        color: AppColors.lightgreen,
                        isBold: true,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox.square(dimension: 20),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context).add(AboutEvent());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppPreviewTiles extends StatelessWidget {
  final String name;
  final String path;
  final IconData icon;
  final double iconsize;
  final String description;

  const AppPreviewTiles({
    Key? key,
    required this.iconsize,
    required this.description,
    required this.name,
    required this.path,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is AboutState) {
          // Perform actions when AboutState is received
          // For example, navigate to the about page
        }
      },
      child: Container(
        width: double.infinity,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 3),
          minVerticalPadding: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          tileColor: AppColors.semidarkgrey,
          leading: Container(
            width: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Transform.scale(
                scale: 0.8,
                child: Image.asset(path),
              ),
            ),
          ),
          title: Row(
            children: [
              SizedBox.square(dimension: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: name,
                        size: 10,
                        color: AppColors.white,
                        isBold: true,
                      ),
                      SizedBox(height: 10),
                      AppText(
                        text: description,
                        size: 8,
                        color: AppColors.offwhite,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox.square(dimension: 5),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .end, // Aligns items at the end of the row
                  children: [
                    IconButton(
                      icon:
                          Icon(icon, size: iconsize, color: AppColors.offwhite),
                      onPressed: () {
                        BlocProvider.of<NavigationBloc>(context)
                            .add(AboutEvent());
                      },
                    ),
                    SizedBox(
                        width:
                            5), // Add padding of 5 between the icon and other widgets
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
