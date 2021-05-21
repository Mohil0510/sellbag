import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/screen/search_page/search.dart';

class CommonWidget {
  ///***********************************AppBar*************************************///

  static Widget appBar({
    String name,
    BuildContext context,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        '$name',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: whitetexcolor,
        ),
      ),

      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),

      iconTheme: IconThemeData(
        color: whitetexcolor,
      ),
      backgroundColor: secondarycolor,
      centerTitle: true,
      // elevation: 0.0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search_outlined,
          ),
          iconSize: 25,
          color: whitetexcolor,
          onPressed: () {
            Navigator.push(
              (context),
              MaterialPageRoute(
                builder: (context) => Search(),
              ),
            );
          },
        )
      ],
    );
  }
}
