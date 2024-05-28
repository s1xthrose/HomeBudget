import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_appka/src/pages/alloperations.page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 29, 39, 1),
      appBar: AppBar(
        toolbarHeight: 178,
        backgroundColor: Color.fromRGBO(26, 29, 39, 1),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 24, right: 20, top: 68),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/home/led.png'),
                  ),
                  SizedBox(width: 8), // добавим отступ между изображением и текстом
                  Text(
                    "Домашний Бюджет",
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Текущий баланс',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 6),
              Text(
                '100 500 руб.',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Color.fromRGBO(82, 140, 255, 1),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Последние операции',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AllOperationsPage()));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Все",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(82, 140, 255, 1),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Color.fromRGBO(26, 29, 39, 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Color.fromRGBO(82, 140, 255, 1),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      // Действие для кнопки "Домой"
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_balance_wallet, color: Colors.white),
                    onPressed: () {
                      // Действие для кнопки "Кошелек"
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add_chart, color: Colors.white),
                    onPressed: () {
                      // Действие для кнопки "Отчеты"
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      // Действие для кнопки "Настройки"
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
