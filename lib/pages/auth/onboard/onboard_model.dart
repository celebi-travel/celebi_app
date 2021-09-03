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
      title: 'Plan Your Travel',
      content:
          'Let us calculate the budget required for your travel plan for you.',
      imageUrl: 'asset/images/onboard1.png'),
  OnBoardModel(
      title: 'Enjoy Your Travel',
      content:
          'Everything you need to have a safe, peaceful and comfortable holiday is here!',
      imageUrl: 'asset/images/onboard2.png'),
  OnBoardModel(
      title: 'Explore Turkey with us',
      content:
          'Book restaurants and hotels easily while discovering the natural history and cultural beauties of Turkey. Collect unforgettable memories by benefiting from the experiences of millions of people',
      imageUrl: 'asset/images/onboard3.png'),
];
