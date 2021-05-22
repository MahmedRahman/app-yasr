import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomImageCached extends StatelessWidget {
  CustomImageCached({@required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25)
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator()
        ),
        errorWidget: (context, url, error) => Center(
          child: CircularProgressIndicator()
        ),
      ),
    );
  }
}
