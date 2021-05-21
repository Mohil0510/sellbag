import 'package:flutter/material.dart';
import 'package:sellbag/screen/get_started/components/get_started_body.dart';
import 'package:sellbag/size_config.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(
      body: GetStartedBody(),
    );
  }
}