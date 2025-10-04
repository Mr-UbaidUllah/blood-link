import 'package:blood_link/widgets/my_reusable_button.dart';
import 'package:blood_link/routes/export.dart';
import 'package:blood_link/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:blood_link/viewmodel/on_boarding_controller.dart';
import 'package:blood_link/models/on_boarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnBoardingProvider>(context);

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
                  onPressed: () {
                    NavigationHelper.off(AppRoutes.signIn);
                  },
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
                          height: SizeUtils.height(250),
                        ),
                        SizeUtils.heightSizeBox(40),
                        Text(
                          onBoardingContent[index].title,
                          style: TextStyle(
                            fontSize: SizeUtils.fontSize(24),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizeUtils.heightSizeBox(15),
                        Text(
                          onBoardingContent[index].description,
                          style: TextStyle(fontSize: SizeUtils.fontSize(16)),
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
                width: viewModel.currentIndex == index
                    ? SizeUtils.width(30)
                    : SizeUtils.width(15),
                height: SizeUtils.height(10),
                decoration: BoxDecoration(
                  color: viewModel.currentIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          SizeUtils.heightSizeBox(20),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: MyReusableButton(
                title: viewModel.currentIndex == onBoardingContent.length - 1
                    ? "Get Start"
                    : "Next",
                onPress: () {
                  if (viewModel.currentIndex == onBoardingContent.length - 1) {
                    NavigationHelper.off(AppRoutes.signIn);
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
