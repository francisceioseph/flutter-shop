import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final List<String> images;

  const ProductCarousel({
    Key key,
    this.images = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height * 0.45;

    return Container(
      child: CarouselSlider.builder(
        height: imageHeight,
        viewportFraction: 0.8,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          final imageSource = images[index];

          return Container(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                imageSource,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
