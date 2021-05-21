import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({
    @required this.item,
    Key key,
    this.sum,
  }) : super(key: key);
  final Data item;
  final sum;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: whitetexcolor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage('${item.image}'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10, top: 10, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.name}',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Rs. ${item.prize}',
                            style: TextStyle(
                              fontSize: 15,
                              color: secondarycolor,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                                size: 18,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                '${item.rating}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: secondarytextcolor,
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 21,
                                width: 21,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/icons/circle.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage('assets/icons/minus.png'),
                                  color: secondarycolor,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                height: 21,
                                width: 21,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/icons/circle.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage(
                                    'assets/icons/sum.png',
                                  ),
                                  color: secondarycolor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  width: 2,
                  color: primarytextcolor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
