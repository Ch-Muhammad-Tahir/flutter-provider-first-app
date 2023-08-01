import 'package:flutter/material.dart';
import 'package:provider_example/providers/count_provider.dart';
import 'package:provider_example/providers/home_provider.dart';
import 'package:provider_example/views/home_page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CountProvier>(create: (context) => CountProvier()),
      ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
    ],
    child: MaterialApp(
      home: MyHomePageScreenWidget(),
    ),
  ));
}
