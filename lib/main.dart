import 'package:bartaaapp/front/AgreeAndStar.dart';
import 'package:bartaaapp/frontpage_animation/core/viewmodels/home_model.dart';
import 'package:bartaaapp/screen/chat_screen.dart';
import 'package:bartaaapp/screen/grp_add.dart';
import 'package:bartaaapp/select_contact.dart';
import 'package:bartaaapp/wappHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:wappHome(),
      ),
    );
  }
}
