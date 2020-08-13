import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:SMART_COVigilante/utilities/containment_zone_data.dart' as zoneMapData;

class ContainmentZonePage extends StatefulWidget {
  //WebViewController _webViewController;

  ContainmentZonePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContainmentZonePageState createState() => _ContainmentZonePageState();
}

class _ContainmentZonePageState extends State<ContainmentZonePage> {

  static String zoneMap = zoneMapData.containmentZoneData.zoneMap;


  static var parsedJson = json.decode(zoneMap);
  static bool markerVisibility = false;

  static testData(){
    print("parsedJson : "+parsedJson.toString());
    List<dynamic> data = parsedJson["result"];
    for(int i=0;i<data.length;i++){
      print("City names : "+data[i]["city"]);
      String lati = data[i]["lat"];
      String lngi = data[i]["lng"];
      print("lati : "+lati+" lngi : "+lngi);
      double latid = double.tryParse(lati);
      double longid = double.tryParse(lngi);
      setCircle(new LatLng(latid,longid),0.8*double.tryParse(data[i]["affected"]),i, data[i]["affected"]);
    }

  }

//  GoogleMapController mapController;
  static Set<Circle> _circle = HashSet<Circle>();
  static Set<Marker> _marker = HashSet<Marker>();
  static Position position_global;

  static Future<Position> populateCenter() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    position_global = position;
    return position_global;
  }

  void _onGeoChanged(CameraPosition position){
//  print("test canera position  "+position.zoom.toString());
  }

//  void _onMapCreated(GoogleMapController controller) {
//    mapController = controller;
//  }
  static void setCircle(LatLng point, double radius,int i,String affected){
    final String circleIdVal = "current_location_circle"+i.toString();
    final String markerIdVal = "current_location_marker"+i.toString();
    final double _affected = double.tryParse(affected);
    _circle.add(Circle(
        circleId: CircleId(circleIdVal),
        center:point,
        radius:radius,
        fillColor: Colors.redAccent.withOpacity(0.5),
        strokeWidth: 2,
        strokeColor: Colors.redAccent

    ));
    if(_affected > 3000){
      markerVisibility=true;
    }else{
      markerVisibility=false;
    }
    _marker.add(Marker(
        markerId: MarkerId(markerIdVal),
        infoWindow:InfoWindow(title:"Affected "+affected,),
        visible: markerVisibility,
        position:point

    ));
  }
  @override
  Widget build(BuildContext context) {
    testData();
    // TODO: implement build
//    LatLng _center;
    GoogleMapController mapController;

    Future<Position> test = populateCenter();
    String latitude;
    String longitude;

    test
        .then((value) => {
      latitude = value.latitude.toString(),
      longitude = value.longitude.toString()
    })
        .catchError((err) => print("error obtained in geolocator : " + err));
    test.whenComplete(
            () => {print("FROM COMPLETE : " + latitude + " : " + longitude)});



    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }



//    Set<Circle> circles = Set.from([Circle(
//      circleId: CircleId("test_circle"),
//      center: LatLng(latitude as double, longitude as double),
//      radius: 4000,
//    )]);


//      theme: ThemeData(
//        primarySwatch: Colors.deepPurple,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.deepPurple,
          ),
          body: FutureBuilder<Position>(
            future: populateCenter(),
            builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator()
                );
              } else {
                if (snapshot.hasError)
                  return Center(child: Text('Error: ${snapshot.error}'));
                else{
                  setCircle(new LatLng(snapshot.data.latitude as double, snapshot.data.longitude as double),1200,40,"3100");
                  return GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(snapshot.data.latitude as double,
                          snapshot.data.longitude as double),
                      zoom: 11.0,
//                        circles:CircleMarker( //radius marker
//                            point: LatLng(latitude as double, longitude as double),
//                            color: Colors.blue.withOpacity(0.3),
//                            borderStrokeWidth: 3.0,
//                            borderColor: Colors.blue,
//                            radius: 100 //radius
//                        )
                    ),
                    zoomGesturesEnabled: true,
                    onCameraMove:(CameraPosition cameraPosition){
//                        print("Camera Zoom level"+cameraPosition.zoom.toString());
                    },
                    myLocationEnabled:true,circles:_circle,markers: _marker,
                  );
                }
//                  return Center(child: new Text('${snapshot.data.latitude} : ${snapshot.data.longitude}'));
// snapshot.data  :- get your object which is pass from your downloadData() function

              }
            },
          )

//          Container(
//            padding: EdgeInsets.all(80),
//            child: Text(" Geolocation : ${latitude} , ${longitude} ",
//              style: TextStyle(fontSize: 25),
//            ),
//          )
      );
  }
}

class zoneMap{

  String city;
  String admin;
  String country;
  String population;
  String iso2;
  String capital;
  String lat;
  String lng;
  String affected;

  zoneMap({this.city, this.admin, this.country, this.population, this.iso2,
    this.capital, this.lat, this.lng, this.affected});

  factory zoneMap.fromJson(Map<String, dynamic>data){
    return zoneMap(
        city:data['city'],
        admin:data['admin'],
        country:data['country'],
        population:data['population'],
        iso2:data['iso2'],
        capital:data['capital'],
        lat:data['lat'],
        lng:data['lng'],
        affected:data['affected']
    );
  }
}
