import 'package:empowergo/theme/appColor.dart';
import 'package:empowergo/view/Login/introScreen.dart';
import 'package:empowergo/widgets/customWidgets/customButtom.dart';
import 'package:empowergo/widgets/customWidgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Empower Your Independence",
      "content":
          "Discover tools and resources tailored to make daily life simpler and more accessible for everyone."
    },
    {
      "title": "Navigate With Confidence",
      "content":
          "Get directions, accessible routes, and facilities designed to cater to your unique needs."
    },
    {
      "title": "Community and Support",
      "content":
          "Connect with a vibrant community, access support networks, and share your journey with others."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildScreen(
                  title: onboardingData[index]["title"]!,
                  content: onboardingData[index]["content"]!,
                  index: index);
            },
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => _buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreen(
      {required String title, required String content, int? index}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientColors,
          begin: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(320),
                CustomText(
                  text: title,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                const Gap(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomText(
                    text: content,
                    fontSize: 14,
                    align: TextAlign.center,
                  ),
                ),
                Gap(100),
                index == 2
                    ? CustomButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Introscreen()));
                        })
                    : Container(),
              ],
            ),
            Positioned(
              right: 0,
              left: 0,
              top: 60,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 88, 86, 200).withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                        color:
                            Color.fromARGB(255, 96, 96, 219).withOpacity(0.6),
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer)
                  ],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 120,
              right: 0,
              left: 0,
              child: Lottie.network(
                  'https://lottie.host/e1b974fd-9cb4-425f-b4db-99cede6f48e3/uU1eOYPZML.json',
                  width: 180,
                  height: 180),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 12 : 8,
      height: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
