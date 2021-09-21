import 'package:cached_network_image/cached_network_image.dart';
import 'package:celebi_project/youtube_player_page.dart';

import '../../../../models/video_response_model.dart';
import '../../video/video_screen.dart';
import '../../../../services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';

/*lass Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormalHorizontal,
      child: Column(
        children: [
          Expanded(flex: 4, child: HeadTitle()),
          buildSearchField(),
          Spacer(),
          buildNearbyLocationsText(context),
          //Expanded(flex: 3, child: NearbyLocations()),
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Popular Cities',
              style: context.textTheme.headline6!.copyWith(letterSpacing: 0.3, fontWeight: FontWeight.bold),
            ),
          ),
          // Expanded(flex: 3, child: NearbyLocations()),
          Spacer(),
          buildPopularPlaceText(context),
          Expanded(flex: 17, child: SingleChildScrollView(physics: BouncingScrollPhysics(), child: PopularPlaces()))
        ],
      ),
    );
  }

  Align buildNearbyLocationsText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Nearby Locations',
        style: context.textTheme.headline6!.copyWith(letterSpacing: 0.3, fontWeight: FontWeight.bold),
      ),
    );
  }

  Row buildPopularPlaceText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Places',
          style: context.textTheme.headline6!.copyWith(letterSpacing: 0.3, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: () {}, child: Text('See All')),
      ],
    );
  }

  Container buildSearchField() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.text,
          validator: (value) {},
          controller: widget.searchController,
          maxLength: 30,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: IconButton(
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  iconSize: 20,
                  icon: Icon(
                    Icons.tune,
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
            ),
            border: InputBorder.none,
            hintText: 'Search for Place, Hotel, Food, Flight ...',
          ),
          cursorHeight: 20,
        ),
      ),
    );
  }
}
*/

class PopularPlaces extends StatefulWidget {
  const PopularPlaces({
    Key? key,
  }) : super(key: key);

  @override
  _PopularPlacesState createState() => _PopularPlacesState();
}

class _PopularPlacesState extends State<PopularPlaces> {
  /*late NetworkService networkService;
  List<VideoResponseModel>? videoList = [
    VideoResponseModel()/*
    'http://localhost:8000/media/media/videos/Mardin_Tan%C4%B1t%C4%B1m_Filmi.mp4',
    'http://localhost:8000/media/media/videos/G%C3%B6rkemli_%C4%B0STANBUL_istanbul_tan%C4%B1t%C4%B1m_filmi_WkKAzC9.mp4',
    'http://localhost:8000/media/media/videos/Gaziantep_Tan%C4%B1t%C4%B1m_Filmi_2020.mp4',
    'http://localhost:8000/media/media/videos/Turizm_Cenneti_Antalya_tan%C4%B1t%C4%B1m_Videosu___antalya_promotional_video.mp4',
    'http://localhost:8000/media/media/videos/Konya_Zaman%C4%B1_A%C5%9Fan_%C5%9Eehir_Konya_Tan%C4%B1t%C4%B1m_Filmi__Konya_Film_Konya_Turkey_Konya__ZVzp0fB.mp4',
    'http://localhost:8000/media/media/videos/Fethiye_Tan%C4%B1t%C4%B1m_Filmi.mp4',
    'http://localhost:8000/media/media/videos/Karadeniz_Tan%C4%B1t%C4%B1m_Videosu.mp4',
    'http://localhost:8000/media/media/videos/Karadeniz_Tan%C4%B1t%C4%B1m_Videosu.mp4',*/
  ];
  @override
  void initState() {
    super.initState();
    networkService = NetworkService();
    networkService.getVideos().then((value) {
      setState(() {
        videoList = value;
        videoList!;
      });
    });
  }*/

  List<Map> data = [
    {'image':'https://i.pinimg.com/originals/cd/d5/21/cdd5214b4a679f05bb6656ad711869ad.jpg','video':'https://www.youtube.com/watch?v=ZgPpkRzE8gU','city':'Nevşehir','place':'Peri Bacaları'},
    {'image':'https://images.etstur.com/definitions/etstur/page_management/af1309a0bb51c70c7fcc4bee93a8be6e_20210323124930.jpg','video':'https://www.youtube.com/watch?v=Bw9QnL7Wa8Y','city':'Antalya','place':'Kaş'},
    {'image':'https://i.natgeofe.com/n/bd729afd-04b7-4589-b9cd-913449c48c6a/istanbul-travel_2x3.jpg','video':'https://www.youtube.com/watch?v=eV6lTEY95yY&t=19s','city':'İstanbul','place':'Ayasfoya'},
    {'image':'https://i.pinimg.com/736x/e7/4f/04/e74f04be23f2f27f68e4e561e43eb169.jpg','video':'https://www.youtube.com/watch?v=5w8ydPqMtGg&t=58s','city':'İzmir','place':'Alaçatı'},
    {'image':'http://3.bp.blogspot.com/-FeZ0kYM9l8Q/UjzQmdEhg0I/AAAAAAAAHL0/sUK8pN1D9cM/s1600/NSG_9951.c1.jpg','video':'https://www.youtube.com/watch?v=BB0SUKR-huw','city':'Gaziantep','place':'Şehitkamil'},
    {'image':'https://www.gezzytur.com/turresim/3395_b.jpg','video':'https://www.youtube.com/watch?v=_FsK2fQlKy8','city':'Konya','place':'Kelebekler Vadisi'},
    {'image':'https://planetofhotels.com/guide/sites/default/files/styles/big_gallery_image/public/text_gallery/Fethiye-1.jpg','video':'https://www.youtube.com/watch?v=NVJrT8c0hpc','city':'Muğla','place':'Fethiye'},
  ];

  @override
  Widget build(BuildContext context) { 
    return MasonryGrid(
      
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
            column: 2,
            children: List.generate(6, (index) {
              print(index);
              Map _value = data[index];
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          child: CachedNetworkImage(
                     imageUrl: _value['image'],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: 0, 
                          right: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: FractionalOffset.center,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.grey.withOpacity(0.0),
                                  Colors.black,
                                ], 
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: '${_value['place']},\n',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text: _value['city'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    minRadius: 13,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          YoutubePlayerPage(videoURL: _value['video']),
                    ),
                  );
                },
              );
            }),
          );
  }
}
