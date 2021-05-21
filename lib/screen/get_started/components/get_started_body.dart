import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/data/list_data.dart';
import 'package:sellbag/model/slide.dart';
import 'package:sellbag/screen/get_started/components/body_content.dart';
import 'package:sellbag/screen/signup/sign_up.dart';
import 'package:sellbag/size_config.dart';

class GetStartedBody extends StatefulWidget {
  @override
  _GetStartedBodyState createState() => _GetStartedBodyState();
}

class _GetStartedBodyState extends State<GetStartedBody> {
  int currentPage = 0;
  List<Slide> slideData = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      slideData = slideList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 500,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) =>
                    setState(() => currentPage = index),
              ),
              items: slideData.map((Slide slideList) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: BodyContent(
                        slidelist: slideList,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        slideData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: secondarycolor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: whitetexcolor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? secondarycolor : secondarytextcolor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
