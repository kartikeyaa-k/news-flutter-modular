import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldtimes/core/theme/primary_style.dart';

class PullToRefreshCustomHeader extends StatelessWidget {
  const PullToRefreshCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const WaterDropHeader(
        waterDropColor: primaryAppColor,
        idleIcon: Icon(Icons.arrow_downward, color: secondaryAppColor));
  }
}
