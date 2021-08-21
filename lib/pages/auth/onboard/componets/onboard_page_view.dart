/* import 'package:celebi_app/core/extension/context_extension.dart';
import 'package:celebi_app/core/widgets/text/locale_text.dart';
import 'package:celebi_app/views/authantication/onboard/viewmodel/onboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../onboard_model.dart';

class OnBoardPageView extends StatelessWidget {
  const OnBoardPageView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardItems.length,
      onPageChanged: (value) => onPageChanged(value),
      itemBuilder: (context, index) => buildColumnBody(context, index),
    );
  }

  Container buildColumnBody(BuildContext context, int index) {
    return Container(
      child: Column(
        children: [
          //Resim
          Expanded(
              flex: 4,
              child: SvgPicture.asset(viewModel.onBoardItems[index].imageUrl!)),
          // Boşluk
          SizedBox(height: context.height * 0.03),
          // Yazı
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LocaleText(
                  value: viewModel.onBoardItems[index].title ?? "",
                  textStyle: context.textTheme.headline5!
                      .copyWith(color: Colors.black),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: LocaleText(
                      value: viewModel.onBoardItems[index].content ?? "",
                      textStyle: TextStyle(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 */