import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SMART_COVigilante/utilities/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      ),
      resizeToAvoidBottomPadding: false,

      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              //color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Stack(
              children: <Widget>[
                //Image.asset("assets/images/virus2.png"),
                _buildHeader(),
              ],
            ),
          ),
          //SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(
                text: "Symptoms of ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: "COVID 19",
                    style: TextStyle(
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                _buildSymptomItem("assets/images/1.png", "Fever"),
                _buildSymptomItem("assets/images/2.png", "Dry Cough"),
                _buildSymptomItem("assets/images/3.png", "Headache"),
                _buildSymptomItem("assets/images/4.png", "Breathless"),
              ],
            ),
          ),
          //SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Prevention",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                _buildPrevention(
                    "assets/images/a10.png", "WASH", "hands often"),
                _buildPrevention("assets/images/a4.png", "COVER", "your cough"),
                _buildPrevention("assets/images/a6.png", "ALWAYS", "clean"),
                _buildPrevention("assets/images/a9.png", "USE", "mask"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                 // builder: (_) => StatisticPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/thermometer.png"),
                  SizedBox(width: 25),
                  RichText(
                    text: TextSpan(
                      text: "Tempreture Check",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 0.5,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, '/temperaturepage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (_) => StatisticPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/Cough.png"),
                  SizedBox(width: 25),
                  RichText(
                    text: TextSpan(
                      text: "Cough Check",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, '/coughdetectionpage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (_) => StatisticPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/zone.png"),
                  SizedBox(width: 25),
                  RichText(
                    text: TextSpan(
                      text: "Containment Zone",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, '/containmentzonepage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (_) => StatisticPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/socialcircle.png"),
                  SizedBox(width: 25),
                  RichText(
                    text: TextSpan(
                      text: "Create Social Circle",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, '/socialcirclepage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (_) => StatisticPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/discussion.png"),
                  SizedBox(width: 25),
                  RichText(
                    text: TextSpan(
                      text: "Discussion Forum",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, '/discussionforumPage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (_) => StatisticPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/healthreport.png"),
                  SizedBox(width: 25),
                  RichText(
                    text: TextSpan(
                      text: "Covi-Care",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, '/covicarePage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (_) => StatisticPage(),
                ),
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/analysis.png"),
                  SizedBox(width: 25),
                  RichText(
                    text: TextSpan(
                      text: "Covid Analysis Report",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      Navigator.pushNamed(context, '/covidanalysispage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          SizedBox(height: 100),
        ],
         ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/vrenvironmentpage');
              },
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

  Widget _buildPrevention(String path, String text1, String text2) {
    return Column(
      children: <Widget>[
        Container(
          width: 170,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Image.asset(path),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                    text: "$text1\n",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: text2,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ]),
              )
            ],
          ),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
      ],
    );
  }

  Widget _buildSymptomItem(String path, String text) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.backgroundColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(path),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.blue,
                  elevation: 10.0,
                  onPressed: () {
                    alertText(context);
                  },
                  child: Text(
                    "Alerts!",
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
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushNamed(context, '/emergencypage');
                  },
                  child: Text(
                    "EMERGENCY",
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
    );
  }

}

 void alertText(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("You are in Containment Zone"),
      content: Text("Kindly check all the safety measures!"),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text('OK'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );//AlertText
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return alertDialog;
  }
    );
}