import 'package:daily_exercise/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child: SingleChildScrollView(
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
                    height: 20,
                  ),
                  SizedBox(
                    // 50% of width
                    width: size.width * 0.5,
                    child: Searchbar(),
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      SessionCard(
                        sessionNum: "01",
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: "02",
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: "03",
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: "04",
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: "05",
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: "06",
                        isDone: false,
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor)
                        ]),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg"),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Basic 2",
                                style: Theme.of(context).textTheme.subtitle),
                            Text("Start your deepen you practice")
                          ],
                        )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/icons/Lock.svg"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final String sessionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
            width: constraint.maxWidth / 2 - 10,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 23,
                      spreadRadius: -13,
                      color: kShadowColor)
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: press,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                          height: 35,
                          width: 36,
                          decoration: BoxDecoration(
                              color: isDone ? kBlueColor : Colors.white,
                              border: Border.all(color: kBlueColor),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.play_arrow,
                            color: isDone ? Colors.white : kBlueColor,
                          )),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Session $sessionNum",
                        style: Theme.of(context).textTheme.subtitle,
                      )
                    ],
                  ),
                ),
              ),
            )),
      );
    });
  }
}
