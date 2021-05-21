import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sellbag/constants.dart';

class DrawerPage extends StatelessWidget {
  final BuildContext context;

  const DrawerPage({Key key, this.context}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      child: Drawer(
        child: ListView(
          children: [
            Container(
              height: 145,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primarycolor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      backgroundColor: secondarycolor,
                      maxRadius: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'John A. Calderon',
                          style: TextStyle(
                            color: whitetexcolor,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image(
                          image: Svg('assets/icons/drawer/home.svg'),
                          height: 23,
                        ),
                      ),
                      Text(
                        'HomePage',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: secondarytextcolor,
                  height: 2,
                  indent: 30,
                  endIndent: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}