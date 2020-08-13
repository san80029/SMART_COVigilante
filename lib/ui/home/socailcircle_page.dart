import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:SMART_COVigilante/utilities/containment_zone_data.dart'
as zoneMapData;

class SocialCirclePage extends StatefulWidget {
  //WebViewController _webViewController;

  SocialCirclePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SocialCirclePageState createState() => _SocialCirclePageState();
}

class socialInfo {
  String name;

  socialInfo(this.name, this.position);

  LatLng position;
}

class _SocialCirclePageState extends State<SocialCirclePage> {
  static String zoneMap = zoneMapData.containmentZoneData.zoneMap;
  Set<Circle> _circle = HashSet<Circle>();
  Set<Marker> _marker = HashSet<Marker>();
  static List<socialInfo> positionsList = new List<socialInfo>();
  BitmapDescriptor customIcon;
  BitmapDescriptor iconC;
  static var parsedJson = json.decode(zoneMap);

  populateExternalCircles() {
    print("parsedJson : " + parsedJson.toString());
    List<dynamic> data = parsedJson["result"];
    for (int i = 0; i < data.length; i++) {
      print("City names : " + data[i]["city"]);
      String lati = data[i]["lat"];
      String lngi = data[i]["lng"];
      print("lati : " + lati + " lngi : " + lngi);
      double latid = double.tryParse(lati);
      double longid = double.tryParse(lngi);
      setCircle(new LatLng(latid, longid),
          0.8 * double.tryParse(data[i]["affected"]), i, data[i]["affected"]);
    }
  }

  populatePositionsList() {
    positionsList = new List();
    positionsList
        .add(new socialInfo("Varsha", new LatLng(12.977063, 77.5871061)));
    positionsList
        .add(new socialInfo("Jegathesh", new LatLng(9.917347, 78.119622)));
    positionsList
        .add(new socialInfo("Satheesh", new LatLng(18.987807, 72.836447)));
    return positionsList;
  }



  Set<Marker> populateSocialCircle(){
    populatePositionsList();
    for(int i=0; i<positionsList.length;i++){
      _marker.add(Marker(
        markerId: MarkerId("social_circle_marker_" + i.toString()),
        position: positionsList[i].position,
        visible: true,
        infoWindow: InfoWindow(
            title: positionsList[i].name.toString()+" stays here."),
      ));
    }
    return _marker;
  }

  static Position position_global;

  static Future<Position> populateCenter() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    position_global = position;
    return position_global;
  }

  void setCircle(LatLng point, double radius, int i, String affected) {
//    bool markerVisibility;
    final String circleIdVal = "current_location_circle" + i.toString();
    final String markerIdVal = "current_location_marker" + i.toString();
    final double _affected = double.tryParse(affected);
    _circle.add(Circle(
        circleId: CircleId(circleIdVal),
        center: point,
        radius: radius,
        fillColor: Colors.redAccent.withOpacity(0.5),
        strokeWidth: 2,
        strokeColor: Colors.redAccent));
//    if (_affected > 30000) {
//      markerVisibility = true;
//    } else {
//      markerVisibility = false;
//    }
//    _marker.add(Marker(
//        markerId: MarkerId(markerIdVal),
//        infoWindow: InfoWindow(
//          title: "Affected " + affected,
//        ),
//        visible: markerVisibility,
//        position: point));
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> testMarker = new Set<Marker>();
    populateExternalCircles();
    testMarker = populateSocialCircle();
    print("testMarker size : "+testMarker.length.toString());
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

       return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.deepPurple,
          ),
          body: FutureBuilder<Position>(
            future: populateCenter(),
            builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError)
                  return Center(child: Text('Error: ${snapshot.error}'));
                else {
                  setCircle(
                      new LatLng(snapshot.data.latitude as double,
                          snapshot.data.longitude as double),
                      1200,
                      40,
                      "30001");
                  return GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          snapshot.data.latitude, snapshot.data.longitude),
                      zoom: 5.0,
                    ),
                    zoomGesturesEnabled: true,
                    myLocationEnabled: true,
                    circles: _circle,
                    markers: _marker,
                  );
                }
              }
            },
          )
    );
  }
}

class zoneMap {
  String city;
  String admin;
  String country;
  String population;
  String iso2;
  String capital;
  String lat;
  String lng;
  String affected;

  zoneMap(
      {this.city,
        this.admin,
        this.country,
        this.population,
        this.iso2,
        this.capital,
        this.lat,
        this.lng,
        this.affected});

  factory zoneMap.fromJson(Map<String, dynamic> data) {
    return zoneMap(
        city: data['city'],
        admin: data['admin'],
        country: data['country'],
        population: data['population'],
        iso2: data['iso2'],
        capital: data['capital'],
        lat: data['lat'],
        lng: data['lng'],
        affected: data['affected']);
  }
}

