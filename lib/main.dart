import 'package:flutter/material.dart';
import 'package:getapi_using_provider/provider/anime_provider.dart';
import 'package:getapi_using_provider/provider/user_provider.dart';
import 'package:getapi_using_provider/screen/anime_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => AnimeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Anime_Screen(),
      ),
    );
  }
}
