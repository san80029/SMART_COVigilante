import 'dart:convert';
import 'package:SMART_COVigilante/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/widgets.dart';
import 'webview.dart';

class HealthNewsPage extends StatefulWidget {
  //WebViewController _webViewController;
  HealthNewsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HealthNewsPageState createState() => _HealthNewsPageState();
}

class _HealthNewsPageState extends State<HealthNewsPage>{
  FlutterTts tts = FlutterTts();
  getnews() async {
    var url = 'http://api.coronatracker.com/news/trending?limit=10&offset&country=India&countryCode&sortBy=publishedAt&';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    List<News> newslist = List<News>();
    for (var article in result['items']) {
      News news = News(article['title'],article['urlToImage'],article['url'],article['description']);
      newslist.add(news);
    }
    return newslist;
  }

  speak(String text) async {
    await tts.setLanguage('en-IN');
    await tts.setPitch(1);
    await tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),
        ),
        resizeToAvoidBottomPadding: false,

        backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /*
            Container(
              margin: EdgeInsets.only(top: 30.0),
              alignment: Alignment.center,
              child: Text(
                "Covid-19 News",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),

             */
            FutureBuilder(
                future: getnews(),
                builder: (BuildContext context, dataSnapshot) {
                  if (!dataSnapshot.hasData){
                    return Center(child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dataSnapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          padding: EdgeInsets.only(top:10.0),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              //                   Expanded(
                              // child: SizedBox(
                              //   height: 200.0,),),
                              Text(dataSnapshot.data[index].title,style: GoogleFonts.montserrat(
                                  fontSize:15,
                                  fontWeight:FontWeight.w400
                              ),
                              ), //text
                              Image(image: NetworkImage(
                                  dataSnapshot.data[index].image),
                                fit: BoxFit.cover,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  //     InkWell(
                                  //       onTap: ()=>speak(dataSnapshot.data[index].description),
                                  //     ),
                                  //   Icon(Icons.play_arrow,color: Colors.green,),
                                  //   Icon(Icons.stop,color: Colors.red,),
                                  RaisedButton(
                                    color: Colors.blueAccent,
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder:(context)=>ViewWeb(dataSnapshot.data[index].url))
                                      );
                                    },child: Text("View",style: GoogleFonts.montserrat(
                                      color:Colors.black,
                                      fontSize: 15
                                  ),
                                  ),)
                                ],)
                            ], //widget
                          ), //column
                        );//container
                      }); //listview.builder
                })
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
}
class News {
  final String title;
  final String image;
  final String url;
  final String description;

  News(this.title, this.image, this.url, this.description);


}