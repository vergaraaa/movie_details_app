import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//
import 'package:movie_details_app/routes/routes.dart';

Future main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Details App',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: 'home',
    );
  }
}
