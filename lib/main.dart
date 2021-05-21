import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:sellbag/provider/cart_item_provider.dart';
import 'package:sellbag/provider/favorits_item_provider.dart';
import 'package:sellbag/screen/bottom_bar/bottom_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
        ChangeNotifierProvider<FavoritsModel>(create: (_) => FavoritsModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'PTSans',
          scaffoldBackgroundColor: Colors.grey.shade200,
        ),
        home: BottomBarPage(),
      ),
    );
  }
}

