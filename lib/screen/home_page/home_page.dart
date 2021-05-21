import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';
import 'package:sellbag/model/slide.dart';
import 'package:sellbag/data/list_data.dart';
import 'package:sellbag/widget/common_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sellbag/screen/drawer_page/drawer_Page.dart';
import 'package:sellbag/screen/home_page/components/prouduct.dart';
import 'package:sellbag/screen/home_page/components/trending.dart';
import 'package:sellbag/screen/home_page/components/home_categories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int sum = 0;
  List<Slide> list = [];
  List<Data> home = [];
  List<Data> trending = [];
  List<Data> prouduct = [];
  var showOnlyFavorites = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      home = homecategorieslistdata;
      trending = trendinglistdata;
      prouduct = prouductlistdata;
      list = homeSlideList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(
        name: 'Sell Bag ',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 155,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) =>
                      setState(() => currentIndex = index),
                ),
                items: list.map((Slide homeSlideList) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: AssetImage('${homeSlideList.image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 6,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list
                      .map((item) => Container(
                            margin: EdgeInsets.all(3),
                            height: 7,
                            width: item.id == currentIndex ? 20 : 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: item.id == currentIndex
                                  ? secondarycolor
                                  : primarycolor,
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                  bottom: 10,
                ),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: home.map((Data homecategoriesdata) {
                      return HomeCategories(
                        homecategoriesdata: homecategoriesdata,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                  bottom: 10,
                ),
                child: Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 17,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: trending.map((Data trendingdata) {
                      return Trending(
                        trendingdata: trendingdata,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                ),
                child: Text(
                  'Prouduct May Like',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 3.58,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GridView.count(
                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    padding: const EdgeInsets.all(10),
                    children: prouduct.map((Data prouductdata) {
                      return Product(

                        prouductdata: prouductdata,
                        context: context,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerPage(
        context: context,
      ),
    );
  }
}
