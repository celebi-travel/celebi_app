import 'package:celebi_project/constants/iller_listesi.dart';
import 'package:celebi_project/extensions/main/home/components/head_title.dart';
import 'package:celebi_project/models/filter_category_model.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';
import 'components/select_location_widget.dart';

class CreateRoutePage extends StatefulWidget {
  const CreateRoutePage({Key? key}) : super(key: key);

  @override
  _CreateRoutePageState createState() => _CreateRoutePageState();
}

class _CreateRoutePageState extends State<CreateRoutePage> {
  String _secilenIlce = 'İstanbul';
  List<FilterCategory> selectedCategories = [];
  void getSelectedCategories() {
    selectedCategories =
        filterCategories.where((element) => element.isSelected).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadTitle(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      hintText: 'Please Enter Route Name',
                      hintStyle: context.textTheme.headline6!
                          .copyWith(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SelectLocationWidget(
                            value1: 'From',
                            element: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Current Location',
                                style: context.textTheme.headline6!.copyWith(
                                    color: Colors.indigo, fontSize: 18),
                              ),
                            )),
                        SelectLocationWidget(
                          value1: 'To',
                          element: DropdownButton(
                            value: _secilenIlce,
                            items: iller.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,
                                      style: context.textTheme.headline6!
                                          .copyWith(
                                              color: Colors.indigo,
                                              fontSize: 18)));
                            }).toList(),
                            style: context.textTheme.headline6!
                                .copyWith(color: Colors.indigo, fontSize: 18),
                            onChanged: (newValue) {
                              setState(() {
                                _secilenIlce = newValue.toString();
                              });
                            },
                            menuMaxHeight: 400,
                            icon: SizedBox(),
                            underline: SizedBox(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Center(
                        child: IconButton(
                          splashRadius: 30,
                          iconSize: 50,
                          onPressed: () {},
                          icon: Icon(Icons.swap_vert_sharp, size: 50),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        'Search Along Your Route',
                        style: context.textTheme.headline6!.copyWith(
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: filterCategories.length,
                    itemBuilder: (context, index) {
                      var _item = filterCategories[index];
                      return GestureDetector(
                        onTap: () {
                          _item.isSelected = !_item.isSelected;
                          setState(() {});
                        },
                        child: Column(children: [
                          Stack(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: _item.categoryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Icon(_item.categoryIcon,
                                      size: 40, color: Colors.white),
                                ),
                              ),
                              _item.isSelected
                                  ? Positioned(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: _item.categoryColor,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Icon(Icons.check,
                                                  size: 18,
                                                  color: _item.categoryColor),
                                            ),
                                          )),
                                      top: 3,
                                      right: 3,
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          Text(_item.categoryName)
                        ]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        Size(double.infinity, 60),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shadowColor: MaterialStateProperty.all(
                        Colors.blue.withOpacity(0.5),
                      ),
                    ),
                    onPressed: () {
                      getSelectedCategories();
                      print(selectedCategories);
                    },
                    child: Text(
                      'Show Matching Places',
                      style: context.textTheme.headline4!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
