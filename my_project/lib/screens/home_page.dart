import 'package:flutter/material.dart';
import 'package:my_project/src/colors.dart';
import 'package:my_project/src/text.dart';
import '../src/card.dart';
import '../src/searchbar.dart'; // Import your search bar widget here

class HomePage extends StatelessWidget {
  final String? homeusername; // Add username parameter
  const HomePage({Key? key, this.homeusername}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  AppText(text: "Hello", size: 13, color: AppColors.offwhite),
                  SizedBox(
                    width: 05,
                  ),
                  AppText(
                      text: homeusername ?? "Name",
                      size: 15,
                      color: AppColors.lightgreen)
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: AppSearch(text: 'Search an item'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_list_rounded,
                      color: AppColors.lightgreen,
                    ),
                    onPressed: () {
                      // Implement your filter logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  // Your search bar widget
                  ListView.builder(
                    shrinkWrap: true, // Added to prevent infinite height error
                    physics:
                        NeverScrollableScrollPhysics(), // Added to prevent parent scroll issues
                    itemCount: 6, // Example number of list items
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          AppCards(
                            name: homeusername ?? 'Name',
                            path: 'assets/cloting.png',
                            // Your AppTiles widget
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
