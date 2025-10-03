class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}


final List<OnBoardingModel> onBoardingContent = [
  OnBoardingModel(
    image: "assets/images/on_boarding1.jpg",
    title: "Donate Blood",
    description: "Donate blood to save life",
  ),
  OnBoardingModel(
    image: "assets/images/onboarding1.png",
    title: "Save Lives",
    description: "Every drop counts, save lives",
  ),
  OnBoardingModel(
    image: "assets/images/on_boarding1.jpg",
    title: "Get Connected",
    description: "Join the blood donor community",
  ),
];
