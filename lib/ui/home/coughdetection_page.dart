import 'package:flutter/material.dart';
import 'package:audio_streamer/audio_streamer.dart';
import 'dart:developer' as developer;
import 'dart:math';

//void main() {
//  runApp(new MyApp());
//}

class CoughDetectionPage extends StatefulWidget {
  //WebViewController _webViewController;
  CoughDetectionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CoughDetectionPageState createState() => _CoughDetectionPageState();
}

class _CoughDetectionPageState extends State<CoughDetectionPage> with SingleTickerProviderStateMixin{
  AudioStreamer _streamer = AudioStreamer();
  bool _isRecording = false;
  List<double> _audio = [];
  double max_amp=0.0;
  @override
  void initState() {
    super.initState();
  }

  void onAudio(List<double> buffer) {

    if(_isRecording){
      _audio.addAll(buffer);
//      double secondsRecorded =
//          _audio.length.toDouble() / _streamer.sampleRate.toDouble();

      setState(() {
        this.max_amp = buffer.reduce(max);
      });
      developer.log(" : _audio.reduce(max) : "+buffer.reduce(max).toString());
//      print('$secondsRecorded seconds recorded.');
//      print('-'*50);
    }else{
      _audio=[];
      max_amp=0;
    }



  }

  void start() async {
    try {
      _streamer.start(onAudio);
      setState(() {
        _isRecording = true;
      });
    } catch (error) {
      print(error);
    }
  }

  void stop() async {
    bool stopped = await _streamer.stop();
    developer.log("streamer_stopped : "+stopped.toString());
    setState(() {
      _isRecording = stopped;
    });
  }

  @override
  Widget build(BuildContext context) {
    developer.log("max_amp : inside app context : "+max_amp.toString()+" :_isRecording "+_isRecording.toString());

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      ),
      body: Center(
          child: Container(
              margin: EdgeInsets.all(25),
              child: Column(children: [
                Container(

                    color:Colors.black,
                    width:375.0,
                    height:400.0,
                    child:CustomPaint(
                      painter: canvasplotter(370.5, 370.5,max_amp),
                    )
                )
              ])
          )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: _isRecording ? Colors.red : Colors.green,
          onPressed: _isRecording ? stop : start,
          child: _isRecording ? Icon(Icons.stop) : Icon(Icons.mic)),
    );

  }

}

class canvasplotter extends CustomPainter{
  final double height;
  final double width;
  final double max_amplitude;
  List<int> numberList = new List<int>();



  var brushOne = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0
    ..isAntiAlias = true;

  var brushTwo = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill
    ..strokeWidth = 200
    ..isAntiAlias = true;

  var brushThree = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0
    ..isAntiAlias = true;

  var redPaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0
    ..isAntiAlias = true;

  var redPaint2 = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill
    ..strokeWidth = 200
    ..isAntiAlias = true;

  var orangePaint = Paint()
    ..color = Colors.orange
    ..style = PaintingStyle.fill
    ..strokeWidth = 200
    ..isAntiAlias = true;

  var yellowPaint = Paint()
    ..color = Colors.yellow
    ..style = PaintingStyle.fill
    ..strokeWidth = 200
    ..isAntiAlias = true;

  canvasplotter(this.height, this.width,this.max_amplitude);


  @override
  void paint(Canvas canvas, Size size) {


    canvas.drawLine(Offset(30,350),Offset(350,350), brushOne);
    canvas.drawLine(Offset(30,30),Offset(30,350), brushOne);
    canvas.drawLine(Offset(30,50),Offset(350,50), redPaint);
    canvas.drawCircle(Offset(30,50), 5, redPaint);
    canvas.drawCircle(Offset(350,50), 5, redPaint);

    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.red, fontSize: 13.0,
            fontFamily: 'monospace'), text: "Threshold level : 30 db");
    TextPainter tp = new TextPainter(
        text: span, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(50, 26));

    double y_plot = 350-(max_amplitude*300);

    developer.log("y_plot : "+y_plot.toString()+" : this.max_amplitude :"+this.max_amplitude.toString());
    String statusText = "Un Safe";

    if(y_plot>300){
      statusText="Start Speaking";
      TextSpan statusTextSpan = new TextSpan(
          style: new TextStyle(color: Colors.blue, fontSize: 15.0,
              fontFamily: 'monospace'), text: statusText);

      canvas.drawLine(Offset(130,350), Offset(130,y_plot), brushTwo);
      TextSpan span = new TextSpan(
          style: new TextStyle(color: Colors.blue, fontSize: 20.0,
              fontFamily: 'monospace'), text: (max_amplitude*30).abs().round().toString()+" db");

      TextPainter tp = new TextPainter(
          text: span, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(130, y_plot));
      tp = new TextPainter(
          text: statusTextSpan, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(180,100));
    }else if(y_plot>250 && y_plot<=350){
      statusText="Safe";
      TextSpan statusTextSpan = new TextSpan(
          style: new TextStyle(color: Colors.blue, fontSize: 15.0,
              fontFamily: 'monospace'), text: statusText);

      TextSpan span = new TextSpan(
          style: new TextStyle(color: Colors.black54, fontSize: 20.0,
              fontFamily: 'monospace'), text: (max_amplitude*30).abs().round().toString()+" db");
      TextPainter tp = new TextPainter(
          text: span, textDirection: TextDirection.ltr);
      tp.layout();
      canvas.drawLine(Offset(130,350), Offset(130,y_plot), orangePaint);
      tp.paint(canvas, new Offset(130, y_plot));
      tp = new TextPainter(
          text: statusTextSpan, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(180,100));
    }else if(y_plot>150 && y_plot<=250){
      statusText="Medium criticality";
      TextSpan statusTextSpan = new TextSpan(
          style: new TextStyle(color: Colors.blue, fontSize: 15.0,
              fontFamily: 'monospace'), text: statusText);

      TextSpan span = new TextSpan(
          style: new TextStyle(color: Colors.black54, fontSize: 20.0,
              fontFamily: 'monospace'), text: (max_amplitude*30).abs().round().toString()+" db");
      TextPainter tp = new TextPainter(
          text: span, textDirection: TextDirection.ltr);
      tp.layout();
      canvas.drawLine(Offset(130,350), Offset(130,y_plot), yellowPaint);
      tp.paint(canvas, new Offset(130, y_plot));
      tp = new TextPainter(
          text: statusTextSpan, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(180,100));
    }else{
      TextSpan statusTextSpan = new TextSpan(
          style: new TextStyle(color: Colors.blue, fontSize: 15.0,
              fontFamily: 'monospace'), text: statusText);

      TextSpan span = new TextSpan(
          style: new TextStyle(color: Colors.white, fontSize: 20.0,
              fontFamily: 'monospace'), text: (max_amplitude*30).abs().round().toString()+" db");
      canvas.drawLine(Offset(130,350), Offset(130,y_plot), redPaint2);
      TextPainter tp = new TextPainter(
          text: span, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(130, y_plot));
      tp = new TextPainter(
          text: statusTextSpan, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(240,100));
    }
  }

  @override
  bool shouldRepaint(canvasplotter oldDelegate) {
    bool status = oldDelegate.max_amplitude!=max_amplitude;
    developer.log("test: shouldRepaint : status : "+status.toString());
    return status;
  }


}



