import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/placeholder_image.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const CachedImage({
    Key key,
    @required this.url,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => PlaceholderImage(),
      errorWidget: (context, url, error) => PlaceholderImage(),
      fit: this.fit,
    );
  }
}
