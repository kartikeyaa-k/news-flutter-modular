import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldtimes/features/news_listing/cubit/news_listing_cubit.dart';
import 'package:worldtimes/features/news_listing/cubit/news_listing_state.dart';
import 'package:worldtimes/features/news_listing/news_listing_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
import 'package:worldtimes/features/splash/splash_screen.dart';

import '../unit/shared_mocks.mocks.dart';

void main() {
  late MockNewsListingCubit mockCubit;
  setUpAll(() {
    registerFallbackValue(NewsListingStateFake());
  });

  setUp(() {
    mockCubit = MockNewsListingCubit();
    when(() => mockCubit.state).thenReturn(const NewsListingState());
  });

  group('Splash Screen :', () {
    testWidgets('find logo text', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(
        home: SplashScreen(),
      ));

      expect(find.text('World Times'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });
  });

  group('News Listing Screen', () {
    testWidgets('find app bar text', (widgetTester) async {
      // arrange

      when(() => mockCubit.state)
          .thenAnswer((invocation) => const NewsListingState(
                status: NewsListingStateStatus.init,
                news: [],
              ));
      // test
      await widgetTester.pumpWidget(const TestApp(child: NewsListingScreen()));

      // expect
      expect(find.text('Top Headlines'), findsOneWidget);
    });
  });
}

class TestApp extends StatelessWidget {
  final Widget child;

  const TestApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsListingCubit(repository: MockINewsRepository()),
      child: MaterialApp(
        home: child,
      ),
    );
  }
}

class MockNewsListingCubit extends MockCubit<NewsListingState>
    implements NewsListingCubit {}

class NewsListingStateFake extends Fake implements NewsListingState {}
