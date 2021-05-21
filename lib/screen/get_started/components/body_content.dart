import 'package:flutter/material.dart';
import 'package:sellbag/model/slide.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({Key key, this.slidelist}) : super(key: key);
  final Slide slidelist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('${slidelist.image}'),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          '${slidelist.title}',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${slidelist.descripition}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
