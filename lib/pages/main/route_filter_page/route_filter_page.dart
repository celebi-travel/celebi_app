import 'package:celebi_project/models/filter_category_model.dart';
import 'package:celebi_project/models/touristic_place.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';
import 'components/category_item.dart';

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
            style: context.textTheme.bodyText1!.copyWith(color: Colors.black, fontSize: 20),
          )),
      body: Column(
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
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: touristicPlacesFilter[_categoryName]!.length,
              itemBuilder: (context, index) {
                TouristicPlace _item = touristicPlacesFilter[_categoryName]![index];
                return Container(
                  height: 120,
                  margin: EdgeInsets.all(14),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(_item.name),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Container buildSearchField(searchController) {
  return Container(
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
