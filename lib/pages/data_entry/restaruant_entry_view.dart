import 'package:celebi_project/models/hotel_model.dart';
import 'package:celebi_project/models/restaurant_model.dart';
import 'package:celebi_project/services/firestore_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController hotelNameController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();
    TextEditingController image2UrlController = TextEditingController();
    TextEditingController image3UrlController = TextEditingController();
    TextEditingController image4UrlController = TextEditingController();
    TextEditingController image5UrlController = TextEditingController();
    TextEditingController ratingController = TextEditingController();
    TextEditingController placeController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: hotelNameController,
                decoration: InputDecoration(labelText: 'hotel name'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'image url'),
              ),
              TextField(
                controller: image2UrlController,
                decoration: InputDecoration(labelText: 'image url'),
              ),
              TextField(
                controller: image3UrlController,
                decoration: InputDecoration(labelText: 'image url'),
              ),
              TextField(
                controller: image4UrlController,
                decoration: InputDecoration(labelText: 'image url'),
              ),
              TextField(
                controller: image5UrlController,
                decoration: InputDecoration(labelText: 'image url'),
              ),
              TextField(
                controller: ratingController,
                decoration: InputDecoration(labelText: 'rating '),
              ),
              TextField(
                controller: placeController,
                decoration: InputDecoration(labelText: 'place'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'description'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'price'),
                controller: priceController,
              ),
              TextButton(
                  onPressed: () {
                    Restaurant restaurant = Restaurant(
                      hotelNameController.text,
                      [
                        imageUrlController.text,
                        image2UrlController.text,
                        image3UrlController.text,
                        image4UrlController.text,
                        image5UrlController.text,
                      ],
                      double.parse(ratingController.text),
                      placeController.text,
                    );
                    print(restaurant);
                    FirestoreService()
                        .saveRestaurantData(restaurant: restaurant);
                  },
                  child: Text('post'))
            ],
          ),
        ),
      ),
    );
  }
}
