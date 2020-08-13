import 'package:flutter/material.dart';

class AppColors {
  static final Color backgroundColor = Color(0XFFefedf2);
  static final Color mainColor = Color(0XFF8d12fe);
}

final kHintTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

var kBackgroundColor = Color(0xffF9F9F9);
var kWhiteColor = Color(0xffffffff);
var kOrangeColor = Color(0xffEF716B);
var kBlueColor = Color(0xff4B7FFB);
var kYellowColor = Color(0xffFFB167);
var kTitleTextColor = Color(0xff1E1C61);
var kSearchBackgroundColor = Color(0xffF2F2F2);
var kSearchTextColor = Color(0xffC0C0C0);
var kCategoryTextColor = Color(0xff292685);