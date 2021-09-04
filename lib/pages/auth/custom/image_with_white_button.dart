import 'package:flutter/material.dart';

Image buildImage(String image) {
  return Image.asset(
    image,
    fit: BoxFit.cover,
  );
}
