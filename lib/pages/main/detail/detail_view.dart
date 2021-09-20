import 'dart:io';
import 'package:celebi_project/pages/main/detail/source/product_image_list.dart';
import 'package:celebi_project/services/translator.dart';

import '../../../constants/lang/locale_keys.g.dart';
import '../../../models/place.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../services/firestore_service.dart';
import 'package:image_picker/image_picker.dart';
import 'source/post_image_list.dart';
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
    print('1');
    sliderImages = _result['generalImage'];
    print('2');
    info = _result['information'];
    print('3');
    info = await TranslatorManager.instance.translate(context, info);
    print('4');
    productImages = _result['productImage'];
    print('productImages = $productImages');
    postImages = _result['postImage'];
    print('6');
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
                                    fontWeight: FontWeight.w700, fontSize: 20)),
                            BuildIconButton(placeModel: placeModel),
                            buildReadMoreText(context, info),
                            SizedBox(height: 10),
                            Text(LocaleKeys.detail_page_products.tr(),
                                style: context.textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                            SizedBox(height: 7),
                            SizedBox(
                              height: 140,
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                children: buildProductImageList(
                                    context, productImages),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.detail_page_post.tr(),
                                  style: context.textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
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
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue[900]),
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
      colorClickableText: Colors.grey,
      trimMode: TrimMode.Length,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      style: TextStyle(color: Colors.grey[700]),
      moreStyle: context.textTheme.bodyText1!.copyWith(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13),
      lessStyle: context.textTheme.bodyText1!.copyWith(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13),
    );
  }
}
