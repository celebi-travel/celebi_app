import 'package:flutter/material.dart';

Image buildImage(String image) {
  return Image.network(
    image,
    fit: BoxFit.cover,
  );
}
