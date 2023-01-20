class Slider {
  final String id;
  final String sliderImageUrl;
  final String sliderMainText;
  final String sliderSubHeading;

  Slider(
      this.id, this.sliderImageUrl, this.sliderMainText, this.sliderSubHeading);
}

final sliderArrayList = [
  Slider('1', 'lib/assets/mobile.png', 'Get Food Faster',
      'Browse up to 20,000+ food \n locations close to you.'),
  Slider('2', 'lib/assets/mobile.png', 'Super Speed Delivery',
      'Guranteed under 30 minutes \n from our store to your home.'),
  Slider('3', 'lib/assets/mobile.png', 'Variety Options',
      'Delicious foods available \n select and get best food.'),
];
