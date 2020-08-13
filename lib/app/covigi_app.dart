import 'package:SMART_COVigilante/ui/home/vrenvironment.dart';
import 'package:flutter/material.dart';
import 'package:SMART_COVigilante/ui/home/intro_page.dart';
import 'package:SMART_COVigilante/ui/home/login_page.dart';
import 'package:SMART_COVigilante/ui/home/home_page.dart';
import 'package:SMART_COVigilante/ui/home/temperature_check.dart';
import 'package:SMART_COVigilante/ui/home/coughdetection_page.dart';
import 'package:SMART_COVigilante/ui/home/containmentzone_page.dart';
import 'package:SMART_COVigilante/ui/home/socailcircle_page.dart';
import 'package:SMART_COVigilante/ui/home/discussionform.dart';
import 'package:SMART_COVigilante/ui/home/ChatBot_page.dart';
import 'package:SMART_COVigilante/ui/home/emergency_page.dart';
import 'package:camera/camera.dart' as cameraPackage;
import 'package:SMART_COVigilante/ui/home/covid_analysis.dart';
import 'package:SMART_COVigilante/ui/home/covicare.dart';
import 'package:SMART_COVigilante/ui/covicare/chatdoctor.dart';
import 'package:SMART_COVigilante/ui/covicare/doctorconsult.dart';
import 'package:SMART_COVigilante/ui/covicare/generalcheckup.dart';
import 'package:SMART_COVigilante/ui/covicare/healthnews.dart';
import 'package:SMART_COVigilante/ui/covicare/healthreport.dart';

class CovigiApp extends StatelessWidget {
  static cameraPackage.CameraDescription firstCamera;
  static void getFirstCamera()async{
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await cameraPackage.availableCameras();

    // Get a specific camera from the list of available cameras.
    firstCamera = cameras.first;
    print("From covigi app.dart : firstCamera : "+firstCamera.toString());

  }

  @override
  Widget build(BuildContext context) {
    getFirstCamera();
    return MaterialApp(
        title: 'SMART COVigilante',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: IntroPage(title: 'SMART COVigilante'),
        routes: <String, WidgetBuilder>{
          '/loginpage' : (context) => LoginPage(title: 'SMART COVigilante'),
          '/homepage' : (context) => HomePage(title: 'SMART COVigilante'),
          '/temperaturepage' : (context) => TemperaturePage(title: 'Temperature Check',camera: firstCamera),
          '/coughdetectionpage' : (context) => CoughDetectionPage(title: 'Cough Check'),
          '/containmentzonepage' : (context) => ContainmentZonePage(title: 'Containment Zone Info'),
          '/socialcirclepage' : (context) => SocialCirclePage (title: 'Create Social Circle'),
          '/discussionforumPage' : (context) => DiscussionForumPage (title: 'Discussion Forum'),
          '/covicarePage' : (context) => CoviCarePage (title: 'Covi-Care'),
          '/chatbotpage' : (context) => ChatBotPage (title: 'Ask COGO!'),
          '/emergencypage' : (context) => EmergencyPage (title: 'Emergency Info'),
          '/covidanalysispage' : (context) => CovidAnalysisPage (title: 'Covid Analysis'),
          '/chatdoctorpage' : (context) => ChatDoctorPage (title: 'Chat With Doctor'),
          '/doctorconsultpage' : (context) => DoctorConsultationPage (title: 'Doctor Consultation'),
          '/generalcheckuppage' : (context) => GeneralCheckupPage (title: 'General Checkup'),
          '/healthnewspage' : (context) => HealthNewsPage (title: 'Covi-19 News'),
          '/healthreportpage' : (context) => HealthReportPage (title: 'Upload Your Health Reports'),
          '/vrenvironmentpage' : (context) => VrEnvironmentPage(title: 'Experience Virtual Reality'),
         }
    );

  }
}
