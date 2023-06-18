import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldtimes/core/logs/primary_logger.dart';

/// {@template app_bloc_observer}
/// Custom [BlocObserver] that observes all bloc and cubit state changes.
/// {@endtemplate}
class AppStateObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppStateObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      primaryLogger.d('CurrentState : ${bloc.state.toString()}');
      primaryLogger.d('NextState : ${change.nextState.toString()}');
    }
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
  }
}
