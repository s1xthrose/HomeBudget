import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddOperationsPage extends StatefulWidget {
  @override
  _AddOperationsPage createState() => _AddOperationsPage();
}

class _AddOperationsPage extends State<AddOperationsPage> {
  int _selectedIndex = 0;
  DateTime? _selectedDate;
  String _selectedCategory = 'Категория';
  int _selectedDateIndex = 0; // Переменная для индекса выбранной даты

  List<String> _categories = ['Категория', 'Категория 1', 'Категория 2', 'Категория 3'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _selectedDateIndex = -1; // Сброс индекса, если выбрана дата вручную
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 29, 39, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(82, 140, 255, 1),
                width: 1.0,
              ),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: Color.fromRGBO(26, 29, 39, 1),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Добавление операции",
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(left: 24),
              child: SizedBox(
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/operations/arrow_back.svg',
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 12),
              ToggleButtons(
                constraints: BoxConstraints.expand(width: 120, height: 28),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                selectedColor: Colors.white,
                borderWidth: 0,
                selectedBorderColor: Color.fromRGBO(1, 70, 109, 0.2),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Все',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Доходы',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Расходы',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                isSelected: List.generate(3, (index) => index == _selectedIndex),
              ),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Название',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]*')), // разрешаем только символы кириллицы без пробелов и других символов
                      ],
                      onTap: () {},
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Паддинг 24 пикселя слева и справа
                        filled: true,
                        fillColor: Color.fromRGBO(1, 70, 109, 0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        hintText: 'Краткое название',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(163, 165, 171, 1),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      cursorHeight: 24,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Дата',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        ToggleButtons(
                          constraints: BoxConstraints.expand(width: 150, height: 28),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          selectedColor: Colors.white,
                          borderWidth: 0,
                          selectedBorderColor: Color.fromRGBO(1, 70, 109, 0.2),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Сегодня',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Вчера',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              _selectedDateIndex = index;
                              _selectedDate = index == 0 ? DateTime.now() : DateTime.now().subtract(Duration(days: 1));
                            });
                          },
                          isSelected: List.generate(2, (index) => index == _selectedDateIndex),
                        ),
                        SizedBox(width: 16),
                        IconButton(
                          icon: Icon(Icons.calendar_today, color: Colors.white),
                          onPressed: () => _selectDate(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Категория',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      dropdownColor: Color.fromRGBO(1, 70, 109, 0.9),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        filled: true,
                        fillColor: Color.fromRGBO(1, 70, 109, 0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                      ),
                      items: _categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(163, 165, 171, 1),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCategory = newValue!;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Сумма',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')), // разрешаем только символы кириллицы без пробелов и других символов
                      ],
                      onTap: () {},
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Паддинг 24 пикселя слева и справа
                        filled: true,
                        fillColor: Color.fromRGBO(1, 70, 109, 0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color.fromRGBO(82, 140, 255, 1),
                          ),
                        ),
                        hintText: 'Сумма',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(163, 165, 171, 1),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      cursorHeight: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Color.fromRGBO(26, 29, 39, 1),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: ContinueButton(),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(82, 140, 255, 1),
      ),
      width: MediaQuery.of(context).size.width - 48,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(82, 140, 255, 1)),
        ),
        onPressed: () async {},
        child: Text(
          "Сохранить",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
