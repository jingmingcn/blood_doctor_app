import 'package:doctor/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../screens/main/image_capture.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  final String text, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              text: "$text\n",
              style: Theme.of(context).textTheme.headline6,
              children: [
                TextSpan(
                  text: title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            ),
            icon: SvgPicture.asset("assets/icons/Search.svg"),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageCapture(
                  title: '扫描报告',
                ),
              ),
            ),
            icon: SvgPicture.asset("assets/icons/camera.svg"),
          ),
        ],
      ),
    );
  }
}
