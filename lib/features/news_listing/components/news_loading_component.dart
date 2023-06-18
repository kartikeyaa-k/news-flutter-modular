import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsLoadingComponent extends StatelessWidget {
  const NewsLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Loading',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
