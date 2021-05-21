import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';

class HomeCategories extends StatelessWidget {
  final Data homecategoriesdata;

  const HomeCategories({Key key, this.homecategoriesdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 70,
        width: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whitetexcolor,
                image: DecorationImage(
                  image: Svg(
                    '${homecategoriesdata.image}',
                    size: Size(27, 27),
                    color: secondarycolor,
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              '${homecategoriesdata.name}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
