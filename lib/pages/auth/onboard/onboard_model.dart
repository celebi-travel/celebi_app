import 'package:celebi_project/constants/lang/locale_keys.g.dart';

class OnBoardModel {
  String? title;
  String? content;
  String? imageUrl;
  OnBoardModel({
    this.title,
    this.content,
    this.imageUrl,
  });
}

List<OnBoardModel> onBoardItems = [
  OnBoardModel(
      title: LocaleKeys.onboard_page1_title,
      content: LocaleKeys.onboard_page1_content,
      imageUrl: 'asset/images/onboard1.png'),
  OnBoardModel(
      title: LocaleKeys.onboard_page2_title,
      content: LocaleKeys.onboard_page2_content,
      imageUrl: 'asset/images/onboard2.png'),
  OnBoardModel(
      title: LocaleKeys.onboard_page3_title,
      content: LocaleKeys.onboard_page3_content,
      imageUrl: 'asset/images/onboard3.png'),
];
