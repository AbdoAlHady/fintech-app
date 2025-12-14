import 'package:fintech_app/core/helpers/extensions.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:fintech_app/features/onboarding/presentation/widgets/onboarding_last_page_buttons.dart';
import 'package:fintech_app/features/onboarding/presentation/widgets/onboarding_navigation.dart';
import 'package:fintech_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: AppAssets.imagesOnboarding1,
      title: 'Welcome To Crypto X',
    ),
    OnboardingModel(
      image: AppAssets.imagesOnboarding2,
      title: 'Transaction Security',
    ),
    OnboardingModel(
      image: AppAssets.imagesOnboarding3,
      title: 'Fast And Reliable Market Updated',
    ),
    OnboardingModel(
      image: AppAssets.imagesOnboarding4,
      title: 'Get Started Now!',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skip() {
    _pageController.jumpToPage(_pages.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar (Skip Button)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_currentIndex < _pages.length - 1)
                    TextButton(
                      onPressed: _skip,
                      child: Text(
                        'Skip',
                        style: AppTextStyles.medium24.copyWith(
                          color: context.customColors.primaryColor,
                        ),
                      ),
                    )
                  else
                    // Placeholder strict height to match Skip button row
                    SizedBox(height: 48.h),
                ],
              ),
            ),

            // Page Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(page: _pages[index], index: index);
                },
              ),
            ),

            // Bottom Navigation
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: _currentIndex == _pages.length - 1
                  ? const OnboardingLastPageButtons()
                  : OnboardingNavigation(
                      currentIndex: _currentIndex,
                      totalPages: _pages.length,
                      onNextTap: _nextPage,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
