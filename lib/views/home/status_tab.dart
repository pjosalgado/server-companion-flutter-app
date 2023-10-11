import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../components/status_card.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) =>
            StatusCard(
              name: 'server$index',
            ),
          staggeredTileBuilder: (int index) =>
            const StaggeredTile.fit(1),
        )
      ),
    );
  }
}
