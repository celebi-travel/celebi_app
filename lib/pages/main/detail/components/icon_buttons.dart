import 'package:celebi_project/pages/main/create_route/create_route.dart';
import '../../../../extensions/context_extension.dart';
import 'package:celebi_project/pages/main/route_filter_page/route_filter_page.dart';
import 'package:flutter/material.dart';

class BuildIconButton extends StatefulWidget {
  final VoidCallback changePageFunc;
  const BuildIconButton({
    Key? key,
    required this.changePageFunc,
  }) : super(key: key);

  @override
  _BuildIconButtonState createState() => _BuildIconButtonState(changePageFunc);
}

class _BuildIconButtonState extends State<BuildIconButton> {
  final VoidCallback changePageFunc;

  _BuildIconButtonState(this.changePageFunc);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.location_on,
          color: Colors.orange,
        ),
        Row(
          children: [
            TextButton(
              onPressed: changePageFunc,
              child: Text('Create Your Route',
                  style: context.textTheme.bodyText2!
                      .copyWith(fontSize: 14, color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
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
