import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';


class SearchBar extends StatelessWidget {
  final String title;

  const SearchBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            cursorColor: secondarycolor,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: secondarycolor,
              ),
              border: InputBorder.none,
              hintText: '$title',
              hintStyle: TextStyle(
                color: Colors.grey[350],
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
