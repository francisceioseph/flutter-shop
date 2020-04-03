import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/page_slider_controller.dart';

class PageSlider extends StatefulWidget {
  final List<Widget> children;
  final PageSliderController controller;

  PageSlider({
    Key key,
    @required this.controller,
    @required this.children,
  }) : super(key: key);

  @override
  _PageSliderState createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: widget.controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        pageSnapping: true,
        children: widget.children,
      ),
    );
  }
}
