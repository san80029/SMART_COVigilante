import 'package:flutter/material.dart';


class HealthReportPage extends StatefulWidget {
  //WebViewController _webViewController;
  HealthReportPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HealthReportPageState createState() => _HealthReportPageState();
}

class _HealthReportPageState extends State<HealthReportPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 200),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      elevation: 10.0,
                      onPressed: () {
                      },
                      child: Text(
                        "Browse file",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: RaisedButton(
                      elevation: 10.0,
                      color: Colors.purple,
                      onPressed: () {

                      },
                      child: Text(
                        "Upload File",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
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