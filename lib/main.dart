import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/movies/Presentation/Controller/bloc/movie_details_bloc.dart';
import 'package:movie/movies/Presentation/Controller/bloc/movies_bloc.dart';
import 'package:movie/movies/Presentation/Screans/movies_screen.dart';
import 'core/network/remote/dio_helper/dio_helper.dart';

void main() {
  ServicesLocator.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<MovieDetailsBloc>(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: const MainMoviesScreen(),
      ),
    );
  }
}
