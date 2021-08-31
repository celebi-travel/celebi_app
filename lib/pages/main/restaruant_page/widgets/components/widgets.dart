import 'package:flutter/material.dart';

buildMenuBar(BuildContext context) {
  return Container(
      height: 50,
      color: Color(0xFF292828),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildSpeciesTitle("OUR PİCKS FROM THE MENU"),
          buildSpeciesTitle("Appetizers"),
          buildFoodAndMoneyTitle('cheese', '7 TL'),
          buildFoodAndMoneyTitle('pickle', '10 TL'),
          buildFoodAndMoneyTitle('cheese', '20 TL'),
          buildSpeciesTitle("Appetizers"),
          buildFoodAndMoneyTitle('cheese', '7 TL'),
          buildFoodAndMoneyTitle('pickle', '10 TL'),
          buildFoodAndMoneyTitle('cheese', '20 TL'),
          buildSpeciesTitle("Appetizers"),
          buildFoodAndMoneyTitle('cheese', '7 TL'),
          buildFoodAndMoneyTitle('pickle', '10 TL'),
          buildFoodAndMoneyTitle('cheese', '20 TL'),
          buildSpeciesTitle("Appetizers"),
          buildFoodAndMoneyTitle('cheese', '7 TL'),
          buildFoodAndMoneyTitle('pickle', '10 TL'),
          buildFoodAndMoneyTitle('cheese', '20 TL'),
          buildSpeciesTitle("Appetizers"),
          buildFoodAndMoneyTitle('cheese', '7 TL'),
          buildFoodAndMoneyTitle('pickle', '10 TL'),
          buildFoodAndMoneyTitle('cheese', '20 TL'),
        ]),
      ));
}

buildFoodAndMoneyTitle(String foodTitle, String money) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(foodTitle,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white)),
        Text(money,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white))
      ],
    ),
  );
}

buildSpeciesTitle(String speciesTitle) {
  return Padding(
    padding: EdgeInsets.only(left: 10, top: 20),
    child: Text(speciesTitle,
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white)),
  );
}

TabBar tabBarHeader() {
  return TabBar(
    unselectedLabelColor: Colors.grey,
    labelColor: Color(0xFF94C4BE),
    indicatorWeight: 5,
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

AppBar buildRestaruantAppbar(String name) {
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
      name,
      style: TextStyle(color: Colors.black),
    ),
  );
}

Column buildCityNameAndStar(String name, double stars) {
  return Column(
    children: [
      Row(
        children: [
          Icon(Icons.location_on, color: Colors.red),
          Text(
            name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 30, top: 10),
        child: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange[700],
            ),
            Text("$stars"),
          ],
        ),
      )
    ],
  );
}
