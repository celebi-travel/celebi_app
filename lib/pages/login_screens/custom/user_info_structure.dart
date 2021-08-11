import 'package:flutter/material.dart';
import '../../../extensions/context_extension.dart';

Padding buildUserInfoStructure(
    BuildContext context, IconData icon, String hintText) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: SizedBox(
      width: 350,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFB6DAE6)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xFFEBF4F7),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal[200],
          ),
          title: TextFormField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBF4F7)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBF4F7)),
              ),
              hintText: hintText,
              hintStyle: context.textTheme.headline6!
                  .copyWith(color: Colors.grey, fontSize: 18),
            ),
          ),
        ),
      ),
    ),
  );
}
