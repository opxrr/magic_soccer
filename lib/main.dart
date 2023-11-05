import 'package:flutter/material.dart';
import 'package:magic_soccer/UI/questions_screen.dart';

import 'UI/login_screen.dart';
import 'UI/register_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 28
            )
        ),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        RegisterScreen.routeName : (_) => const RegisterScreen(),
        Login.routeName : (_) => const Login(),
        QuestionsScreen.routeName : (_) => QuestionsScreen(),
      },
      initialRoute: RegisterScreen.routeName,
    );
  }
}

