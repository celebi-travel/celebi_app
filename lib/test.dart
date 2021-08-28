import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMap extends StatefulWidget {
  const TestMap({Key? key}) : super(key: key);

  @override
  _TestMapState createState() => _TestMapState();
}

LatLng _center = const LatLng(33.738045, 73.084488);

class _TestMapState extends State<TestMap> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

//add your lat and lng where you wants to draw polyline
  LatLng _lastMapPosition = _center;
  List<LatLng> latlng = [];
  LatLng _new = LatLng(33.738045, 73.084488);
  LatLng _news = LatLng(33.567997728, 72.635997456);
  @override
  void initState() {
    super.initState();

    latlng.add(_new);
    latlng.add(_news);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: //in your build widget method
            GoogleMap(
      //that needs a list<Polyline>
      polylines: _polyline,
      markers: _markers,
      onMapCreated: (v) {
        _onAddMarkerButtonPressed();
      },
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),

      mapType: MapType.normal,
    ));
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _polyline.add(Polyline(
        polylineId: PolylineId(_lastMapPosition.toString()),
        visible: true,
        //latlng is List<LatLng>
        points: latlng,
        color: Colors.blue,
      ));
    });
  }

//call this method on button click that will draw a polyline and markers

}
