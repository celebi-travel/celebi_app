import 'package:celebi_project/pages/main/detail/components/image_slider.dart';
import 'package:flutter/material.dart';

class RestaruantPage extends StatefulWidget {
  const RestaruantPage({Key? key}) : super(key: key);

  @override
  _RestaruantPageState createState() => _RestaruantPageState();
}

class _RestaruantPageState extends State<RestaruantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildRestaruantAppbar(),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                  height: 50,
                  width: 330,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                      child: ListTile(
                        leading: Icon(Icons.search, color: Colors.grey),
                        title: Text(
                          "search",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                          ),
                        ),
                        trailing: Icon(Icons.ac_unit_sharp),
                      ))),
              ImageSlider(),
              buildTabBarHeadText(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: TabBarView(children: [
                  Image.asset('asset/images/menu.png'),
                  Image.asset('asset/images/menu.png'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildRestaruantAppbar() {
    return AppBar(
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
        "Restaruant",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

TabBar buildTabBarHeadText() {
  return TabBar(
    unselectedLabelColor: Colors.grey,
    labelColor: Color(0xFF94C4BE),
    indicatorWeight: 4,
    indicatorColor: Color(0xFF7ABBB3),
    tabs: [
      Tab(
          child: Text(
        'Menu',
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
