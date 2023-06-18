import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimes/core/theme/primary_style.dart';

class NewsComponent extends StatelessWidget {
  final String title;
  final String description;
  final String imgURL;
  const NewsComponent({
    Key? key,
    required this.title,
    required this.description,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: imgURL,
              memCacheHeight: 350,
              memCacheWidth: 305,
              progressIndicatorBuilder: (context, url, progress) =>
                  const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              height: 162,
              width: (MediaQuery.of(context).size.width / 2) - 16,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            title.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0,
                ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
              description == ''
                  ? 'Description Not Available for this news post'.toUpperCase()
                  : description.toUpperCase(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: greyShadeMedium,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  )),
        ],
      ),
    );
  }
}
