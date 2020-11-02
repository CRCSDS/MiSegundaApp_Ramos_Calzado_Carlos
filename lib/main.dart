import 'package:flutter/material.dart';
import 'dart:async';

import 'song_model.dart';
import 'song_list.dart';
import 'new_song_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Favourite Songs: Rating Music',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Top Favourite Songs: Rating Music',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Songs> initialSongs = []

    ..add(Songs(name: 'Absolute in Doubt', description: 'Artist: Lil Peep, Invited: Wicca Phase Springs Eternal', location: 'Album: Crybaby', imageUrl: 'lib/assets/images/Crybaby.jpg'))
    ..add(Songs(name: 'I Have Been Waiting', description: 'Artist:  Lil Peep, ILoveMakonnen', location: 'Album: Everybody is Everything', imageUrl: 'lib/assets/images/I Have Been Waiting.jpg'))
    ..add(Songs(name: 'Take What You Want', description: 'Artist: Post Malone, Invited: Ozzy Osbourne, Travis Scott', location: 'Album: Hollywoods Bleeding', imageUrl: 'lib/assets/images/Hollywoods Bleeding.jpg'))
    ..add(Songs(name: 'IDGAF', description: 'Artist: Lil Peep', location: 'Album: Come Over When You are Sober, Pt. 2', imageUrl: 'lib/assets/images/Come Over When You are Sober, Pt. 2.jpg'))
    ..add(Songs(name: 'Lean With Me', description: 'Artist: Juice Wrld', location: 'Album: Goodbye & Good Riddance', imageUrl: 'lib/assets/images/Goodbye & Good Riddance.jpg'));

  Future _showNewSongForm() async {
    Songs newSong = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddSongFormPage();
    }));
    if (newSong != null) {
      initialSongs.add(newSong);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewSongForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1532178910-7815d6919875?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
              ),
              fit: BoxFit.cover
            )
          ),
          child: new Center(
            child: new SongList(initialSongs),
          )),
    );
  }
}
