import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallas/providers/get_images_provider.dart';
import 'package:wallas/screens/home_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeMain(),
      ),
    );
  }
}
