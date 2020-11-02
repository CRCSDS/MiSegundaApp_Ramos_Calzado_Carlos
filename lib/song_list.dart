import 'package:basic_flutter_app/song_card.dart';
import 'package:flutter/material.dart';

import 'song_model.dart';

class SongList extends StatelessWidget {
  final List<Songs> songss;
  SongList(this.songss);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: songss.length,
      itemBuilder: (context, int) {
        return new SongCard(songss[int]);
      },
    );
  }
}
