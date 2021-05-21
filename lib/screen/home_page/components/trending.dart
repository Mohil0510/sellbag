import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';
import 'package:provider/provider.dart';
import 'package:sellbag/provider/favorits_item_provider.dart';
import 'package:sellbag/screen/home_view_page/home_view_page.dart';

class Trending extends StatelessWidget {
  final Data trendingdata;

  const Trending({Key key, this.trendingdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeViewPage(),
              ));
        },
        child: Container(
          height: 140,
          width: 120,
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
                      padding:
                          const EdgeInsets.only(top: 14, left: 14, right: 14),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                          image: DecorationImage(
                            image: AssetImage('${trendingdata.image}'),
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 2, top: 5),
                    child: Text(
                      '${trendingdata.name}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, bottom: 8, right: 12),
                    child: Row(
                      children: [
                        Text(
                          'Rs.${trendingdata.prize}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: secondarycolor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 15,
                        ),
                        Text(
                          '${trendingdata.rating}',
                          style: TextStyle(
                            fontSize: 11,
                            color: secondarytextcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.read<FavoritsModel>().addToFavorits(trendingdata);
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
        ),
      ),
    );
  }
}
