import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';
import '../../../../models/rehber_model.dart';
import '../../guide_pay/guide_pay_view.dart';

class RehberView extends StatelessWidget {
  const RehberView({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: rehberList.length,
      itemBuilder: (BuildContext context, int index) {
        Rehber rehber = rehberList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GuidePayPage()));
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 5),
            height: context.height * 0.2,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child:CachedNetworkImage(
                     imageUrl:rehber.imageURL,
                                fit: BoxFit.cover)),
                        Center(
                          child: SizedBox(
                            height: 20,
                            child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Icon(
                                  Icons.star,
                                  size: 10,
                                  color: Colors.yellow,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${rehber.name}',
                        style: context.textTheme.headline6,
                      ),
                      Divider(
                        height: 8,
                        thickness: 1,
                      ),
                      Text(
                        '${rehber.bio}asdsad${rehber.bio}${rehber.bio}${rehber.bio}${rehber.bio}${rehber.bio}${rehber.bio}${rehber.bio}${rehber.bio}asdasdasdas${rehber.bio}',
                        style: context.textTheme.bodyText2,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
