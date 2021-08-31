import 'dart:convert';

import 'package:celebi_project/constants/sehirler_icinde_lat_long.dart';
import 'package:celebi_project/models/filter_category_model.dart';
import 'package:celebi_project/models/touristic_place.dart';
import 'package:celebi_project/pages/login_screens/custom/image_with_white_button.dart';
import 'package:celebi_project/pages/main/my_route_page/my_route_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:random_string/random_string.dart';

import '../../../../extensions/context_extension.dart';
import 'components/category_item.dart';
import 'components/stars_builder.dart';

class RouteFilterPage extends StatefulWidget {
  final String sehir;
  const RouteFilterPage({Key? key, required this.sehir}) : super(key: key);

  @override
  _RouteFilterPageState createState() => _RouteFilterPageState(sehir);
}

class _RouteFilterPageState extends State<RouteFilterPage> {
  final String sehir;
  String _categoryName = 'Outdoors';
  int _currentSelectedCategoryIndex = 1;
  TextEditingController _controller = TextEditingController();
  late Map sehirVerim;
  bool loadingDone = false;
  List _placeNames = [];

  Future<void> decodeJSON() async {
    String jsonString = await rootBundle.loadString('json/sehirler.json');
    final jsonResponse = json.decode(jsonString);
    sehirVerim = jsonResponse['sehirler'][sehir];
    loadingDone = true;
    setState(() {});
  }

  void _showMyRoute() {
    List<LatLng>? randomcoordinates = [];
    randomLatLongs[sehir]!.forEach((element) {
      randomcoordinates.add(element);
    });
    print('1');
    print('randomcoordinates = ' + randomcoordinates.toString());
    List<LatLng>? chosencoordinates = [];
    print('2');
    chosencoordinates.add(randomcoordinates.first);
    print('3');
    randomcoordinates.remove(randomcoordinates.first);
    print('4');
    for (var i = 0; i < _placeNames.length; i++) {
      int random = randomBetween(0, randomcoordinates.length - 1);
      chosencoordinates.add(randomcoordinates[random]);
      randomcoordinates.remove(randomcoordinates[random]);
    }
    print('5');
    List<Map<String, LatLng>> directions = [];
    print('6');
    for (var i = 0; i < chosencoordinates.length - 1; i++) {
      Map<String, LatLng> element = {
        'origin': chosencoordinates[i],
        'destination': chosencoordinates[i + 1]
      };
      directions.add(element);
    }
    print('1');

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyRoutePage(directions: directions)));
  }

  @override
  void initState() {
    super.initState();
    decodeJSON();
  }

  _RouteFilterPageState(this.sehir);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: Text(
              sehir,
              style: context.textTheme.bodyText1!
                  .copyWith(color: Colors.black, fontSize: 20),
            )),
        body: loadingDone
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 140,
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
                                size: 70,
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
                                size: 70,
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
                                size: 70,
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
                                size: 70,
                              ),
                            ),
                          ],
                        )),
                    buildSearchField(_controller),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text('3 placed sorted by travel favorites'),
                          SizedBox(width: 8),
                          Icon(Icons.info),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0XFFB6E7DA)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)))),
                            onPressed:
                                _placeNames.isNotEmpty ? _showMyRoute : null,
                            child: Text('Show My Route (${_placeNames.length})',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))),
                      ),
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        PlaceWidget(
                          name: sehirVerim[_categoryName.toLowerCase()][0]
                              ['name'],
                          imgURL: sehirVerim[_categoryName.toLowerCase()][0]
                              ['imgURL'],
                          category: 'Forests\nSirkeci',
                          starsNumber: 4,
                          commentsNumber: 14211,
                          onPressed: () {
                            if (!_placeNames.contains(
                                sehirVerim[_categoryName.toLowerCase()][0]
                                    ['name'])) {
                              _placeNames.add(
                                  sehirVerim[_categoryName.toLowerCase()][0]
                                      ['name']);
                            } else {
                              _placeNames.remove(
                                  sehirVerim[_categoryName.toLowerCase()][0]
                                      ['name']);
                            }
                            setState(() {});
                          },
                          icon: _placeNames.contains(
                                  sehirVerim[_categoryName.toLowerCase()][0]
                                      ['name'])
                              ? Icons.done
                              : Icons.add,
                        ),
                        PlaceWidget(
                          name: sehirVerim[_categoryName.toLowerCase()][1]
                              ['name'],
                          imgURL: sehirVerim[_categoryName.toLowerCase()][1]
                              ['imgURL'],
                          category: 'Historical Places\nBeyoğlu',
                          starsNumber: 5,
                          commentsNumber: 4123,
                          onPressed: () {
                            if (!_placeNames.contains(
                                sehirVerim[_categoryName.toLowerCase()][1]
                                    ['name'])) {
                              _placeNames.add(
                                  sehirVerim[_categoryName.toLowerCase()][1]
                                      ['name']);
                            } else {
                              _placeNames.remove(
                                  sehirVerim[_categoryName.toLowerCase()][1]
                                      ['name']);
                            }
                            setState(() {});
                          },
                          icon: _placeNames.contains(
                                  sehirVerim[_categoryName.toLowerCase()][1]
                                      ['name'])
                              ? Icons.done
                              : Icons.add,
                        ),
                        PlaceWidget(
                          name: sehirVerim[_categoryName.toLowerCase()][2]
                              ['name'],
                          imgURL: sehirVerim[_categoryName.toLowerCase()][2]
                              ['imgURL'],
                          category: 'Architectural Buildings\nSultanahmet',
                          starsNumber: 3,
                          commentsNumber: 5122,
                          onPressed: () {
                            if (!_placeNames.contains(
                                sehirVerim[_categoryName.toLowerCase()][2]
                                    ['name'])) {
                              _placeNames.add(
                                  sehirVerim[_categoryName.toLowerCase()][2]
                                      ['name']);
                            } else {
                              _placeNames.remove(
                                  sehirVerim[_categoryName.toLowerCase()][2]
                                      ['name']);
                            }
                            setState(() {});
                          },
                          icon: _placeNames.contains(
                                  sehirVerim[_categoryName.toLowerCase()][2]
                                      ['name'])
                              ? Icons.done
                              : Icons.add,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  Container buildImage(TouristicPlace _item) {
    return Container(
      height: 200,
      child: Image.asset(_item.imageName, fit: BoxFit.cover),
    );
  }
}

Container buildSearchField(searchController) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    Key? key,
    required this.name,
    required this.imgURL,
    required this.category,
    required this.starsNumber,
    required this.commentsNumber,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final String name, imgURL, category;
  final int starsNumber, commentsNumber;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                        height: 170,
                        color: Colors.blue,
                        child: buildImage(imgURL)),
                    Positioned(
                      child: CircleAvatar(
                        child: Icon(Icons.favorite, color: Colors.grey),
                        backgroundColor: Colors.white,
                      ),
                      top: 6,
                      right: 6,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: context.textTheme.headline2!
                            .copyWith(fontSize: 16, color: Colors.black)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        StarsBuilder(starsNumber),
                        SizedBox(width: 8),
                        Text(commentsNumber.toString()),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      category,
                      style: context.textTheme.subtitle1!.copyWith(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            icon,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        Divider(indent: 20, endIndent: 20),
      ],
    );
  }
}
