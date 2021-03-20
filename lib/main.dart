import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trivia_app/Views/home_screen.dart';

import 'Views/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: "Trivia App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
        ),
        home: HomeScreen(),
      ),
    );
  }
}