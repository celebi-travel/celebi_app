import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';

class SelectLocationWidget extends StatelessWidget {
  const SelectLocationWidget({
    Key? key,
    required this.value1,
    required this.value2,
    required this.onPressed,
  }) : super(key: key);

  final String value1, value2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!, width: 2),
        ),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Text(
              '$value1 : ',
              style: context.textTheme.headline6!.copyWith(color: Colors.grey, fontSize: 18),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                '$value2',
                style: context.textTheme.headline6!.copyWith(color: Colors.indigo, fontSize: 18),
              ),
            )
          ],
        ));
  }
}
