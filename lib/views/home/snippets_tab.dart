import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../components/snippet_card.dart';

class SnippetsTab extends StatelessWidget {
  const SnippetsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 1,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) =>
            SnippetCard(
              name: 'snippet$index',
            ),
          staggeredTileBuilder: (int index) =>
            const StaggeredTile.fit(1),
        )
      ),
    );
  }
}
