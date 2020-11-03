import 'package:basic_flutter_app/song_model.dart';
import 'package:flutter/material.dart';

class AddSongFormPage extends StatefulWidget {
  @override
  _AddSongFormPageState createState() => new _AddSongFormPageState();
}

class _AddSongFormPageState extends State<AddSongFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  void submitSong(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.redAccent,
        content: new Text('You need to name a song!'),
      ));
    } else {
      var newDog = new Songs(name: nameController.text, location: locationController.text,
          description: descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new song'),
        backgroundColor: Colors.black87,
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

        /*color: Colors.black54,*/

        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(labelText: 'Song name'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: locationController,
                onChanged: (v) => locationController.text = v,
                decoration: new InputDecoration(labelText: "Song Album"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: descriptionController,
                onChanged: (v) => descriptionController.text = v,
                decoration: new InputDecoration(labelText: 'Song Artists'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new RaisedButton(
                    onPressed: () => submitSong(context),
                    color: Colors.transparent,
                    child: new Text('Submit Song'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
