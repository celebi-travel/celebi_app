import 'package:celebi_project/pages/main/detail/detail_view.dart';

import '../../../../models/place.dart';
import '../../../../extensions/context_extension.dart';
import 'package:flutter/material.dart';

class NearbyLocations extends StatefulWidget {
  NearbyLocations({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  _NearbyLocationsState createState() => _NearbyLocationsState();
}

class _NearbyLocationsState extends State<NearbyLocations> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(left: 8, top: 10),
            itemCount: nearbyLocations.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Stack(children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                placeModel: nearbyLocations[index],
                              )));
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  width: context.height * 0.08,
                  height: context.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        nearbyLocations[index].imageUrl!,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                placeModel: nearbyLocations[index],
                              )));
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  width: context.height * 0.08,
                  height: context.height * 0.08,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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
                  child: HeadText(
                    text: nearbyLocations[index].city!,
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}

class HeadText extends StatelessWidget {
  const HeadText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.bodyText2!
          .copyWith(color: Colors.white, fontSize: 10),
    );
  }
}
