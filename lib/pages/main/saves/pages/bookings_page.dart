import '../../../../services/firestore_service.dart';
import 'package:flutter/material.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  List reservations = [];
  bool loadingDone = false;
  Future<void> getHotels() async {
    reservations = await FirestoreService().getMyReservations();
    loadingDone = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadingDone
          ? reservations.isNotEmpty
              ? ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    var item = reservations[index];
                    return Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
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
                                  item['hotelImageUrl'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10.0, left: 10),
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              child: Text(item['hotelName']),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: Container(
                                          child: Text(
                                              '${item['roomNumber']} rooms, ${item['adultNumber']} adult, ${item['childNumber']} children'),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          child: Text(
                                              '${item['type']}, ${item['price']} TL'),
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
                  child: Text('There are no reservations'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
