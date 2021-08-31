import 'package:google_maps_flutter/google_maps_flutter.dart';

const Map<String, List<LatLng>> randomLatLongs = {
  'Bursa': [
    LatLng(40.2056008312816, 29.02953452989547),
    LatLng(40.23024379756766, 28.9217311922115),
    LatLng(40.169406623866806, 29.091332621561435),
    LatLng(40.2386308475282, 29.064553448506185),
    LatLng(40.23469956380769, 28.942328500016387),
    LatLng(40.264047762270195, 28.958807991127312),
    LatLng(40.17544034955541, 29.054251710478088),
  ],
  'Balıkesir': [
    LatLng(39.655747298225684, 27.884430336717504),
    LatLng(39.6439839831322, 27.91412775299032),
    LatLng(39.67485831562974, 27.889329946448253),
    LatLng(39.62801975119929, 27.883614000758037),
    LatLng(39.66385882001286, 27.908927474528987),
    LatLng(39.62693023206627, 27.88151209349995),
    LatLng(39.62851680487754, 27.876705575259262),
  ],
  'Sakarya': [
    LatLng(40.960898069448056, 30.541826591354816),
    LatLng(40.440337812320855, 30.21772993283996),
    LatLng(40.75316219395567, 30.79725870357416),
    LatLng(40.479780293540614, 30.155111364547537),
    LatLng(40.58415634507565, 30.742879880837197),
    LatLng(40.883850428824985, 30.29656032991631),
    LatLng(40.89838447469593, 30.78682519046633),
  ],
  'Çanakkale': [
    LatLng(40.16272574548264, 26.41096812154868),
    LatLng(40.14028917703125, 26.403930005553388),
    LatLng(40.10274712475158, 26.395861921363664),
    LatLng(40.16627145283922, 26.41655668988687),
    LatLng(40.13693719882517, 26.40716620768152),
    LatLng(40.102593793544905, 26.400837839238783),
    LatLng(40.147548923478524, 26.458813859810956),
  ],
  'İstanbul': [
    LatLng(41.00290959576814, 28.78417200505285),
    LatLng(41.074381711838605, 29.03685753542037),
    LatLng(40.99980035209238, 29.11238853634545),
    LatLng(41.06195735367035, 28.63311000320271),
    LatLng(41.18609527160839, 29.04784386282766),
    LatLng(41.007055025831576, 29.03685753542037),
    LatLng(40.92720969725891, 29.152213973196844),
    LatLng(40.994617953347664, 29.220878519492363),
    LatLng(40.9863252679044, 29.040977408198103),
  ],
  'Antalya': [
    LatLng(36.956649668054624, 30.71707235327635),
    LatLng(36.883364069588644, 30.74591146272047),
    LatLng(36.85699698073053, 30.626435152166266),
    LatLng(36.965976860313944, 30.672097075452786),
    LatLng(36.94924196618299, 30.712265835035666),
    LatLng(36.89022900532507, 30.706772671332025),
    LatLng(36.87924481186257, 30.778527122210843),
  ],
  'Edirne': [
    LatLng(41.6696396173979, 26.56611397919351),
    LatLng(41.692204040738645, 26.576585322503583),
    LatLng(41.654891544231106, 26.59100487722564),
    LatLng(41.68002536317688, 26.56353905870743),
    LatLng(41.6700243045333, 26.565942317827776),
    LatLng(41.66194539195488, 26.588429956739557),
    LatLng(41.64539969371618, 26.590489893128424),
  ],
  'Trabzon': [
    LatLng(40.99162456201142, 39.66430942683032),
    LatLng(41.00406219927737, 39.71477786835753),
    LatLng(40.99110627619626, 39.79305545113443),
    LatLng(40.99162456201142, 39.6615628449785),
    LatLng(40.99602982694159, 39.707568090996496),
    LatLng(40.98877393960942, 39.7367505231721),
    LatLng(40.99447506116742, 39.78515902831043),
  ],
};
