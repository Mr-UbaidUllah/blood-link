import 'package:blood_link/constants/images.dart';

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
    image: onBoarding1,
    title: "Donate Blood",
    description: "Donate blood to save life",
  ),
  OnBoardingModel(
    image: onboarding1,
    title: "Save Lives",
    description: "Every drop counts, save lives",
  ),
  OnBoardingModel(
    image: onBoarding2,
    title: "Get Connected",
    description: "Join the blood donor community",
  ),
];
