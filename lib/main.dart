import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/world_class_list/view_model/view_model.dart';
import 'package:untitled2/world_class_list/views/home_page/country_list.dart';
import 'world_class_list/views/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorldTimeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

