import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';
import 'package:sellbag/provider/favorits_item_provider.dart';
import 'package:sellbag/screen/home_view_page/home_view_page.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  final Data prouductdata;
  final BuildContext context;

  const Product({Key key, this.prouductdata, this.context}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeViewPage(),
            ));
      },
      child: Container(
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
                          image: AssetImage('${widget.prouductdata.image}'),
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
                      '${widget.prouductdata.name}',
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
                      left: 12, bottom: 2, top: 2, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rs.${widget.prouductdata.prize}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: secondarycolor,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Rs.${widget.prouductdata.lineprize}',
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
                            '${widget.prouductdata.rating}',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: secondarycolor,
                            ),
                          ),
                          // Spacer(),
                          // GestureDetector(
                          //   onTap: () {
                          //     print("Add ");
                          //     context
                          //         .read<CartModel>()
                          //         .addToCart(widget.prouductdata);
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(bottom: 2),
                          //     child: Icon(
                          //       Icons.add_circle,
                          //       size: 27,
                          //       color: secondarycolor,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // setState(() {
                //   isFavorite = !isFavorite;
                // });
                // isFavorite
                //     ? context
                //         .read<FavoritsModel>()
                //         .addToFavorits(widget.prouductdata)
                //     : context
                //         .read<FavoritsModel>()
                //         .removeToFavorits(widget.prouductdata);
                // print(isFavorite);

                if (context.read<FavoritsModel>().getFavoritsList.contains((e) {
                  print("${e.id} == ${widget.prouductdata.id}");
                })) {
                  context
                      .read<FavoritsModel>()
                      .addToFavorits(widget.prouductdata);
                } else {
                  context
                      .read<FavoritsModel>()
                      .removeToFavorits(widget.prouductdata);
                }
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
                    color: context
                            .read<FavoritsModel>()
                            .getFavoritsList
                            .contains((e) => e.id == widget.prouductdata.id)
                        ? Colors.red
                        : Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
