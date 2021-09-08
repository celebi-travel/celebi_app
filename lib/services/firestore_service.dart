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
  Future<void> saveNewUserData(
      {required User user,
      required String username,
      required String dateOfBirth}) async {
    await _firestore.collection('users').doc(user.uid).set(
      {
        'uid': user.uid,
        'email': user.email,
        'username': username,
        'dateOfBirth': dateOfBirth,
        'savedData': {
          'cities': [],
          'hotels': [],
          'restaurants': [],
          'favoritePlaces': [],
        }
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
    print(_data.data()!);
    return _data.data()!;
  }

  Future<void> makeReservation({
    required Hotel hotel,
    required DateTime startDate,
    required DateTime endDate,
    required int adultNumber,
    required int childNumber,
    required int roomNumber,
    required String type,
    required String hotelImageUrl,
    required int price,
  }) async {
    String username = await FirestoreService().getCurrentUsersUsername();
    String uid = AuthService().getCurrentUser()!.uid;
    await FirebaseFirestore.instance
        .collection('hotel-reservations')
        .doc('${hotel.hotelName}-$startDate-$endDate')
        .set(
      {
        'hotelName': hotel.hotelName,
        'startDate': Timestamp.fromDate(startDate),
        'endDate': Timestamp.fromDate(endDate),
        'adultNumber': adultNumber,
        'childNumber': childNumber,
        'roomNumber': roomNumber,
        'type': type,
        'price': price,
        'username': username,
        'uid': uid,
        'hotelImageUrl': hotelImageUrl,
      },
    );
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getMyReservations() async {
    String uid = AuthService().getCurrentUser()!.uid;
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection('hotel-reservations')
        .where('uid', isEqualTo: uid)
        .get();

    return result.docs;
  }

  Future<void> saveViewedHotel(String name) async {
    String uid = AuthService().getCurrentUser()!.uid;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map savedData = (documentSnapshot.data() as Map)['savedData'];
    savedData['hotels'].add(name);
    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {'savedData': savedData},
    );
  }

  Future<void> saveViewedRestaurant(String name) async {
    String uid = AuthService().getCurrentUser()!.uid;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map savedData = (documentSnapshot.data() as Map)['savedData'];
    savedData['restaurants'].add(name);
    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {'savedData': savedData},
    );
  }

  Future<void> saveViewedCity(String name) async {
    String uid = AuthService().getCurrentUser()!.uid;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map savedData = (documentSnapshot.data() as Map)['savedData'];
    savedData['cities'].add(name);
    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {'savedData': savedData},
    );
  }

  Future<Map> getSavedData() async {
    String uid = AuthService().getCurrentUser()!.uid;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map savedData = (documentSnapshot.data() as Map)['savedData'];
    if (savedData['hotels'].length > 3) {
      for (var i = 0; i < savedData['hotels'].length - 3; i++) {
        savedData['hotels'].removeAt(0);
      }
    }

    if (savedData['restaurants'].length > 3) {
      for (var i = 0; i < savedData['restaurants'].length - 3; i++) {
        savedData['restaurants'].removeAt(0);
      }
    }
    if (savedData['cities'].length > 3) {
      for (var i = 0; i < savedData['cities'].length - 3; i++) {
        savedData['cities'].removeAt(0);
      }
    }
    return savedData;
  }

  Future<String> getHotelImagefromName(String name) async {
    name = name.replaceAll(' ', '-');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('hotels').doc(name).get();

    return (documentSnapshot.data() as Map)['images'].first;
  }

  Future<String> getRestaurantImagefromName(String name) async {
    name = name.replaceAll(' ', '-');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('restaurants')
            .doc(name)
            .get();

    return (documentSnapshot.data() as Map)['imageUrls'].first;
  }

  Future<String> getCityImagefromName(String name) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('Detail')
            .doc(name.toLowerCase())
            .get();

    return (documentSnapshot.data() as Map)['generalImage'].first;
  }

  Future<void> saveFavoritePlace(
      String city, String category, String name) async {
    String uid = AuthService().getCurrentUser()!.uid;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map savedData = (documentSnapshot.data() as Map)['savedData'];
    savedData['favoritePlaces'].add('$city&$category&$name');
    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {'savedData': savedData},
    );
  }

  Future<List> getFavoritePlaces() async {
    String uid = AuthService().getCurrentUser()!.uid;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map savedData = (documentSnapshot.data() as Map)['savedData'];
    return savedData['favoritePlaces'];
  }
}
