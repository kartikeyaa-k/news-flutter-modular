import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldtimes/core/repository/news_repository/i_news_repository.dart';
import 'package:worldtimes/core/theme/primary_style.dart';
import 'package:worldtimes/features/news_listing/cubit/news_listing_cubit.dart';
import 'package:worldtimes/features/splash/splash_screen.dart';
import 'package:worldtimes/locator.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsListingCubit>(
          create: (_) =>
              NewsListingCubit(repository: locator.get<INewsRepository>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: primaryAppTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
