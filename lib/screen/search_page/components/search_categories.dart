import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';

class SearchCategories extends StatelessWidget {
  final Data searchcategoriesdata;

  const SearchCategories({Key key, this.searchcategoriesdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: whitetexcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 12,
                left: 12,
                right: 12,
              ),
              decoration: BoxDecoration(
                color: primarycolor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                image: DecorationImage(
                  image: Svg(
                    searchcategoriesdata.image,
                    color: whitetexcolor,
                  ),
                  scale: 2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              searchcategoriesdata.name,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
