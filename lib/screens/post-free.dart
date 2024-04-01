import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/navigation_event.dart';
import 'package:my_project/src/buttons.dart';
import 'package:my_project/src/text.dart';

import '../bloc/navigation_bloc.dart';
import '../src/colors.dart';
import '../src/toast.dart';

class PostFreePage extends StatefulWidget {
  @override
  _PostFreePageState createState() => _PostFreePageState();
}

class _PostFreePageState extends State<PostFreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
              ),
              // HEADER
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/face.png'),
                  ),
                  SizedBox.square(
                    dimension: 10,
                  ),
                  AppText(
                    text: 'John Decinan',
                    size: 17,
                    color: AppColors.white,
                    isBold: true,
                  ),
                  SizedBox.square(
                    dimension: 10,
                  ),
                  Expanded(
                      child: AppButtons(
                          onPressed: () {},
                          textcolor: AppColors.white,
                          color: AppColors.lightgrey,
                          text: 'Public'))
                ],
              ),
              // TOOGLE
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.toggle_off_rounded,
                      color: AppColors.offwhite,
                      size: 50,
                    ),
                    onPressed: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(PostFreeEvent());
                    },
                  ),
                  SizedBox.square(
                    dimension: 10,
                  ),
                  AppText(text: 'For Free', size: 20, color: AppColors.white),
                ],
              ),
              // CAPTION

              const SizedBox(height: 10.0), // Add spacing
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your description here',
                  fillColor:
                      AppColors.darkgrey, // Optional: Add a background color
                  filled:
                      true, // Optional: To make the background color visible
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Optional: Rounded borders
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // IMAGE
              Row(
                children: [
                  Icon(
                    Icons.image,
                    size: 50,
                    color: AppColors.offwhite,
                  ),
                  SizedBox.square(
                    dimension: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: AppText(
                          text: 'Choose Image',
                          size: 18,
                          color: AppColors.offwhite)),
                ],
              ),
              const SizedBox(height: 10.0),
              // LOCATION
              Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    size: 50,
                    color: AppColors.offwhite,
                  ),
                  SizedBox.square(
                    dimension: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: AppText(
                          text: 'Add location',
                          size: 18,
                          color: AppColors.offwhite)),
                ],
              ),
              // POST
              const SizedBox(height: 50.0),
              AppButtons(
                  onPressed: () {
                    showToast('Posting Item...');
                    Future.delayed(Duration(seconds: 2), () {
                      BlocProvider.of<NavigationBloc>(context).add(HomeEvent());
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      showToast('Posted');
                    });
                  },
                  textcolor: AppColors.darkgrey,
                  color: AppColors.lightgreen,
                  text: 'POST')
            ],
          ),
        ),
      ),
    );
  }
}
