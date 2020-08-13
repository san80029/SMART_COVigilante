import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SMART_COVigilante/utilities/constants.dart';
import 'package:flutter/rendering.dart';
//import 'package:SMART_COVigilante/utilities/utils.dart';

class TemperaturePage extends StatefulWidget {

  final CameraDescription camera;

  TemperaturePage({Key key, this.title, Key key2, this.camera}) : super(key: key);
  final String title;

  @override
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  CameraController cameraController;
  Future<void> _cameraControllerInit;
  bool isFilterOn;
  String statusText = "Scan is idle";
  bool isPressed = false;
  @override
  void initState() {
    super.initState();
    cameraController =
    new CameraController(widget.camera, ResolutionPreset.high);
    if (cameraController != null) {
      setState(() {
        _cameraControllerInit = cameraController.initialize();
        isFilterOn=false;

        print("Is camera controller initialized : "+cameraController.value.isInitialized.toString()+"  : "+widget.camera.toString());
      });
    } else {
      print("Controller is null : try ");
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    cameraController.dispose();
    super.dispose();
    print("Camera Controller is disposed off.");
  }

  @override
  Widget build(BuildContext context) {
    List<Rect> faceRectsFromCam = new List<Rect>();
    double height_ = MediaQuery.of(context).size.height;
    double width_ = MediaQuery.of(context).size.width;

    Widget _buildactionbutton(double height) {

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:EdgeInsets.only(left: 0.0,top:height*0.8,bottom: 0.0,right: 0.0),
//        padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.green,
                    elevation: 10.0,
                    onPressed: () {
                      setState(() {
                        isFilterOn=true;
                      });
                    },
                    child: Text(
                      "Start Scan",
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
                    color: Colors.orange,
                    onPressed: () {
                      setState(() {
                        isFilterOn=false;
                        isPressed=true;
                      });
                    },
                    child: Text(
                      "Stop Scan",
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




    if(isFilterOn==true){
      statusText="Started Scanning...";
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
                      padding: EdgeInsets.only(top: 0, bottom: 10),
                      child: Stack(
                        children: <Widget>[
                          ColorFiltered(
                              colorFilter: ColorFilter.mode(Colors.redAccent.withOpacity(0.3), BlendMode.srcOver),
                              child:Container(

                                child: FutureBuilder<void>(
                                  future: _cameraControllerInit,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      // If the Future is complete, display the preview.
                                      return Container(
                                          height:height_,
                                          width:width_,
                                          child: CustomPaint(
                                            foregroundPainter: plotFaceOnCoordinates(height_, width_,cameraController,statusText),
                                            child: CameraPreview(cameraController),
                                          )
                                      );
                                    } else {
                                      // Otherwise, display a loading indicator.
                                      return Center(child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              )
                          ),
                          _buildactionbutton(height_),
                        ],

                      ),
                    )
                  ]
              )
          )
      );
    }else{
      if(isPressed == true){
        statusText="Temperature is normal\n 98 F";
      }
      else{
        statusText="Scan is idle";
      }

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
                      padding: EdgeInsets.only(top: 0, bottom: 10),
                      child: Stack(
                        children: <Widget>[
                          ColorFiltered(
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.0), BlendMode.srcOver),
                              child:Container(

                                child: FutureBuilder<void>(
                                  future: _cameraControllerInit,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      // If the Future is complete, display the preview.
                                      return Container(
                                          height:height_,
                                          width:width_,
                                          child: CustomPaint(
                                            foregroundPainter: plotFaceOnCoordinates(height_, width_,cameraController, statusText),
                                            child: CameraPreview(cameraController),
                                          )
                                      );
                                    } else {
                                      // Otherwise, display a loading indicator.
                                      return Center(child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              )
                          ),
                          _buildactionbutton(height_),
                        ],

                      ),
                    )
                  ]
              )
          )
      );
    }









  }

// core method to start temperature analysing


}

List<Rect>  analyseTemperature(cameraController) {
//detect the face
  // get the detected face coordinates
  //plot up the readings on the coordinate box as floating areas
  print("Inside analyse temperature ");
  FirebaseVisionImage visionImage;
  Future<List<Face>> testFaces;
  List<Face> facesList;
  List<Rect> faceRects=new List<Rect>();
  Rect rect;
  FirebaseVisionImageMetadata metadata;
  String test;
  cameraController
      .startImageStream((image) => {




//    metadata = FirebaseVisionImageMetadata(
//        rawFormat: image.format.raw,
//        size: Size(image.width.toDouble(),image.height.toDouble()),
//        planeData: image.planes.map((currentPlane) => FirebaseVisionImagePlaneMetadata(
//            bytesPerRow: currentPlane.bytesPerRow,
//            height: currentPlane.height,
//            width: currentPlane.width
//        )),
//        rotation: ImageRotation.rotation0
//    ),
//
//    visionImage =
//        FirebaseVisionImage.fromBytes(image.planes[0].bytes, metadata),
//
//
//
//
//    print("visionImage : "+visionImage.toString()),
//    testFaces = FirebaseVision.instance
//        .faceDetector()
//        .processImage(visionImage),
//    testFaces
//        .then((faces) => {
//      print("faces : faces : "+faces.length.toString()),
//      for (int i=0; i< faces.length; i++)
//        {rect = faces[i].boundingBox, faceRects.add(rect),
//          print("from analyseTemperature : "+rect.topLeft.toString())}
//    })
//        .catchError((onError) => {
//      print("error obtained : "+onError.toString())
//    }),

/*
    detect(image,FirebaseVision.instance.faceDetector().processImage,ImageRotation.rotation0).then((value) => {
      print("Inside detect function"),
      facesList=value,
      print("FaceList  : "+facesList.length.toString()),
      for(int i=0; i<value.length;i++){
        print("Inside face loop : "+value[i].boundingBox.topLeft.toString()),
        faceRects.add(facesList[i].boundingBox),
      }

    }).catchError((onError)=>{
      print("Error captured : "+onError.toString())
    }),
*/

  });
  print("final rectSize  face rects :"+faceRects.length.toString());



  return faceRects;
}


class plotFaceOnCoordinates extends CustomPainter{
  final double height;
  final double width;
  final cameraController;
  final statusText;
  List<Rect> faces;



  plotFaceOnCoordinates(this.height, this.width, this.cameraController,this.statusText);

  var yellowPaint = new Paint()..color=(Colors.yellow)..style=(PaintingStyle.stroke)..strokeWidth=(1);

  @override
  void paint(Canvas canvas, Size size) {

    TextSpan statusTextSpan = new TextSpan(
        style: new TextStyle(color: Colors.blue, fontSize: 15.0,
            fontFamily: 'monospace'), text: statusText);
    TextPainter tp = new TextPainter(
        text: statusTextSpan, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(130, 130));
    print("Paint method started : ***********");
    this.faces= analyseTemperature(cameraController);
    print("from customPaint : "+faces.length.toString());
    for(Rect rect in faces){
      print("from customPaint : "+rect.topLeft.toString());
      canvas.drawRect(rect, yellowPaint);
    }


  }

  @override
  bool shouldRepaint(plotFaceOnCoordinates oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
