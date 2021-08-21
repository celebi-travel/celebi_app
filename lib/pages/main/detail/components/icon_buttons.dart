import 'package:celebi_project/pages/main/create_route/create_route.dart';
import 'package:flutter/material.dart';

class BuildIconButton extends StatefulWidget {
  const BuildIconButton({
    Key? key,
  }) : super(key: key);

  @override
  _BuildIconButtonState createState() => _BuildIconButtonState();
}

class _BuildIconButtonState extends State<BuildIconButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
              color: Colors.orange,
            )),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateRoutePage()));
                },
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                )),
          ],
        )
      ],
    );
  }
}
