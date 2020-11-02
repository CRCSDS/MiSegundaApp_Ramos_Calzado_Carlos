import 'package:flutter/material.dart';
import 'song_model.dart';
import 'dart:async';

class SongDetailPage extends StatefulWidget {
  final Songs song;
  SongDetailPage(this.song);

  @override
  _SongDetailPageState createState() => new _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  final double SongAvarterSize = 150.0;
  double _sliderValue = 10.0;

  Widget get addYourRating {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new Slider(
                  activeColor: Colors.white,
                  min: 0.0,
                  max: 10.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              new Container(
                width: 50.0,
                alignment: Alignment.center,
                child: new Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  void updateRating() {
    if (_sliderValue == 0) {
      _ratingErrorDialog();
    } else {
      setState(() {
        widget.song.rating = _sliderValue.toInt();
      });
    }
  }

  Future<Null> _ratingErrorDialog() async {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Attention!'),
            content: new Text("Songs must contain a superior rating in this list"),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Please Try Again'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget get submitRatingButton {
    return new RaisedButton(
      onPressed: () => updateRating(),
      child: new Text('Rate it',
        style: TextStyle(color: Colors.black.withOpacity(0.7)),),
      color: Colors.white.withOpacity(0.6),
    );
  }

  Widget get songImage {
    return new Hero(
      tag: widget.song,
      child: new Container(
        height: SongAvarterSize,
        width: SongAvarterSize,
        constraints: new BoxConstraints(),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1f000000))
            ],
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage(widget.song.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 50.0,
          color: Colors.yellow,
        ),
        new Text(
          '${widget.song.rating}/10',
          style: Theme.of(context).textTheme.display2,
        )
      ],
    );
  }

  Widget get songProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 60.0),
      decoration: new BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1532178910-7815d6919875?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
              ),
              fit: BoxFit.cover
          )

        /*gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [.1, .5, .7, .9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400]
          ],
        ), */

      ),

      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          songImage,

          new Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 32.0, vertical: 15.0),
            child: new Text('${widget.song.name}', style: TextStyle(fontSize: 32.0),),
          ),

          /*new Text(
            '${widget.song.name}',
            style: TextStyle(fontSize: 35.0),
          ),*/


          /*new Text(
            widget.song.location,
            style: TextStyle(fontSize: 20.0),
          ),*/

          new Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0.0),
            child: new Text(widget.song.location, style: TextStyle(fontSize: 20.0),),
          ),

          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 15.0),
            child: new Text(widget.song.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        title: new Text('Song: "${widget.song.name}"'),
      ),
      body: new ListView(
        children: <Widget>[songProfile, addYourRating],
      ),
    );
  }
}
