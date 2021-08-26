import 'dart:async';

import 'package:celebi_project/models/filter_category_model.dart';
import 'package:celebi_project/widgets/filter_element.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyRoutePage extends StatefulWidget {
  const MyRoutePage({Key? key}) : super(key: key);

  @override
  _MyRoutePageState createState() => _MyRoutePageState();
}

class _MyRoutePageState extends State<MyRoutePage> {
  CameraPosition _initialPosition = CameraPosition(
    target: LatLng(41.015137, 28.979530),
    zoom: 10,
  );

  var _items = [
    filterCategories.first,
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
  LatLng _origin = LatLng(41.015137, 28.979530);
  LatLng _destination = LatLng(41.045137, 28.99530);
  //PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyDBcZchTtJrV_TCymBK_mRJW4qjKZae04M";
  List<LatLng> polylineCoordinates = [];

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setMapPins();
    setPolylines();
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: _origin,
      ));
      // destination pin
      _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: _destination,
      ));
    });
  }

  setPolylines() async {
    /*PolylineResult? result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey, PointLatLng(_origin.latitude, _origin.longitude), PointLatLng(_destination.latitude, _destination.longitude));
    print(result.errorMessage);
    print(result.status);
    if (result.status == 'OK') {
      result.points.forEach((element) {
        polylineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
    }
*/
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
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
                    _items[0].isSelected = !_items[0].isSelected;
                    setState(() {});
                  },
                  size: 70,
                ),
                FilterElement(
                  item: _items[1],
                  onTap: () {
                    _items[1].isSelected = !_items[1].isSelected;
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
