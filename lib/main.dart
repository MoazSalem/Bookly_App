import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/book_details/presentation/views/book_details_view.dart';
import 'features/constants.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: kPrimaryColor,
          systemNavigationBarColor: kPrimaryColor,
        ),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bookly',
            theme: ThemeData(
              brightness: Brightness.dark,
              textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
              useMaterial3: true,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark)
                      .copyWith(background: kPrimaryColor),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashView(),
              '/home': (context) => const HomeView(),
              '/book_details': (context) => const BookDetailsView(),
            }));
  }
}
