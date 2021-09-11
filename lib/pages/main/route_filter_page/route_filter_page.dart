import 'dart:convert';
import 'package:celebi_project/services/translator.dart';

import '../../../models/place.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../my_route_page/my_route_page.dart';
import '../../../services/firestore_service.dart';
import '../../../constants/sehirler_icinde_lat_long.dart';
import '../../../models/filter_category_model.dart';
import '../../../models/touristic_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:random_string/random_string.dart';
import '../../../../extensions/context_extension.dart';
import 'components/category_item.dart';
import 'components/rehber_view.dart';
import 'components/stars_builder.dart';

class RouteFilterPage extends StatefulWidget {
  final PlaceModel placeModel;
  const RouteFilterPage({Key? key, required this.placeModel}) : super(key: key);

  @override
  _RouteFilterPageState createState() => _RouteFilterPageState(placeModel);
}

class _RouteFilterPageState extends State<RouteFilterPage> {
  final PlaceModel placeModel;
  String _categoryName = 'Guider';
  int _currentSelectedCategoryIndex = 0;
  TextEditingController _controller = TextEditingController();
  late Map sehirVerim;
  bool loadingDone = false;
  List _placeNames = [];
  List favoritePlaces = [];

  Future<void> decodeJSON() async {
    String jsonString = await rootBundle.loadString('json/sehirler.json');
    final jsonResponse = json.decode(jsonString);
    sehirVerim = jsonResponse['sehirler'][placeModel.city!.toLowerCase()];
    loadingDone = true;
    setState(() {});
  }

  void _showMyRoute() {
    List<LatLng>? randomcoordinates = [];
    randomLatLongs[placeModel.city!.toLowerCase()]!.forEach((element) {
      randomcoordinates.add(element);
    });
    List<LatLng>? chosencoordinates = [];
    chosencoordinates.add(randomcoordinates.first);
    randomcoordinates.remove(randomcoordinates.first);
    for (var i = 0; i < _placeNames.length; i++) {
      int random = randomBetween(0, randomcoordinates.length - 1);
      chosencoordinates.add(randomcoordinates[random]);
      randomcoordinates.remove(randomcoordinates[random]);
    }
    List<Map<String, LatLng>> directions = [];
    for (var i = 0; i < chosencoordinates.length - 1; i++) {
      Map<String, LatLng> element = {
        'origin': chosencoordinates[i],
        'destination': chosencoordinates[i + 1]
      };
      directions.add(element);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyRoutePage(
          directions: directions,
          initialPosition: CameraPosition(
              target: randomLatLongs[placeModel.city!.toLowerCase()]![0],
              zoom: 10),
        ),
      ),
    );
  }

  Future<void> getFavoritePlaces() async {
    favoritePlaces = await FirestoreService().getFavoritePlaces();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getFavoritePlaces();
    decodeJSON();
    FirestoreService().saveViewedCity(placeModel.city!);
  }

  _RouteFilterPageState(this.placeModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: Text(
              placeModel.city!,
              style: context.textTheme.bodyText1!
                  .copyWith(color: Colors.black, fontSize: 16),
            )),
        bottomNavigationBar: bottomBarMethod(context),
        body: loadingDone
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 110,
                        child: Row(
                          children: [
                            Expanded(
                              child: CategoryItem(
                                item: filterCategories[0],
                                onPressed: () {
                                  setState(() {
                                    _categoryName =
                                        filterCategories[0].categoryName;
                                    _currentSelectedCategoryIndex = 0;
                                  });
                                },
                                isSelected: _currentSelectedCategoryIndex == 0,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              child: CategoryItem(
                                item: filterCategories[1],
                                onPressed: () {
                                  setState(() {
                                    _categoryName =
                                        filterCategories[1].categoryName;
                                    _currentSelectedCategoryIndex = 1;
                                  });
                                },
                                isSelected: _currentSelectedCategoryIndex == 1,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              child: CategoryItem(
                                item: filterCategories[2],
                                onPressed: () {
                                  setState(() {
                                    _categoryName =
                                        filterCategories[2].categoryName;
                                    _currentSelectedCategoryIndex = 2;
                                  });
                                },
                                isSelected: _currentSelectedCategoryIndex == 2,
                                size: 50,
                              ),
                            ),
                            Expanded(
                              child: CategoryItem(
                                item: filterCategories[3],
                                onPressed: () {
                                  setState(() {
                                    _categoryName =
                                        filterCategories[3].categoryName;
                                    _currentSelectedCategoryIndex = 3;
                                  });
                                },
                                isSelected: _currentSelectedCategoryIndex == 3,
                                size: 50,
                              ),
                            ),
                          ],
                        )),
                    buildSearchField(_controller),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            '3 placed sorted by travel favorites',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.info),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, right: 25),
                        child: SizedBox(
                          height: 25,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0XFFB6E7DA)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed:
                                  _placeNames.isNotEmpty ? _showMyRoute : null,
                              child: Text(
                                  'Show My Route (${_placeNames.length})',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black))),
                        ),
                      ),
                    ),
                    if (_currentSelectedCategoryIndex != 0)
                      ListView.builder(
                        itemCount: sehirVerim.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return PlaceWidget(
                            favoriteButtonColor: favoritePlaces.contains(
                                    "${placeModel.city!.toLowerCase()}&${_categoryName.toLowerCase()}&${sehirVerim[_categoryName.toLowerCase()][index]['name']}")
                                ? Colors.pink
                                : Colors.grey,
                            name: sehirVerim[_categoryName.toLowerCase()][index]
                                ['name'],
                            imgURL: sehirVerim[_categoryName.toLowerCase()]
                                [index]['imgURL'],
                            category: ' ',
                            starsNumber: sehirVerim[_categoryName.toLowerCase()]
                                [index]['stars'],
                            commentsNumber:
                                sehirVerim[_categoryName.toLowerCase()][index]
                                    ['commentsNumber'],
                            onPressed: () {
                              if (!_placeNames.contains(
                                  sehirVerim[_categoryName.toLowerCase()][index]
                                      ['name'])) {
                                _placeNames.add(
                                    sehirVerim[_categoryName.toLowerCase()]
                                        [index]['name']);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(0XFFB6E7DA),
                                    content: Text(
                                      'Place Added to list',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              } else {
                                _placeNames.remove(
                                    sehirVerim[_categoryName.toLowerCase()]
                                        [index]['name']);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'Place Removed from list',
                                    ),
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            favoriteButton: () async {
                              if (!favoritePlaces.contains(
                                  "${placeModel.city!.toLowerCase()}&${_categoryName.toLowerCase()}&${sehirVerim[_categoryName.toLowerCase()][index]['name']}")) {
                                await FirestoreService().saveFavoritePlace(
                                    placeModel.city!.toLowerCase(),
                                    _categoryName.toLowerCase(),
                                    sehirVerim[_categoryName.toLowerCase()]
                                        [index]['name']);
                              }
                              getFavoritePlaces();
                            },
                            icon: _placeNames.contains(
                                    sehirVerim[_categoryName.toLowerCase()]
                                        [index]['name'])
                                ? Icons.done
                                : Icons.add,
                          );
                        },
                      )
                    else
                      RehberView(),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  Container buildImage(TouristicPlace _item) {
    return Container(
      height: 150,
      child: Image.asset(_item.imageName, fit: BoxFit.cover),
    );
  }
}

Container buildSearchField(searchController) {
  return Container(
    height: 35,
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Center(
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: (value) {},
        controller: searchController,
        maxLength: 30,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20, right: 15),
            child: Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
          ),
          border: InputBorder.none,
          hintText: 'Search  ',
        ),
        cursorHeight: 20,
      ),
    ),
  );
}

class PlaceWidget extends StatefulWidget {
  const PlaceWidget({
    Key? key,
    required this.name,
    required this.imgURL,
    required this.category,
    required this.starsNumber,
    required this.commentsNumber,
    required this.icon,
    required this.onPressed,
    required this.favoriteButton,
    required this.favoriteButtonColor,
  }) : super(key: key);
  final String name, imgURL, category;
  final int starsNumber, commentsNumber;
  final IconData icon;
  final Color favoriteButtonColor;
  final VoidCallback onPressed, favoriteButton;

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  late String name;
  bool nameTranslated = false;

  Future<void> translateName() async {
    name = await TranslatorManager.instance.translate(context, widget.name);
    nameTranslated = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    translateName();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                        width: 160,
                        height: 160,
                        color: Colors.blue,
                        child: Image.network(
                          widget.imgURL,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      child: GestureDetector(
                        onTap: widget.favoriteButton,
                        child: CircleAvatar(
                          radius: 12,
                          child: Icon(
                            Icons.favorite,
                            color: widget.favoriteButtonColor,
                            size: 15,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      top: 6,
                      right: 6,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nameTranslated ? name : '',
                        style: context.textTheme.headline2!
                            .copyWith(fontSize: 14, color: Colors.black)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        StarsBuilder(widget.starsNumber),
                        SizedBox(width: 8),
                        Text(widget.commentsNumber.toString()),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.category,
                      style: context.textTheme.subtitle1!.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: widget.onPressed,
                          icon: Icon(
                            widget.icon,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        Divider(color: Colors.black54, indent: 20, endIndent: 20),
      ],
    );
  }
}
