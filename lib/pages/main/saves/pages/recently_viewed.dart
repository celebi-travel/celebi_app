import '../../../../services/firestore_service.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

class RecentlyViewed extends StatefulWidget {
  const RecentlyViewed({Key? key}) : super(key: key);

  @override
  _RecentlyViewedState createState() => _RecentlyViewedState();
}

class _RecentlyViewedState extends State<RecentlyViewed> {
  Map savedData = {};
  List hotelImages = [];
  List restaurantImages = [];
  List cityImages = [];
  Future<void> getData() async {
    savedData = await FirestoreService().getSavedData();
    setState(() {});
  }

  Future<void> getImages() async {
    await Future.delayed(Duration(seconds: 1));

    for (var i = 0; i < savedData['hotels'].length; i++) {
      String url = await FirestoreService()
          .getHotelImagefromName(savedData['hotels'][i]);
      hotelImages.add(url);
    }

    for (var i = 0; i < savedData['restaurants'].length; i++) {
      String url = await FirestoreService()
          .getRestaurantImagefromName(savedData['restaurants'][i]);
      restaurantImages.add(url);
    }

    for (var i = 0; i < savedData['cities'].length; i++) {
      String url =
          await FirestoreService().getCityImagefromName(savedData['cities'][i]);
      cityImages.add(url);
    }
    dataGet = true;
    setState(() {});
  }

  bool dataGet = false;
  @override
  void initState() {
    super.initState();
    getData().then((value) => getImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataGet
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 14),
                      child: Text(
                        'Hotels',
                        style: context.textTheme.headline6!.copyWith(
                            letterSpacing: 0.3, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: savedData['hotels'].length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String name = savedData['hotels'][index];
                      return Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14)),
                        margin:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 22),
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
                                    hotelImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10.0),
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                          ),
                                          Flexible(
                                            child: Container(
                                              height: 40,
                                              child: Text(name),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 14),
                      child: Text(
                        'Restaurants',
                        style: context.textTheme.headline6!.copyWith(
                            letterSpacing: 0.3, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: savedData['restaurants'].length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String name = savedData['restaurants'][index];
                      return Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14)),
                        margin:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 22),
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
                                    restaurantImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10.0),
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                          ),
                                          Flexible(
                                            child: Container(
                                              height: 40,
                                              child: Text(name),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 14),
                      child: Text(
                        'Cities',
                        style: context.textTheme.headline6!.copyWith(
                            letterSpacing: 0.3, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: savedData['cities'].length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String name = savedData['cities'][index];
                      return Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14)),
                        margin:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 22),
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
                                    cityImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10.0),
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SizedBox(
                                      height: 40,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                          ),
                                          Flexible(
                                            child: Container(
                                              height: 40,
                                              child: Text(name),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
