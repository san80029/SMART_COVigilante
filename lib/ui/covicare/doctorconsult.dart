import 'package:flutter/material.dart';
import 'package:SMART_COVigilante/utilities/constants.dart';
//import 'package:flutter_svg/svg.dart';

  class DoctorConsultationPage extends StatefulWidget {
  //WebViewController _webViewController;
  DoctorConsultationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DoctorConsultationPageState createState() => _DoctorConsultationPageState();
}

class _DoctorConsultationPageState extends State<DoctorConsultationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),
        ),
        body: Stack(  
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                      color: kSearchBackgroundColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                      child: TextField(
                      decoration: InputDecoration.collapsed(
                      hintText: 'Search for doctors',
                      ),
                      ),
                      ),
                  SizedBox(width: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      onPressed: () {},
                      color: kOrangeColor,
                      padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: Text(
                        "Search",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ),
                  ]
                ),
            )
        ]
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