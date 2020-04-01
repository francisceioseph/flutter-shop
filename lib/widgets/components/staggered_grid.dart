import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGrid extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool shrinkWrap;
  final ScrollPhysics physics;

  const StaggeredGrid({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
    this.shrinkWrap = false,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      shrinkWrap: shrinkWrap,
      physics: physics,
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(2);
      },
    );
  }
}
