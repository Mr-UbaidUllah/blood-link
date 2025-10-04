import 'dart:async';
import 'package:blood_link/constants/images.dart';
import 'package:blood_link/constants/colors.dart';
import 'package:blood_link/routes/export.dart';
import 'package:blood_link/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _slideController;
  late AnimationController _pulseController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _startAnimations();

    // Navigate after animations complete
    Timer(const Duration(seconds: 3), () {
      NavigationHelper.off(AppRoutes.onboarding);
    });
  }

  void _startAnimations() async {
    // Start fade animation
    _fadeController.forward();

    // Start scale animation with delay
    await Future.delayed(const Duration(milliseconds: 300));
    _scaleController.forward();

    // Start rotation animation with delay
    await Future.delayed(const Duration(milliseconds: 200));
    _rotationController.forward();

    // Start slide animation with delay
    await Future.delayed(const Duration(milliseconds: 500));
    _slideController.forward();

    // Start pulse animation with delay
    await Future.delayed(const Duration(milliseconds: 800));
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fullWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Blood Icon with multiple effects
            AnimatedBuilder(
              animation: Listenable.merge([
                _fadeAnimation,
                _scaleAnimation,
                _rotationAnimation,
                _pulseAnimation,
              ]),
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotationAnimation.value * 0.1, // Subtle rotation
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Pulsing background circles
                          AnimatedBuilder(
                            animation: _pulseAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulseAnimation.value,
                                child: Container(
                                  width: SizeUtils.width(180),
                                  height: SizeUtils.height(180),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        primaryRed.withValues(alpha: 0.15),
                                        primaryRed.withValues(alpha: 0.08),
                                        primaryRed.withValues(alpha: 0.03),
                                        Colors.transparent,
                                      ],
                                      stops: const [0.0, 0.3, 0.7, 1.0],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // Second pulsing circle
                          AnimatedBuilder(
                            animation: _pulseAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulseAnimation.value * 0.7,
                                child: Container(
                                  width: SizeUtils.width(140),
                                  height: SizeUtils.height(140),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        secondaryCoral.withValues(alpha: 0.2),
                                        secondaryCoral.withValues(alpha: 0.1),
                                        secondaryCoral.withValues(alpha: 0.05),
                                        Colors.transparent,
                                      ],
                                      stops: const [0.0, 0.4, 0.8, 1.0],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // Main icon container
                          Container(
                            padding: EdgeInsets.all(SizeUtils.width(20)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  primaryRed.withValues(alpha: 0.1),
                                  primaryRed.withValues(alpha: 0.05),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.7, 1.0],
                              ),
                            ),
                            child: Image(
                              image: const AssetImage(bloodIcon),
                              height: SizeUtils.height(100),
                              width: SizeUtils.width(100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            SizeUtils.heightSizeBox(30),

            // Animated Title Text
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    Text(
                      "B L O O D  L I N K",
                      style: TextStyle(
                        fontSize: SizeUtils.fontSize(28),
                        fontWeight: FontWeight.bold,
                        color: primaryRed,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizeUtils.heightSizeBox(10),
                    Text(
                      "Connecting Lives Through Blood",
                      style: TextStyle(
                        fontSize: SizeUtils.fontSize(14),
                        color: grey,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizeUtils.heightSizeBox(50),

            // Animated Loading Indicator
            FadeTransition(
              opacity: _fadeAnimation,
              child: SizedBox(
                width: SizeUtils.width(40),
                height: SizeUtils.height(40),
                child: const CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation<Color>(primaryRed),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
