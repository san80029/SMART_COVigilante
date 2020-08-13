import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EmergencyPage extends StatefulWidget {
  //WebViewController _webViewController;
  EmergencyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  WebViewController _webViewController;
  String filePath = 'assets/html/coronvavirushelplinenumber.html';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),
        ),
        body: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _webViewController = webViewController;
            _loadHtmlFromAssets();
          },
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

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(
        Uri.dataFromString(fileHtmlContents, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString()
    );
  }
}