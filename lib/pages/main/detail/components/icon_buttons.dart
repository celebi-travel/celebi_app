import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.solidPlusSquare,
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
