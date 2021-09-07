import 'dart:io';
import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:celebi_project/models/place.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/pages/main/detail/source/slider_image_list.dart';
import 'package:easy_localization/easy_localization.dart';

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
  final PlaceModel placeModel;

  const DetailPage({
    Key? key,
    required this.placeModel,
  }) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(placeModel);
}

class _DetailPageState extends State<DetailPage> {
  ScrollController scrollController = ScrollController(keepScrollOffset: true);

  final ImagePicker _picker = ImagePicker();
  final PlaceModel placeModel;
  List sliderImages = [];
  List productImages = [];
  List postImages = [];
  late String info;
  bool loaded = false;

  _DetailPageState(this.placeModel);

  Future<void> _getDataOfCity() async {
    Map<String, dynamic> _result =
        await FirestoreService().getDetailDataOfCity(placeModel.city!);
    sliderImages = _result['generalImage'];
    info = _result['information'];
    productImages = _result['productImage'];
    postImages = _result['postImage'];
    loaded = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getDataOfCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: bottomBarMethod(context),
      body: loaded
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ImageSlider(
                    imagesList: sliderImages,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(placeModel.city!,
                                style: context.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 16)),
                            BuildIconButton(placeModel: placeModel),
                            buildReadMoreText(context, info),
                            SizedBox(height: 14),
                            Text(LocaleKeys.detail_page_products.tr(),
                                style: context.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 18)),
                            SizedBox(
                              height: 120,
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                children: buildProductImageList(
                                    context, productImages),
                              ),
                            ),
                            SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.detail_page_post.tr(),
                                  style: context.textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      XFile? xfile = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      File file = File(xfile!.path);
                                      await FirestoreService()
                                          .saveImage(placeModel.city!, file);
                                      _getDataOfCity();
                                      setState(() {});
                                    },
                                    child: Text(
                                      LocaleKeys.detail_page_btn_upload.tr(),
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
                                children:
                                    buildPostImageList(context, postImages),
                              ),
                            ),
                          ]))
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  ReadMoreText buildReadMoreText(BuildContext context, String info) {
    return ReadMoreText(
      info,
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
