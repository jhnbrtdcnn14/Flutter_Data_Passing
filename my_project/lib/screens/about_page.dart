import 'package:flutter/material.dart';
import 'package:my_project/screens/mainscreen.dart';
import 'package:my_project/src/card.dart';
import 'package:my_project/src/colors.dart';
import 'package:my_project/src/social.dart';
import 'package:my_project/src/text.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return MainScreen(
                username: 'DEAFAULTR',
              );
            }));
          },
        ),
        centerTitle: true,
        title: AppText(
          text: 'John Decinan',
          size: 20,
          color: AppColors.white,
          isBold: true,
        ),
        backgroundColor: AppColors.darkgrey,
      ),
      body: Container(
        color: AppColors.darkgrey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Background Image
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/bgimage.png', // Or any other image provider
                      fit: BoxFit.cover,
                      height: 150, // Adjust the height as needed
                    ),
                  ),
                ],
              ),
              // AVATAR THINGS
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Profile Picture (CircleAvatar)
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    AppColors.darkgrey, // Set the border color
                                width: 5.0, // Set the border thickness
                              ),
                              shape: BoxShape
                                  .circle, // Ensures the container becomes a circle
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/face.png'), // Replace with profile picture
                              radius: 60.0,
                            ),
                          ),

                          SizedBox(
                              height:
                                  10), // Add some spacing between the profile picture and other widgets

                          // Name
                          AppText(
                            text: 'John Decinan',
                            size: 20,
                            color: AppColors.white,
                            isBold: true,
                          ),
                          SizedBox(
                              height:
                                  5), // Add some spacing between the name and other widgets
                          // ICONS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: AppColors.lightgreen,
                                size: 10,
                              ),
                              SizedBox.square(
                                dimension: 2,
                              ),
                              AppText(
                                  text: '99 reacts',
                                  size: 12,
                                  color: AppColors.white),
                              SizedBox.square(
                                dimension: 5,
                              ),
                              Icon(
                                Icons.people_rounded,
                                color: AppColors.lightgreen,
                                size: 10,
                              ),
                              SizedBox.square(
                                dimension: 2,
                              ),
                              AppText(
                                  text: '60 Friends',
                                  size: 12,
                                  color: AppColors.white)
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Social Media Icons or Buttons (Add your social media icons/buttons here)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSocial(
                            account: 'John Decinan',
                            path: 'assets/fb.png',
                          ),
                          AppSocial(
                            account: 'Jhnbrtdcnn14',
                            path: 'assets/insta.png',
                          ),
                          AppSocial(
                            account: '@janjan14',
                            path: 'assets/twitter.png',
                          ),
                          AppSocial(
                            account: '+69487854125',
                            path: 'assets/whatsapp.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Profile Section

              // GridView or other content (Add your grid view or other content here)
              Padding(
                padding: const EdgeInsets.only(
                    top: 330,
                    left: 15,
                    right:
                        15), // Adjust top padding to prevent overlap with header image
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust cross axis count as needed
                  ),
                  itemCount: 15, // Replace with actual item count
                  itemBuilder: (context, index) {
                    // Return different content based on the index
                    if (index % 2 == 0) {
                      // Even index
                      return AboutCards(
                        path: 'assets/teddy.png',
                        text: 'Teddy',
                      );
                    } else {
                      // Odd index
                      return AboutCards(
                        path: 'assets/cloting.png',
                        text: 'Cloting',
                      );
                    }
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
