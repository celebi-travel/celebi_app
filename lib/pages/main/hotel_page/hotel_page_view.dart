import 'package:celebi_project/pages/main/hotel_page/facilities/facilities.dart';
import 'package:celebi_project/pages/main/wallet/wallet_view.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../../constants/lang/locale_keys.g.dart';
import '../../../models/hotel_model.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../../../services/firestore_service.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants/image_slider.dart';
import '../../../extensions/context_extension.dart';
import '../../../models/hotel_reservation_model.dart';
import '../../../widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;
  @override
  _HotelPageState createState() => _HotelPageState(hotel);
}

class _HotelPageState extends State<HotelPage> {
  final Hotel hotel;
  int adults = 2;
  int room = 1;
  int children = 0;
  RoomOptions roomOptions = RoomOptions.standart;
  DateTime? startDate = DateTime.now().add(Duration(days: 1));
  DateTime? endDate = DateTime.now().add(Duration(days: 4));
  late List<int> numbers;

  _HotelPageState(this.hotel);
  @override
  void initState() {
    super.initState();
    FirestoreService().saveViewedHotel(hotel.hotelName);
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  }

  bool get isThereChild {
    if (children != 0) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarMethod(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          hotel.hotelName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: DefaultTabController(
          length: 2,
          child:SingleChildScrollView(
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              ImageSlider(imagesList: hotel.images),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 34,
                          backgroundImage:
                              AssetImage('asset/images/sertifika.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2,top:14),
                        child: Chip(
                          
                            padding: EdgeInsets.only(right: 18),
                            label: Text(
                              hotel.place,
                              style: TextStyle(fontSize: 12),
                            ),
                            avatar: Icon(
                              Icons.place,
                              color: Colors.red,
                              size: 18,
                            ),
                            backgroundColor: context.colors.background),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                           showDialog(
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, setState) {
                                      return AlertDialog(
                                        
                                        content: SizedBox(
                                          height: 100,
                                          child: Center(
                                            child: RatingStars(
                                              
                                              value: widget.hotel.rating,
                                              onValueChanged: (v) {
                                                //
                                                setState(() {
                                                  widget.hotel.rating = v;
                                                });
                                              },
                                              starBuilder: (index, color) => Icon(
                                                Icons.star,
                                                color: color,
                                              ),
                                              starCount: 5,
                                              starSize: 26,
                                              valueLabelColor:
                                                  const Color(0xff9b9b9b),
                                              valueLabelTextStyle:
                                                  const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 12.0),
                                              valueLabelRadius: 10,
                                              maxValue: 5,
                                              starSpacing: 2,
                                              maxValueVisibility: true,
                                              valueLabelVisibility: true,
                                              animationDuration:
                                                  Duration(milliseconds: 1000),
                                              valueLabelPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1, horizontal: 8),
                                              valueLabelMargin:
                                                  const EdgeInsets.only(right: 8),
                                              starOffColor:
                                                  const Color(0xffe7e8ea),
                                              starColor: Colors.yellow,
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Thank you for your rating'),
                                                ),
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Text('Rate'),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                );
                        },
                        child: Chip(
                            label: Text(hotel.rating.toString(),style: TextStyle(fontSize: 12),),
                            avatar: Icon(Icons.star, color: Colors.yellow,size: 18,),
                            backgroundColor: context.colors.background),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline, color: Colors.red)),
                    ],
                  )
                ],
              ),
              tabBarHeaderHotel(),
             SizedBox(
               height: 200,
               child: TabBarView(children: [

                    buildReservationHotel(context),
                  buildHotelFacilities(),
                ]
                ),
             ),
            ],
          ), 
        ),
      ),
    );
  }

  Padding buildReservationHotel(BuildContext context)   {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.hotel_reservation.tr(),
                          style: context.textTheme.headline5),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                              height: context.height * 0.4,
                              content: SfDateRangePicker(
                                selectionMode: DateRangePickerSelectionMode.range,
                                onSelectionChanged:
                                    (dateRangePickerSelectionChangedArgs) {
                                  PickerDateRange pickerDateRange =
                                      dateRangePickerSelectionChangedArgs.value;
                                  setState(() {
                                    startDate = pickerDateRange.startDate;
                                    endDate = pickerDateRange.endDate;
                                  });
                                },
                              ),
                            ),
                          ),
                          child: Container(
                            color: Colors.greenAccent.withOpacity(0.2),
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.local_hotel_outlined),
                                  Text(LocaleKeys.hotel_date.tr(),
                                      style: context.textTheme.bodyText1!
                                          .copyWith(fontWeight: FontWeight.w400)),
                                  Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.greenAccent.withOpacity(0.2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.08),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<int>(
                                  menuMaxHeight: 200,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(Entypo.arrow_combo),
                                  ),
                                  elevation: 0,
                                  hint: Text('${adults} Adults',
                                      style: context.textTheme.bodyText1!
                                          .copyWith(fontWeight: FontWeight.w400)),
                                  items: numbers.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: new Text('$value adults'),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      adults = value as int;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              color: Colors.greenAccent.withOpacity(0.2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.08),
                              child: DropdownButton<int>(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Entypo.arrow_combo),
                                ),
                                elevation: 0,
                                underline: SizedBox.fromSize(),
                                hint: isThereChild
                                    ? Text(LocaleKeys.hotel_nochild.tr(),
                                        style: context.textTheme.bodyText1!
                                            .copyWith(fontWeight: FontWeight.w400))
                                    : Text('$children Children',
                                        style: context.textTheme.bodyText1!
                                            .copyWith(fontWeight: FontWeight.w400)),
                                items: numbers.map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: new Text('$value child'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    children = value as int;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.greenAccent.withOpacity(0.2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.08),
                              child: DropdownButton<int>(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Entypo.arrow_combo),
                                ),
                                elevation: 0,
                                underline: SizedBox.fromSize(),
                                hint: Text('${room} Room',
                                    style: context.textTheme.bodyText1!
                                        .copyWith(fontWeight: FontWeight.w400)),
                                items: numbers.map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: new Text('$value room'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    room = value as int;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              color: Colors.greenAccent.withOpacity(0.2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.08),
                              child: DropdownButton<RoomOptions>(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Entypo.arrow_combo),
                                ),
                                elevation: 0,
                                underline: SizedBox.fromSize(),
                                hint: roomOptions == null
                                    ? Text('Room Options',
                                        style: context.textTheme.bodyText1!
                                            .copyWith(fontWeight: FontWeight.w400))
                                    : Text('${roomOptions.name}',
                                        style: context.textTheme.bodyText1!
                                            .copyWith(fontWeight: FontWeight.w400)),
                                items: RoomOptions.values.map((RoomOptions value) {
                                  return DropdownMenuItem<RoomOptions>(
                                    value: value,
                                    child: new Text('${value.name}'),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    roomOptions = value as RoomOptions;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            color: context.colors.primary.withOpacity(0.3),
                            margin: EdgeInsets.symmetric(
                              horizontal: context.width * 0.1,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    '${hotel.price} TL',
                                    style: context.textTheme.headline6!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    'for $room rooms including taxes and fees',
                                    style: context.textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: TextButton(
                                  onPressed: () async {
                                    await FirestoreService().makeReservation(
                                      hotel: hotel,
                                      startDate: startDate!,
                                      endDate: endDate!,
                                      adultNumber: adults,
                                      childNumber: children,
                                      roomNumber: room,
                                      type: roomOptions.name,
                                      price: hotel.price,
                                      hotelImageUrl: hotel.images.first,
                                    );
                      
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Reservation send')));
                      
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WalletView(
                                                ucret: hotel.price.toDouble())));
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(horizontal: 30))),
                                  child: Text(
                                    'MAKE A RESERVAT??ON',
                                    style: context.textTheme.headline6!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
  }

  SingleChildScrollView buildHotelFacilities() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Most Popular Facilities",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(height:20),
          Row(children: [ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            buildFacilities(Icons.pets,"Pets Allowed"),
            buildFacilities(Icons.local_parking,"Parking"),
           
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ buildFacilities(Icons.local_bar,"Tea/coffee maker in all rooms"),  buildFacilities(Icons.wc,"Family Rooms")]),
          Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
          
            buildFacilities(Icons.wifi,"Free WiFi"),
            buildFacilities(Icons.water,"Swimming Poor"),
          ]),]),
          SizedBox(height: 10),
          Row(
            children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeaderFacilities(Icons.home,"Outdoors"),
                  buildFacilities(Icons.done,"Sun terrace"),
                  buildFacilities(Icons.done,"Terrace"),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [buildHeaderFacilities(FontAwesome5.dog,"  Pets"),
                  Text(
                    "Pets are allowed on request. \nCharges may be applicable.",
                    style: TextStyle(color: Colors.black),
                  )]),
                  
                  SizedBox(height: 20),
                ],
              ),
              Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderFacilities(Icons.hotel,"??nvoice Provided"),
              buildFacilities(Icons.done,"Private check-in/check-out"),
              buildFacilities(Icons.done,"Concierge service"),
              buildFacilities(Icons.done,"Luggage storage"),
              buildFacilities(Icons.done,"Ticket service"),
              buildFacilities(Icons.done,"Tour desk"),
              buildFacilities(Icons.done,"Currency exchange"),
              buildFacilities(Icons.done,"Express check-in/check-out"),
              buildFacilities(Icons.done,"24-hour front descommitk"),
            ],
          ),
            ],
          ),
      SizedBox(height:30),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [  buildHeaderFacilities(FontAwesome5.swimmer,"  Cleaning Services"),
          buildFacilities(Icons.done,"Daily housekeeping"),
          buildFacilities(Icons.done,"Shoeshine"),
          buildFacilities(Icons.done,"Laundry"),],),
          
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ buildHeaderFacilities(Icons.public,"Languages spoken"),
          buildFacilities(Icons.done,"Bulgarian"),
          buildFacilities(Icons.done,"English"),
          buildFacilities(Icons.done,"Russian"),
          buildFacilities(Icons.done,"Vietnamese"),],)
         
          ],)
        ],
      ),
    );
  }
  TabBar tabBarHeaderHotel() {
    return TabBar(
  unselectedLabelColor: Colors.grey,
  labelColor: Color(0xFF94C4BE),
  indicatorWeight: 5,
  indicatorColor: Color(0xFF7ABBB3),
  tabs: [
    Tab(
        child: Text(
      'Facilities',
      style: TextStyle(fontSize: 18),
    )),
    Tab(
        child: Text(
      'Reservation',
      style: TextStyle(fontSize: 18),
    )),
  ],
);
  }
}
