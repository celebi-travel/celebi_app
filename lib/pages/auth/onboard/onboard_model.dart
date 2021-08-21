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
      title: 'Onboard 1',
      content: 'onboard  onboardonboardonboardonboard onboard1',
      imageUrl: 'asset/svgs/cart.svg'),
  OnBoardModel(
      title: 'Onboard 1',
      content: 'onboard  onboardonboardonboardonboard onboard1',
      imageUrl: 'asset/svgs/destination.svg'),
  OnBoardModel(
      title: 'Onboard 1',
      content: 'onboard  onboardonboardonboardonboard onboard1',
      imageUrl: 'asset/svgs/connect.svg'),
];
