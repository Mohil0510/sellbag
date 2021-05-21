import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/model/item.dart';
import 'package:sellbag/provider/cart_item_provider.dart';
import 'package:sellbag/screen/drawer_page/drawer_Page.dart';
import 'package:sellbag/screen/my_cart_page/components/my_cart_body.dart';
import 'package:sellbag/widget/common_widget.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool valuesecond = false;
  List<Data> cartItems = [];
  int sum = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        cartItems = context.read<CartModel>().getCartList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(
        name: 'My Cart',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.64,
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return MyCartBody(
                        item: cartItems[index],
                        sum: sum,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade100,
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: whitetexcolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seleceted Itemes ${context.read<CartModel>().getCartList.length}',
                      style: TextStyle(
                        fontSize: 17,
                        color: primarytextcolor,
                      ),
                    ),
                    Text(
                      'Total :  Rs.00.00',
                      style: TextStyle(
                        fontSize: 17,
                        color: primarytextcolor,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: secondarycolor,
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 17,
                      color: whitetexcolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerPage(
        context: context,
      ),
    );
  }
}
