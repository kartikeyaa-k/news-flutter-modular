import 'package:flutter/material.dart';
import 'package:worldtimes/core/utils/custom_navigation/navigator_transition.dart';

// Primary colors
const primaryAppColor = Color(0xFF5E56E7);
const secondaryAppColor = Color(0xFFF8F7FF);
// Shades
const greyShadeDarkest = Color(0xFF333333);
const greyShadeMedium = Color(0xFFA0A0A0);
const greyShadeLight = Color(0xFFF0F0F6);

// Display
const TextStyle displayLarge = TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.5,
  color: primaryAppColor,
);

const TextStyle displayMedium = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w600,
  letterSpacing: 1,
  color: primaryAppColor,
);
// Headline
const TextStyle headlineLarge = TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.w400,
);

const TextStyle headlineMedium = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

const TextStyle headlineSmall = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
);

// Title
const TextStyle titleLarge = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);

const TextStyle titleMedium = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);

const TextStyle titleSmall = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1,
);

// Body
const TextStyle bodyLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.20,
);

const TextStyle bodyMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

// Lable
const TextStyle labelLarge = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.25,
);

const TextStyle labelMedium = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.4,
);

const TextStyle labelSmall = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.5,
);
////

const TextTheme kTextThemeMontserrat = TextTheme(
  // Display
  displayLarge: displayLarge,
  displayMedium: displayMedium,
  // Headline
  headlineLarge: headlineLarge,
  headlineMedium: headlineMedium,
  headlineSmall: headlineSmall,
  // Title
  titleLarge: titleLarge,
  titleMedium: titleMedium,
  titleSmall: titleSmall,
  // Body
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium,
  //
  labelLarge: labelLarge,
  labelMedium: labelMedium,
  labelSmall: labelSmall,
);

final ThemeData primaryAppTheme = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: primaryAppColor,
  canvasColor: secondaryAppColor,
  cardColor: const Color(0xFFFFFFFF),
  textTheme: kTextThemeMontserrat,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CustomTransitionBuilder(),
      TargetPlatform.iOS: CustomTransitionBuilder(),
    },
  ),
);
