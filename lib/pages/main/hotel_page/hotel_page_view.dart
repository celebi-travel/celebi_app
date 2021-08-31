import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/models/hotel_reservation_model.dart';
import 'package:celebi_project/pages/main/detail/components/image_slider.dart';
import 'package:celebi_project/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key}) : super(key: key);
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  int adults = 2;
  int room = 1;
  int children = 0;
  RoomOptions roomOptions = RoomOptions.standart;
  DateTime? startDate;
  DateTime? endDate;
  late List<int> numbers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          "Hilton Hotel",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Chip(
                      label: Text('Şişli'),
                      avatar: Icon(Icons.place, color: Colors.red),
                      backgroundColor: context.colors.background),
                ),
                Row(
                  children: [
                    Chip(
                        label: Text('5.0'),
                        avatar: Icon(Icons.star, color: Colors.yellow),
                        backgroundColor: context.colors.background),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline, color: Colors.red)),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reservation', style: context.textTheme.headline5),
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
                              Text('Select Date Range',
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
                                ? Text('No Children',
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
                                '546 TL',
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
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(horizontal: 30))),
                              child: Text(
                                'MAKE A RESERVATİON',
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
          ],
        ),
      ),
    );
  }
}
