import 'package:flutter/material.dart';
import 'package:my_project/src/text.dart';
import 'colors.dart';

class AppCards extends StatelessWidget {
  final String name;
  final String path;

  const AppCards({
    Key? key,
    required this.name,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightgrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Adjust the radius as needed
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover, // Ensure the image fills the container
                  ),
                ),
              ),
            ],
          ),
          SizedBox.square(dimension: 20),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/face.png'),
                      ),
                      SizedBox.square(dimension: 5),
                      AppText(
                        text: name,
                        size: 10,
                        color: AppColors.white,
                        isBold: true,
                      ),
                    ],
                  ),
                  SizedBox.square(dimension: 10),
                  AppText(
                    text:
                        'Used Cloting for sale. Chat me if \nyou are interested.',
                    color: AppColors.white,
                    size: 10,
                    isBold: false,
                  ),
                  SizedBox.square(dimension: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          // Implement your favorite logic here
                        },
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chat,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          // Implement your chat logic here
                        },
                      ),
                      SizedBox(
                        width: 3,
                      ),

                      // button
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightgreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 50, // Set the desired width
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: AppText(
                              text: '₱150',
                              size: 10,
                              color: AppColors.green,
                              isBold: true,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppCardsRed extends StatelessWidget {
  final String name;
  final String path;

  const AppCardsRed({
    Key? key,
    required this.name,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightgrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Adjust the radius as needed
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover, // Ensure the image fills the container
                  ),
                ),
              ),
            ],
          ),
          SizedBox.square(dimension: 20),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/face.png'),
                      ),
                      SizedBox.square(dimension: 5),
                      AppText(
                        text: 'Johnbert Decinan',
                        size: 10,
                        color: AppColors.white,
                        isBold: true,
                      ),
                    ],
                  ),
                  SizedBox.square(dimension: 10),
                  AppText(
                    text:
                        'Teddy Bear from my cousin. Chat me if you  are interested.',
                    color: AppColors.white,
                    size: 10,
                    isBold: false,
                  ),
                  SizedBox.square(dimension: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: AppColors.red,
                        ),
                        onPressed: () {
                          // Implement your favorite logic here
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chat,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          // Implement your chat logic here
                        },
                      ),
                      // button
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightgreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 50, // Set the desired width
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: AppText(
                              text: 'Free',
                              size: 10,
                              color: AppColors.green,
                              isBold: true,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutCards extends StatelessWidget {
  final String path;
  final String text;

  const AboutCards({
    Key? key,
    required this.path,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: ClipRRect(
                // Add ClipRRect
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0), // Adjust radius as needed
                  topRight: Radius.circular(10.0),
                ),
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: AppText(text: text, size: 12, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
