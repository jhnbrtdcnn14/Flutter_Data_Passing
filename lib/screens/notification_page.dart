import 'package:flutter/material.dart';
import 'package:my_project/src/buttons.dart';
import 'package:my_project/src/colors.dart';
import 'package:my_project/src/text.dart';
import 'package:my_project/src/tiles.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AppButtons(
              color: AppColors.lightgrey,
              text: 'Mark all as read',
              textcolor: AppColors.white,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    AppText(text: 'Today', size: 18, color: AppColors.white),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            AppPreviewTiles(
                              name: 'Jay Scavas reacted to your item.',
                              path: 'assets/heart.png',
                              icon: Icons.more_horiz_rounded,
                              description: '3 minutes ago',
                              iconsize: 15,
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                        text: 'Yesterday', size: 18, color: AppColors.white),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            AppPreviewTiles(
                              name: 'Jay Scavas reacted to your item.',
                              path: 'assets/heart.png',
                              icon: Icons.more_horiz_outlined,
                              description: '3 minutes ago',
                              iconsize: 20,
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      },
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
