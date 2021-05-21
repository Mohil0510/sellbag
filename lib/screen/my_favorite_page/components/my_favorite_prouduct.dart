import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';
import 'package:sellbag/provider/favorits_item_provider.dart';
import 'package:provider/provider.dart';

class MyFavoriteProuduct extends StatelessWidget {
  final Data prouductdata;
  final BuildContext context;

  const MyFavoriteProuduct({
    Key key,
    this.prouductdata,
    this.context,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whitetexcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                      image: DecorationImage(
                        image: AssetImage('${prouductdata.image}'),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 5, right: 12),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    '${prouductdata.name}',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, bottom: 3, top: 4, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Rs.${prouductdata.prize}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: secondarycolor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Rs.${prouductdata.lineprize}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2.5,
                            decorationColor: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: secondarytextcolor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 15,
                        ),
                        Text(
                          '${prouductdata.rating}',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: secondarycolor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.read<FavoritsModel>().removeToFavorits(prouductdata);
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: Image(
                  image: Svg(
                    'assets/icons/like.svg',
                    size: Size(20, 20),
                  ),
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
