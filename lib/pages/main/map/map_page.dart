import 'dart:async';
import 'dart:typed_data';
import 'package:celebi_project/constants/image_slider.dart';
import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:celebi_project/models/beach_model.dart';
import 'package:celebi_project/pages/main/beach/beach_page_view.dart';
import 'package:celebi_project/pages/main/my_route_page/my_route_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../hotel_page/hotel_page_view.dart';

import '../../../models/filter_category_model.dart';
import '../../../models/hotel_model.dart';
import '../../../models/restaurant_model.dart';
import '../restaruant_page/restaruant_view.dart';
import '../../../services/firestore_service.dart';
import '../../../widgets/filter_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({ Key? key }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> { 
  late BitmapDescriptor _markerHotelIcon;
  late BitmapDescriptor _markerRestaurantIcon;
  late BitmapDescriptor _markerBeachIcon;

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(40.99980035209238, 29.11238853634545),zoom: 10);

  var _items = [
    FilterCategory(
        categoryName: 'Hotels',
        categoryIcon: Icons.hotel,
        categoryColor: Colors.blue.shade300,
        goPage: Container(),
        isSelected: false),
    FilterCategory(
        categoryName: 'Cafe & Restaurant',
        categoryIcon: Icons.restaurant,
        categoryColor: Colors.deepOrange.shade300,
        goPage: Container(),
        isSelected: false),
    FilterCategory(
        categoryName: 'Beaches',
        categoryIcon: Icons.beach_access,
        categoryColor: Colors.yellow.shade300,
        goPage: Container(),
        isSelected: false),
  ];

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyDiMzCaXucTsCYeQ8qR9dMLX-sBvUpSPUs";
  List<Hotel> hotels = [];
  List<Restaurant> restaurants = [];
  List<Beach> beaches = []; 

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller); 
  } 

  Future<void> _setCustomMapPin(context) async {
    final ImageConfiguration _imageConfiguration =
        createLocalImageConfiguration(context,size: Size(50,50));
        final Uint8List _markerHotelIconasset = await getBytesFromAsset('asset/icons/location.png', 100);
        final Uint8List _markerRestaurantIconasset = await getBytesFromAsset('asset/icons/placeholder.png', 100);
        final Uint8List _markerBeachIconasset = await getBytesFromAsset('asset/icons/beach.png', 100);

    _markerHotelIcon =   BitmapDescriptor.fromBytes(_markerHotelIconasset);
    _markerRestaurantIcon =   BitmapDescriptor.fromBytes(_markerRestaurantIconasset);
    _markerBeachIcon =   BitmapDescriptor.fromBytes(_markerBeachIconasset);
  }

  void setHotelMarkers() { 
   hotels.forEach((element) { 
      _markers.add(Marker(
          markerId: MarkerId(element.coordinate.latitude.toString() ),
          icon: _markerHotelIcon,

          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HotelPage(hotel: element)));
          },
          position:
              LatLng(element.coordinate.latitude, element.coordinate.longitude),
          infoWindow: InfoWindow(
            title: element.hotelName,
          )));
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

  void setBeachMarkers() {
    beaches.forEach((element) {
      _markers.add(Marker(
          markerId: MarkerId(element.beachName),
          icon: _markerBeachIcon,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                child: Container(
                  height: 300,
                  width: double.infinity - 40,
                  color: Colors.transparent,
                  child: Center(
                    child: ImageSlider(imagesList: element.images),
                  ),
                ),
              ),
            );
          },
          position:
              LatLng(element.coordinate.latitude, element.coordinate.longitude),
          infoWindow: InfoWindow(
            title: element.beachName,
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

  void removeBeachMarkers() {
    _markers.removeWhere((element) => element.icon == _markerBeachIcon);
    setState(() {});
  }
 

  Future<void> _getHotels() async {
    hotels = await FirestoreService().getHotels();
    await _setCustomMapPin(context);
  }

  Future<void> _getBeaches() async {
    beaches = await FirestoreService().getBeaches();
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
    _getBeaches().then((value) {
      
      _items[0].isSelected = true;  _items[1].isSelected = true;  _items[2].isSelected = true;
    setRestaurantMarkers();
    setHotelMarkers();
    setBeachMarkers();

    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.white,
      
        bottomNavigationBar: bottomBarMethod(context),
      appBar: AppBar(
          centerTitle: true,
          title: Text(LocaleKeys.map_title, style: TextStyle(color: Colors.black)).tr(),
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  size: 50,
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
                  size: 50,
                ),
                FilterElement(
                  item: _items[2],
                  onTap: () {
                    if (_items[2].isSelected) {
                      _items[2].isSelected = false;
                      removeBeachMarkers();
                    } else {
                      _items[2].isSelected = true;
                      setBeachMarkers();
                    }
                    setState(() {});
                  },
                  size: 50,
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}