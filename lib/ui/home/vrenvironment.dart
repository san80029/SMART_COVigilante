import 'package:flutter/material.dart';
import 'package:video_player_360/video_player_360.dart';

class VrEnvironmentPage extends StatefulWidget {
  VrEnvironmentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VrEnvironmentPageState createState() => _VrEnvironmentPageState();
}

class _VrEnvironmentPageState extends State<VrEnvironmentPage>{


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),
        ),
          body: Center(
            child: RaisedButton(
              onPressed: () async {
                await VideoPlayer360.playVideoURL(
                    "https://github.com/stephangopaul/video_samples/blob/master/gb.mp4?raw=true");
              },
              child: Text("Click to play Video URL"),
            ),
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {},
                child: Image.asset("assets/images/augmented.png"),
                backgroundColor: Colors.yellow,
                highlightElevation: 100.0,
                tooltip:('Experience VR!'),
                heroTag: null,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chatbotpage');
                },
                child: Image.asset("assets/images/cogo.png"),
                backgroundColor: Colors.yellow,
                highlightElevation: 100.0,
                tooltip:('Ask Cogo!'),
                heroTag: null,
              )
            ],
          ),
        )
    );
  }
}