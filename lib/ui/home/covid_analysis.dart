import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class CovidAnalysisPage extends StatefulWidget {
  //WebViewController _webViewController;
  CovidAnalysisPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CovidAnalysisPageState createState() => _CovidAnalysisPageState();
}

class _CovidAnalysisPageState extends State<CovidAnalysisPage>{
  WebViewController _webViewController;
  var URL = 'https://covidindia.org/#';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),
        ),
        body: WebView(
          initialUrl: URL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _webViewController = webViewController;
           // _loadHtmlFromAssets();
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
/*
  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(
        Uri.dataFromString(fileHtmlContents, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString()
    );
  }
 */
}