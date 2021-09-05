import 'dart:convert';

import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
import 'package:celebi_project/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MySavesPage extends StatefulWidget {
  const MySavesPage({Key? key}) : super(key: key);

  @override
  _MySavesPageState createState() => _MySavesPageState();
}

class _MySavesPageState extends State<MySavesPage> {
  bool dataGet = false;
  late List favoritePlaces;
  List result = [];
  Future<void> getData() async {
    favoritePlaces = await FirestoreService().getFavoritePlaces();
    String jsonString = await rootBundle.loadString('json/sehirler.json');
    final jsonResponse = json.decode(jsonString);
    favoritePlaces.forEach((element) {
      List values = element.toString().split('&');
      String city = values.first;
      String category = values[1];
      String name = values.last;
      List data = jsonResponse['sehirler'][city][category];
      result
          .add(data.where((element) => element['name'] == name).toList().first);
    });

    print('result = $result');
    dataGet = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataGet
          ? ListView.builder(
              itemCount: result.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var item = result[index];
                return Container(
                  height: 120,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Center(
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              item['imgURL'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, left: 10),
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                      Flexible(
                                        child: Container(
                                          child: Text(item['name']),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Container(
                                      child: Text(''),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
