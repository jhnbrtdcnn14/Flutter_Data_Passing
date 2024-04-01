import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefix;
  final Color cursorColor;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.cursorColor = Colors.grey,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: cursorColor,
        style: TextStyle(color: Colors.white), // Set text color to white

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.offwhite),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.lightgrey,
          filled: true,
          prefix: prefix,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class RightTextField extends StatelessWidget {
  final String hintText;
  final Widget? prefix;
  final Color cursorColor;
  final ValueChanged<String>? onChanged;

  const RightTextField({
    Key? key,
    required this.hintText,
    this.prefix,
    this.cursorColor = Colors.grey,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: TextField(
        textAlign: TextAlign.center,
        cursorColor: cursorColor,
        style: TextStyle(color: Colors.white), // Set text color to white

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.offwhite),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.lightgrey,
          filled: true,
          prefix: prefix,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class ImageWithTextField extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color cursorColor;
  final ValueChanged<String>? onChanged;

  const ImageWithTextField({
    Key? key,
    required this.imagePath,
    required this.text,
    this.cursorColor = Colors.grey,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(10), // Border radius of 10
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: const Color.fromARGB(0, 255, 255, 255),
                    width: 40,
                    height: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    imagePath,
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
            Expanded(
              child: RightTextField(
                hintText: text,
                cursorColor: cursorColor,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
