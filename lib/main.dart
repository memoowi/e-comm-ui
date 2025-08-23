import 'package:flutter/material.dart';
import 'package:flutter_pertama/models/category_model.dart';
import 'package:flutter_pertama/models/login_model.dart';
import 'package:flutter_pertama/screens/category_screen.dart';
import 'package:flutter_pertama/screens/main_screen.dart';
import 'package:flutter_pertama/screens/login_screen.dart';
import 'package:flutter_pertama/screens/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          titleLarge: GoogleFonts.quantico(),
          titleMedium: GoogleFonts.quantico(),
          titleSmall: GoogleFonts.quantico(),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIconColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.grey,
          titleTextStyle: GoogleFonts.quantico(),
          scrolledUnderElevation: 1,
          actionsPadding: EdgeInsets.only(right: 16),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      initialRoute: "/login",
      routes: {
        MainScreen.routeName: (context) {
          final LoginModel args =
              ModalRoute.of(context)!.settings.arguments as LoginModel;
          return MainScreen(loginModel: args);
        },
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        CategoryScreen.routeName: (context) {
          final CategoryModel args =
              ModalRoute.of(context)!.settings.arguments as CategoryModel;
          return CategoryScreen(category: args);
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
