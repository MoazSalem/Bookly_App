import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_model/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/service_locator.dart';
import 'features/constants.dart';
import 'features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/book_details/presentation/views/book_details_view.dart';
import 'features/search/presentation/views/search_view.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    BestSellerCubit(getIt.get<HomeRepoImpl>())..fetchBestSellerBooks()),
            BlocProvider(
                create: (context) =>
                    FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks()),
            BlocProvider(
              create: (context) => HomeCubit(),
            )
          ],
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
                '/search': (context) => const SearchView(),
              }),
        ));
  }
}
