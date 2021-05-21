import 'package:flutter/material.dart';
import 'package:sellbag/model/item.dart';
import 'package:sellbag/provider/favorits_item_provider.dart';
import 'package:sellbag/screen/drawer_page/drawer_Page.dart';
import 'package:sellbag/screen/my_favorite_page/components/my_favorite_prouduct.dart';
import 'package:sellbag/widget/common_widget.dart';
import 'package:provider/provider.dart';

class MyFavorits extends StatefulWidget {
  @override
  _MyFavoritsState createState() => _MyFavoritsState();
}

class _MyFavoritsState extends State<MyFavorits> {
  List<Data> myfavoriteitem = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        myfavoriteitem = context.read<FavoritsModel>().getFavoritsList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(
        name: 'My Favorits',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          shrinkWrap: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: myfavoriteitem.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return MyFavoriteProuduct(
              prouductdata: myfavoriteitem[index],
              context: context,
            );
          },
        ),
      ),
      drawer: DrawerPage(
        context: context,
      ),
    );
  }
}
