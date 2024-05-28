import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Инициализация ScreenUtil
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 29, 39, 1),
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingSlide(
            imagePath: 'assets/onboarding/money_image.png',
            title: 'Домашний Бюджет',
            description:
            'Ваш актуальный бюджет в одном месте, ведите учет доходов и расходов, а также анализируйте их за любой период',
            skipButtonLabel: 'Пропустить',
            nextButtonLabel: 'Далее',
            onNext: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            isFinalSlide: false,
          ),
          OnboardingSlide(
            imagePath: 'assets/onboarding/notification_image.png',
            title: 'Напоминания',
            description:
            'Напоминания о ваших обязательных платежах и лимиты расходов. Здесь вы найдете полезные советы по ведению домашнего бюджета.',
            skipButtonLabel: '',
            nextButtonLabel: 'Начать',
            onNext: () {
              // Реализация перехода на страницу HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            isFinalSlide: true,
          ),
        ],
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String skipButtonLabel;
  final String nextButtonLabel;
  final VoidCallback onNext;
  final bool isFinalSlide;

  OnboardingSlide({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.skipButtonLabel,
    required this.nextButtonLabel,
    required this.onNext,
    required this.isFinalSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                height: 375.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(1, 70, 109, 0.2),
                    border: Border.all(
                      color: Color.fromRGBO(82, 140, 255, 1),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(247, 248, 250, 1),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        description,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(202, 207, 217, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (!isFinalSlide)
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(247, 248, 250, 1),
                            side: BorderSide(
                                color: Color.fromRGBO(29, 94, 221, 1)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            skipButtonLabel,
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(29, 94, 221, 1),
                            ),
                          ),
                        ),
                      ),
                    if (!isFinalSlide) SizedBox(width: 16),
                    SizedBox(
                      width: isFinalSlide
                          ? MediaQuery.of(context).size.width * 0.86
                          : MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(82, 140, 255, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: onNext,
                        child: Text(
                          nextButtonLabel,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(247, 248, 250, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse("https://api.flutter.dev/index.html"));
                      },
                      child: Text(
                        "Условия использования",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(163, 165, 171, 1),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 12,
                      color: Color.fromRGBO(82, 140, 255, 1),
                    ),
                    TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse("https://api.flutter.dev/index.html"));
                      },
                      child: Text(
                        "Политика конфиденциальности",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(163, 165, 171, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
