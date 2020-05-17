import 'package:daily_exercise/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widget/category.dart';
import './widget/bottom_nav_bar.dart';
import './screens/details_screen.dart';
import './widget/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Below size is full height and width of screen size of device
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // 45% height of screen height
            height: size.height * 0.45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                )),
          ),
          SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Color(0xFFF2BEA1),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset("assets/icons/menu.svg"),
                          )),
                      Text(
                        "Good Morning\nNick",
                        style: Theme.of(context).textTheme.display1.copyWith(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      Searchbar(),
                      Expanded(
                          child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: <Widget>[
                          CategoryCard(
                            title: "Diet Recommendation",
                            svgSrc: "assets/icons/Hamburger.svg",
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }));
                            },
                          ),
                          CategoryCard(
                            title: "Kegel Exercises",
                            svgSrc: "assets/icons/Excrecises.svg",
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }));
                            },
                          ),
                          CategoryCard(
                            title: "Meditation",
                            svgSrc: "assets/icons/Meditation.svg",
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }));
                            },
                          ),
                          CategoryCard(
                            title: "Yoga",
                            svgSrc: "assets/icons/yoga.svg",
                            press: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }));
                            },
                          )
                        ],
                      ))
                    ],
                  )))
        ],
      ),
    );
  }
}

