import 'dart:async';
import 'package:celebi_project/extensions/main/hotel_page/hotel_page_view.dart';
import 'package:celebi_project/extensions/main/restaruant_page/restaruant_view.dart';
import 'package:celebi_project/models/filter_category_model.dart';
import 'package:celebi_project/models/hotel_model.dart';
import 'package:celebi_project/models/restaurant_model.dart';
import 'package:celebi_project/services/firestore_service.dart';
import 'package:celebi_project/widgets/filter_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyRoutePage extends StatefulWidget {
  const MyRoutePage({Key? key, required this.directions}) : super(key: key);

  final List<Map<String, LatLng>> directions;
  @override
  _MyRoutePageState createState() => _MyRoutePageState(directions);
}

class _MyRoutePageState extends State<MyRoutePage> {
  final List<Map<String, LatLng>> directions;
  late BitmapDescriptor _markerHotelIcon;
  late BitmapDescriptor _markerRestaurantIcon;

  CameraPosition _initialPosition = CameraPosition(
    target: LatLng(41.015137, 28.979530),
    zoom: 10,
  );

  var _items = [
    FilterCategory(
        categoryName: 'Hotels',
        categoryIcon: Icons.hotel,
        categoryColor: Colors.blueAccent,
        goPage: Container(),
        isSelected: false),
    FilterCategory(
        categoryName: 'Cafe & Restaurant',
        categoryIcon: Icons.restaurant,
        categoryColor: Colors.pink,
        goPage: Container(),
        isSelected: false),
    FilterCategory(
        categoryName: 'Beaches',
        categoryIcon: Icons.beach_access,
        categoryColor: Colors.yellow[800]!,
        goPage: Container(),
        isSelected: false),
  ];

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyCgAc5W3Hx4QSRhQFXSASv_prrQp3P9UeQ";
  List<Hotel> hotels = [];
  List<Restaurant> restaurants = [];
  bool showHotels = false;

  _MyRoutePageState(this.directions);

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);

    setMapPins();
    setPolylines();
  }

  void setMapPins() {
    directions.forEach((element) {
      _markers.add(Marker(
        markerId: MarkerId(element['origin'].toString()),
        position: element['origin']!,
      ));
      _markers.add(Marker(
        markerId: MarkerId(element['destination'].toString()),
        position: element['destination']!,
      ));
      setState(() {});
    });
  }

  Future<void> _setCustomMapPin(context) async {
    final ImageConfiguration _imageConfiguration =
        createLocalImageConfiguration(context);
    _markerHotelIcon = await BitmapDescriptor.fromAssetImage(
        _imageConfiguration, 'asset/icons/location.png');
    _markerRestaurantIcon = await BitmapDescriptor.fromAssetImage(
        _imageConfiguration, 'asset/icons/placeholder.png');
  }

  void setHotelMarkers() {
    hotels.forEach((element) {
      _markers.add(Marker(
          markerId: MarkerId(element.hotelName),
          icon: _markerHotelIcon,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HotelPage()));
          },
          position:
              LatLng(element.coordinate.latitude, element.coordinate.longitude),
          infoWindow: InfoWindow(
              title: element.hotelName,
              snippet: 'Standart ${element.price} TL')));
    });
    setState(() {});
  }

  void setRestaurantMarkers() {
    restaurants.forEach((element) {
      _markers.add(Marker(
          markerId: MarkerId(element.restaurantName),
          icon: _markerRestaurantIcon,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RestaruantPage(
                          restaurant: element,
                        )));
          },
          position:
              LatLng(element.coordinate.latitude, element.coordinate.longitude),
          infoWindow: InfoWindow(
            title: element.restaurantName,
          )));
    });
    setState(() {});
  }

  void removeHotelMarkers() {
    _markers.removeWhere((element) => element.icon == _markerHotelIcon);
    setState(() {});
  }

  void removeRestaurantMarkers() {
    _markers.removeWhere((element) => element.icon == _markerRestaurantIcon);
    setState(() {});
  }

  setPolylines() async {
    List<LatLng> polylineCoordinates = [];
    for (var i = 0; i < directions.length; i++) {
      PolylineResult? result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPIKey,
          PointLatLng(directions[i]['origin']!.latitude,
              directions[i]['origin']!.longitude),
          PointLatLng(directions[i]['destination']!.latitude,
              directions[i]['destination']!.longitude));
      if (result.status == 'OK') {
        result.points.forEach((_element) {
          polylineCoordinates
              .add(LatLng(_element.latitude, _element.longitude));
        });
      }

      Polyline polyline = Polyline(
          polylineId: PolylineId("${directions[i]['origin']}"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates,
          width: 5);
      _polylines.add(polyline);
    }
    setState(() {});
  }

  Future<void> _getHotels() async {
    hotels = await FirestoreService().getHotels();
    await _setCustomMapPin(context);
  }

  Future<void> _getRestaurants() async {
    restaurants = await FirestoreService().getRestaurants();
  }

  @override
  void initState() {
    super.initState();
    _getRestaurants();
    _getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text('My Route', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 5.5 / 10,
            margin: EdgeInsets.all(22),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
                zoomControlsEnabled: false,
                markers: _markers,
                polylines: _polylines,
                onMapCreated: onMapCreated,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22),
            child: Text('Filters',
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterElement(
                  item: _items[0],
                  onTap: () {
                    if (_items[0].isSelected) {
                      _items[0].isSelected = false;
                      removeHotelMarkers();
                    } else {
                      _items[0].isSelected = true;
                      setHotelMarkers();
                    }
                    setState(() {});
                  },
                  size: 70,
                ),
                FilterElement(
                  item: _items[1],
                  onTap: () {
                    if (_items[1].isSelected) {
                      _items[1].isSelected = false;
                      removeRestaurantMarkers();
                    } else {
                      _items[1].isSelected = true;
                      setRestaurantMarkers();
                    }
                    setState(() {});
                  },
                  size: 70,
                ),
                FilterElement(
                  item: _items[2],
                  onTap: () {
                    _items[2].isSelected = !_items[2].isSelected;
                    setState(() {});
                  },
                  size: 70,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Go To Route'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
                minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 60)),
                backgroundColor: MaterialStateProperty.all(Color(0xFF7BC4B2)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
