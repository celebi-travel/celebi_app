import 'dart:io';
import 'package:celebi_project/models/hotel_model.dart';
import 'package:celebi_project/models/restaurant_model.dart';
<<<<<<< HEAD
=======
import 'package:firebase_storage/firebase_storage.dart';
>>>>>>> 17ddb77df165497eee5b5ddb38be655cd17b28c7
import 'package:path/path.dart';
import 'package:celebi_project/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveHotelData({required Hotel hotel}) async {
    print(hotel.toMap());
    await _firestore
        .collection('hotels')
        .doc(hotel.hotelName.replaceAll(RegExp(' '), '-'))
        .set(
          hotel.toMap(),
        );
  }

  Future<void> saveRestaurantData({required Restaurant restaurant}) async {
    await _firestore
        .collection('restaurants')
        .doc(restaurant.name.replaceAll(RegExp(' '), '-'))
        .set(
          restaurant.toMap(),
        );
  }

  Future<void> saveNewUserData(
      {required User user,
      required String username,
      required String dateOfBirth}) async {
    await _firestore.collection('users').doc(user.uid).set(
      {
        'uid': user.uid,
        'email': user.email,
        'username': username,
        'dateOfBirth': dateOfBirth
      },
    );
  }

  Future<String> getCurrentUsersUsername() async {
    User? _user = AuthService().getCurrentUser();
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(_user!.uid).get();
    return snapshot.get('username');
  }

  Future<void> changeUsername(String newUsername) async {
    User _user = AuthService().getCurrentUser()!;
    await _firestore
        .collection('users')
        .doc(_user.uid)
        .update({'username': newUsername});
  }

  Future<void> deleteUser(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }

  Future<String> getUsernameByUID(String uid) async {
    QuerySnapshot _querySnapshot =
        await _firestore.collection('users').where('uid', isEqualTo: uid).get();
    return (_querySnapshot.docs.first.data() as Map)['username'];
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getImages() async {
    QuerySnapshot _querySnapshot = await _firestore.collection('images').get();
    return _querySnapshot.docs;
  }

  Future<void> saveImage(File image) async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    File file = File(image.path);
    var snap = await _storage
        .ref()
        .child("images/${image.path}/${basename(file.path)}")
        .putFile(file);
    String url = await snap.ref.getDownloadURL();

    print(
        'file = $file, file.path = ${file.path}, image.path = ${image.path}, url ? $url');

    await FirebaseFirestore.instance
        .collection('images')
        .doc()
        .set({"url": url, "name": basename(file.path)});
  }

  Future<List<Hotel>> getHotels() async {
    QuerySnapshot<Map<String, dynamic>> hotels =
        await FirebaseFirestore.instance.collection('hotels').get();
    List<Hotel> _hotels = [];
    hotels.docs.forEach((element) {
      var _hotelMap = element.data();
      _hotels.add(Hotel.fromJson(_hotelMap));
    });
    return _hotels;
  }

  Future<List<Restaurant>> getRestaurants() async {
    QuerySnapshot<Map<String, dynamic>> restaurants =
        await FirebaseFirestore.instance.collection('restaurants').get();
    List<Restaurant> _restaurants = [];
    restaurants.docs.forEach((element) {
      var _restaurantMap = element.data();
      _restaurants.add(Restaurant.fromJson(_restaurantMap));
    });
    return _restaurants;
  }
}
