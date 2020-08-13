import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SMART_COVigilante/utilities/config.dart';
import 'package:SMART_COVigilante/utilities/constants.dart';


class CoviCarePage extends StatefulWidget {
  //WebViewController _webViewController;
  CoviCarePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CoviCarePageState createState() => _CoviCarePageState();
}

class _CoviCarePageState extends State<CoviCarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildMainTitle(),
                _buildMyLocation(),
              ],
            ),
            SizedBox(height: 36),
            _buildAppTitle('What are you looking for ?'),
            SizedBox(height: 36),

            // Make a horizontal Listview
            Container(
              height: 60,
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
                  IconButton(
                    icon: Icon(
                        FontAwesomeIcons.heartbeat,
                        color: Config.blueColor,
                        size: 44,
                        ),
                  ),
                  SizedBox(width: 30),
                  RichText(
                    text: TextSpan(
                      text: "General Check Up",
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
                      Navigator.pushNamed(context, '/generalcheckuppage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
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
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.commentMedical,
                      color: Config.redColor,
                      size: 44,
                    ),
                  ),
                  SizedBox(width: 30),
                  RichText(
                    text: TextSpan(
                      text: "Chat With Doctor",
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
                      Navigator.pushNamed(context, '/chatdoctorpage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
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
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.userMd,
                      color: Config.greenColor,
                      size: 44,
                    ),
                  ),
                  SizedBox(width: 30),
                  RichText(
                    text: TextSpan(
                      text: "Doctor Consultation",
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
                      Navigator.pushNamed(context, '/doctorconsultpage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
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
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.fileUpload,
                      color: Config.primaryColor,
                      size: 44,
                    ),
                  ),
                  SizedBox(width: 30),
                  RichText(
                    text: TextSpan(
                      text: "Upload Health Reports",
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
                      Navigator.pushNamed(context, '/healthreportpage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
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
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.rss,
                      color: Config.orangeColor,
                      size: 44,
                    ),
                  ),
                  SizedBox(width: 30),
                  RichText(
                    text: TextSpan(
                      text: "Covi News",
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
                      Navigator.pushNamed(context, '/healthnewspage');
                    },
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(height: 36),
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

  _buildAppTitle(String title) {
    return Text(
      title,
      style: Config.titleStyle,
    );
  }

  _buildMyLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(FontAwesomeIcons.mapMarkerAlt,
            color: Config.primaryColor, size: 14),
        SizedBox(width: 4),
        Text(
          'Near By',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Config.primaryColor,
          ),
        ),
        SizedBox(width: 4),
        Icon(FontAwesomeIcons.chevronDown,
            color: Config.primaryColor, size: 14),
      ],
    );
  }

  _buildMainTitle() {
    return RichText(
        text: TextSpan(
            text: 'Covi',
            style: GoogleFonts.poppins(
              color: Config.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '-care',
                style: GoogleFonts.poppins(
                  color: Config.redColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]));
  }
}
