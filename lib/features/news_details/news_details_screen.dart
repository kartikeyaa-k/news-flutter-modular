import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimes/core/theme/primary_style.dart';
import 'package:zoom_widget/zoom_widget.dart';

class NewsDetails extends StatelessWidget {
  final String imageUrl;
  final String id;
  const NewsDetails({
    super.key,
    required this.id,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryAppColor,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Zoom(
              initTotalZoomOut: true,
              child: Center(
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.height,
                    width:MediaQuery.of(context).size.width,

                imageUrl: imageUrl,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, progress) =>
                    const CupertinoActivityIndicator(),
              )),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 64.0, right: 12.0),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
          ],
        ));
  }
}
