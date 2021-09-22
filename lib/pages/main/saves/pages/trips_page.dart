import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:celebi_project/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({
    Key? key,
  }) : super(key: key);

  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  bool dataGet = false;
  late List favoritePlaces;
  List routes = [];
  Future<void> getData() async {
      routes = await FirestoreService().getRoutes();  
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
              itemCount: routes.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var item = routes[index];
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
                            child: CachedNetworkImage(
                     imageUrl:   item['image'],
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
                                          child: Text(item['city']),
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

 /* @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30),
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Center(
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: CachedNetworkImage(
                     imageUrl:  'https://media-cdn.tripadvisor.com/media/photo-s/08/02/db/0c/cleopatra-pools.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            Flexible(
                              child: Container(
                                height: 40,
                                child:
                                    Text('Cleopatra Pools, Pamukkale/Denizli'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text('4.0'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Center(
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: CachedNetworkImage(
                     imageUrl: 'https://www.choramuseum.com/wp-content/uploads/2016/02/chora-museum-church-istanbul.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            Flexible(
                              child: Container(
                                height: 40,
                                child: Text('Chora Museum, Istanbul'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text('4.5'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Center(
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: CachedNetworkImage(
                     imageUrl:  'https://basin.ktb.gov.tr/Resim/35525,group-4-dsc2307dsc2312-6-imagesjpg.png?0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            Flexible(
                              child: Container(
                                height: 40,
                                child: Text('Xantos-Letoon, Antalya'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text('3.0'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
*/