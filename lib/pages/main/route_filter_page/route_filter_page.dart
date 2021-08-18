import 'package:celebi_project/models/filter_category_model.dart';
import 'package:celebi_project/models/touristic_place.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../extensions/context_extension.dart';
import 'components/category_item.dart';
import 'components/stars_builder.dart';

class RouteFilterPage extends StatefulWidget {
  const RouteFilterPage({Key? key}) : super(key: key);

  @override
  _RouteFilterPageState createState() => _RouteFilterPageState();
}

class _RouteFilterPageState extends State<RouteFilterPage> {
  String _categoryName = 'Tours';
  int _currentSelectedCategoryIndex = 0;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'İstanbul',
            style: context.textTheme.bodyText1!
                .copyWith(color: Colors.black, fontSize: 20),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filterCategories.length,
                itemBuilder: (context, index) {
                  var _item = filterCategories[index];
                  return CategoryItem(
                    item: _item,
                    isSelected: _currentSelectedCategoryIndex == index,
                    onPressed: () {
                      setState(() {
                        _categoryName = _item.categoryName;
                        _currentSelectedCategoryIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            buildSearchField(_controller),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text('12 placed sorted by travel favorites'),
                  SizedBox(width: 8),
                  Icon(Icons.info),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: touristicPlacesFilter[_categoryName]!.length,
              itemBuilder: (context, index) {
                TouristicPlace _item =
                    touristicPlacesFilter[_categoryName]![index];
                return Column(
                  children: [
                    Container(
                        height: 200,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: buildImage(_item),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${index + 1}. ' + _item.name,
                                      style: context.textTheme.headline2!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black)),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      StarsBuilder(_item.starsNumber),
                                      SizedBox(width: 8),
                                      Text(_item.rateNumber.toString()),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    _item.infoText,
                                    style: context.textTheme.subtitle1!
                                        .copyWith(
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
                                          FontAwesomeIcons.solidPlusSquare,
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ),
                            ))
                          ],
                        )),
                    Divider(indent: 20, endIndent: 20),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
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
