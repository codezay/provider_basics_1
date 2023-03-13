import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics_1/pages/home_page.dart';
import 'package:provider_basics_1/provider/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      // builder: (context, child) {
      //   // No longer throws
      //   return Text(
      //     context.watch<FavoriteProvider>().toString(),
      //   );
      // },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'Home Page'),
      ),
    );
  }
}
