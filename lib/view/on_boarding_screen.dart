import 'package:blood_link/res/components/my_reusable_button.dart';
import 'package:blood_link/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blood_link/view_model/on_boarding_view_model.dart';
import 'package:blood_link/models/on_boarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnBoardingViewModel>(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: viewModel.skipToEnd,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: viewModel.pageController,
              onPageChanged: viewModel.updateIndex,
              itemCount: onBoardingContent.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: viewModel.pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (viewModel.pageController.position.haveDimensions) {
                      value = viewModel.pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: Opacity(opacity: value, child: child),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          onBoardingContent[index].image,
                          height: 250,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          onBoardingContent[index].title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          onBoardingContent[index].description,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Page indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingContent.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: viewModel.currentIndex == index ? 30 : 15,
                height: 10,
                decoration: BoxDecoration(
                  color: viewModel.currentIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: MyReusableButton(
                title: viewModel.currentIndex == onBoardingContent.length - 1
                    ? "Get Start"
                    : "Next",
                onPress: () {
                  if (viewModel.currentIndex == onBoardingContent.length - 1) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  } else {
                    viewModel.nextPage();
                  }
                },
                color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }
}
