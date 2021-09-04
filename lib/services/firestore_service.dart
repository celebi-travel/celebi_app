import 'dart:io';
import '../models/hotel_model.dart';
import '../models/restaurant_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*Future<void> saveHotelData({required Hotel hotel}) async {
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
        .doc(restaurant.restaurantName.replaceAll(RegExp(' '), '-'))
        .set(
          restaurant.toMap(),
        );
  }
*/
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

  Future<void> saveImage(String city, File image) async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    File file = File(image.path);
    var snap = await _storage
        .ref()
        .child("images/${image.path}/${basename(file.path)}")
        .putFile(file);
    String url = await snap.ref.getDownloadURL();
    var res = await FirebaseFirestore.instance
        .collection('Detail')
        .doc(city.toLowerCase())
        .get();
    List images = (res.data() as Map)['postImage'];
    images.add(url);
    print(
        'file = $file, file.path = ${file.path}, image.path = ${image.path}, url ? $url');

    await FirebaseFirestore.instance
        .collection('Detail')
        .doc(city.toLowerCase())
        .update(
      {
        'postImage': images,
      },
    );
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

  Future<void> getMusics() async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    ListResult result = await _storage.ref().child('musics').list();
    for (var i = 0; i < result.items.length; i++) {
      String url = await result.items[i].getDownloadURL();
      print('$i, url = $url');
    }
  }

  Future<Map<String, dynamic>> getDetailDataOfCity(String city) async {
    print('city = $city, + ${city.toLowerCase()}');
    DocumentSnapshot<Map<String, dynamic>> _data = await FirebaseFirestore
        .instance
        .collection('Detail')
        .doc(city.toLowerCase())
        .get();
    return _data.data()!;
  }
}

List urls = [
  'https://firebasestorage.googleapis.com/v0/b/celebi-9ee0d.appspot.com/o/musics%2FSelda%20Bagcan%20-%20Gesi%20Ba%C4%9Flar%C4%B1.mp3?alt=media&token=16a30aaa-2343-4d04-846c-d9c87f5a53e1'
      'https://drive.google.com/file/d/1y0bh8JlXd6Wwq6FGJfxEqjA2T6AEqi5v/view?usp=sharing',
  'https://www.youtube.com/watch?v=2aoRw_h_8es',
  'https://soundcloud.com/mirsaid-733633977/selda-bagcan-gesi-baglari-1',
];
