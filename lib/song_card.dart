import 'package:basic_flutter_app/song_model.dart';
import 'song_detail_page.dart';
import 'package:flutter/material.dart';

class SongCard extends StatefulWidget {
  final Songs song;

  SongCard(this.song);

  @override
  _SongCardState createState() => _SongCardState(song);
}

class _SongCardState extends State<SongCard> {
  Songs song;
  String renderUrl;
  String image;

  _SongCardState(this.song);

  void initState() {
    super.initState();
    /*renderDogPic();*/
  }

  Widget get songImage {
    var songAvatar = new Hero(
      tag: song,
      child: new Container(
        width: 110.0,
        height: 110.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage(widget.song.imageUrl ?? ''))),
      ),
    );

    var placeholder = new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black45, Colors.black12, Colors.white])),
      alignment: Alignment.center,
      child: new Text(
        'SONG',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = new AnimatedCrossFade(
      firstChild: songAvatar,
      secondChild: placeholder,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1500),
    );

    return crossFade;
  }

  /*void renderDogPic() async {
    await dog.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = dog.imageUrl;
      });
    }
  }

   */

  Widget get songCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290,
        height: 120,
        child: new Card(
          color: Colors.transparent,
          child: new Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 1, left: 80),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  widget.song.name,
                  style:TextStyle(fontSize: 20.0),
                  /*style: Theme.of(context).textTheme.headline,*/
                ),
                new Text(
                  widget.song.location,
                  style:TextStyle(fontSize: 15.0)
                  /*style: Theme.of(context).textTheme.subhead,*/
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.star),
                    new Text('=> ${widget.song.rating}/10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new SongDetailPage(song);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => showDogDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              songCard,
              new Positioned(top: 5, child: songImage),
            ],
          ),
        ),
      ),
    );
  }
}
