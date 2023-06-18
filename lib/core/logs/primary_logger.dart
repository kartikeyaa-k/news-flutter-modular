import 'package:logger/logger.dart';

final primaryLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
  ),
);
