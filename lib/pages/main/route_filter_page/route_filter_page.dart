import 'dart:convert';

import 'package:celebi_project/models/filter_category_model.dart';
import 'package:celebi_project/models/touristic_place.dart';
import 'package:celebi_project/pages/login_screens/custom/image_with_white_button.dart';
import 'package:celebi_project/pages/main/my_route_page/my_route_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  Future<void> decodeJSON() async {
    String jsonString = await rootBundle.loadString('json/sehirler.json');
    final jsonResponse = json.decode(jsonString);
    sehirVerim = jsonResponse['sehirler'][sehir];
    loadingDone = true;
    setState(() {});
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRoutePage()));
                          },
                        ),
                        PlaceWidget(
                          name: sehirVerim[_categoryName.toLowerCase()][1]
                              ['name'],
                          imgURL: sehirVerim[_categoryName.toLowerCase()][1]
                              ['imgURL'],
                          category: 'Historical Places\nBeyoğlu',
                          starsNumber: 5,
                          commentsNumber: 4123,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRoutePage()));
                          },
                        ),
                        PlaceWidget(
                          name: sehirVerim[_categoryName.toLowerCase()][2]
                              ['name'],
                          imgURL: sehirVerim[_categoryName.toLowerCase()][2]
                              ['imgURL'],
                          category: 'Architectural Buildings\nSultanahmet',
                          starsNumber: 3,
                          commentsNumber: 5122,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRoutePage()));
                          },
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
  const PlaceWidget(
      {Key? key,
      required this.name,
      required this.imgURL,
      required this.category,
      required this.starsNumber,
      required this.commentsNumber,
      required this.onTap})
      : super(key: key);
  final String name, imgURL, category;
  final int starsNumber, commentsNumber;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 170,
                        color: Colors.blue,
                        child: buildImage(imgURL)),
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                  ))
                ],
              )),
        ),
        Divider(indent: 20, endIndent: 20),
      ],
    );
  }
}
