import 'dart:io';

import 'package:celebi_project/pages/main/detail/source/slider_image_list.dart';

import '../../../services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import 'source/post_image_list.dart';
import 'source/product_image_list.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../../extensions/context_extension.dart';
import 'components/appbar.dart';
import 'components/icon_buttons.dart';
import '../../../constants/image_slider.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  final VoidCallback changePageFunc;

  const DetailPage({
    Key? key,
    required this.changePageFunc,
  }) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(changePageFunc);
}

class _DetailPageState extends State<DetailPage> {
  ScrollController scrollController = ScrollController(keepScrollOffset: true);
  final VoidCallback changePageFunc;

  final ImagePicker _picker = ImagePicker();

  _DetailPageState(this.changePageFunc);

  List<String> images = [];

  Future<void> _getImages() async {
    images = [];
    List<QueryDocumentSnapshot<Object?>> _images =
        await FirestoreService().getImages();
    _images.forEach((element) {
      images.add((element.data() as Map)['url']);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(
              imagesList: detailimagesList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nemrut Mountain',
                      style: context.textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 16)),
                  BuildIconButton(changePageFunc: changePageFunc),
                  buildReadMoreText(context),
                  SizedBox(height: 14),
                  Text('Product',
                      style: context.textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 18)),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      physics: ClampingScrollPhysics(),
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      children: buildProductImageList(context),
                    ),
                  ),
                  Text('Post',
                      style: context.textTheme.bodyText1!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 18)),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Post',
                        style: context.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () async {
                            XFile? xfile = await _picker.pickImage(
                                source: ImageSource.gallery);
                            File file = File(xfile!.path);
                            await FirestoreService().saveImage(file);
                            await _getImages();
                            setState(() {});
                          },
                          child: Text(
                            'Fotoğraf Ekle',
                            style: TextStyle(fontSize: 14),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      physics: ClampingScrollPhysics(),
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      children: buildPostImageList(context, images),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ReadMoreText buildReadMoreText(BuildContext context) {
    return ReadMoreText(
      'Adıyaman has a very ancient and magical historical background. There are a lot of marks of ancient civilizations from the oldest times. show more Adıyaman has a very ancient and magical historical background. There are a lot of marks of ancient civilizations from the oldest times. show more  Adıyaman has a very ancient and magical historical background. There are a lot of marks of ancient civilizations from the oldest times. show more Adıyaman has a very ancient and magical historical background. There are a lot of marks of ancient civilizations from the oldest times. show more',
      trimLength: 200,
      colorClickableText: Colors.blue[900],
      trimMode: TrimMode.Length,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      style: TextStyle(color: Colors.black),
      moreStyle: context.textTheme.bodyText1!.copyWith(
          color: Colors.blue[900], fontWeight: FontWeight.w700, fontSize: 13),
      lessStyle: context.textTheme.bodyText1!.copyWith(
          color: Colors.blue[900], fontWeight: FontWeight.w700, fontSize: 13),
    );
  }
}
