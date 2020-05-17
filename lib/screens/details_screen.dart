import 'package:daily_exercise/constants.dart';
import 'package:flutter/material.dart';
import '../widget/search_bar.dart';
import '../widget/bottom_nav_bar.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/meditation_bg.png",
                    ),
                    fit: BoxFit.fitWidth)),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text("Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 10,
                ),
                Text("3-10 MIN Course",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  // It just use the 60% width of screen
                  width: size.width * 0.6,
                  child: Text(
                    "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // 50% of width
                  width: size.width * 0.5,
                  child: Searchbar(),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
