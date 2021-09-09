import 'package:celebi_project/models/popular_place_model.dart';
import 'package:celebi_project/models/video_response_model.dart';
import 'package:celebi_project/pages/main/video/video_screen.dart';
import 'package:celebi_project/services/network_service.dart';
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
  late NetworkService networkService;
  List<VideoResponseModel>? videoList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networkService = NetworkService();
    networkService.getVideos().then((value) {
      setState(() {
        videoList = value;
        videoList!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(videoList);
    return videoList!.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : MasonryGrid(
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
            column: 2,
            children: List.generate(6, (index) {
              print(index);
              VideoResponseModel popularPlaceModel = videoList![index];
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            popularPlaceModel.image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 8,
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
                                stops: [
                                  0.0,
                                  1.0,
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
                                      text: '${popularPlaceModel.place},\n',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                            text: popularPlaceModel.city,
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
                          VideoScreen(videoUrl: videoList![index].video!),
                    ),
                  );
                },
              );
            }),
          );
  }
}
