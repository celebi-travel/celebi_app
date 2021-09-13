import 'package:flutter/material.dart';

Padding imageStructure(
  BuildContext context,
  String image,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 2),
    child: SizedBox(
      width: 120,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Padding imageStructureNetwork(
  BuildContext context,
  String image,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 2),
    child: SizedBox(
      width: 120,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Padding imageStructureWithTextNetwork(
    BuildContext context, String image, String name) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 2),
    child: Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(name),
      ],
    ),
  );
}
