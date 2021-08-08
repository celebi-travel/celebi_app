import 'package:celebi_project/models/filter_category_model.dart';
import 'package:celebi_project/pages/main/home/components/head_title.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';
import 'components/select_location_widget.dart';

class CreateRoutePage extends StatefulWidget {
  const CreateRoutePage({Key? key}) : super(key: key);

  @override
  _CreateRoutePageState createState() => _CreateRoutePageState();
}

class _CreateRoutePageState extends State<CreateRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
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
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  hintText: 'Please Enter Route Name',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SelectLocationWidget(value1: 'From', value2: 'Current Location', onPressed: () {}),
                      SelectLocationWidget(value1: 'To', value2: 'İstanbul, Turkey', onPressed: () {}),
                    ],
                  ),
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
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                ),
                itemCount: filterCategories.length,
                itemBuilder: (context, index) {
                  var _item = filterCategories[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Column(children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _item.categoryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(_item.categoryIcon, size: 40, color: Colors.white),
                        ),
                      ),
                      Text(_item.categoryName)
                    ]),
                  );
                },
              ),
            ),
            Spacer(flex: 3),
            ElevatedButton(
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
              onPressed: () {},
              child: Text(
                'Show Matching Places',
                style: context.textTheme.headline4!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
