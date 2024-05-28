import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tst_appka/src/pages/addoperatioms.page.dart';

class AllOperationsPage extends StatefulWidget {
  @override
  _AllOperationsPageState createState() => _AllOperationsPageState();
}

class _AllOperationsPageState extends State<AllOperationsPage> {
  int _selectedIndex = 0;
  DateTime? _startDate;
  DateTime? _endDate;
  String _selectedCategory = 'Категория';

  List<String> _categories = ['Категория', 'Категория 1', 'Категория 2', 'Категория 3'];

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
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
                "Все операции",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () => _selectDateRange(context),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(188, 28), // Устанавливаем высоту
                        side: BorderSide(color: Color.fromRGBO(82, 140, 255, 1), width: 0.5),
                        backgroundColor: Color.fromRGBO(1, 70, 109, 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6), // Прямоугольная форма
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _startDate == null || _endDate == null
                                ? 'Период'
                                : '${_startDate.toString()} - ${_endDate.toString()}',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 36), // Отступ слева
                            child: Icon(Icons.calendar_today, color: Colors.white, size: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(82, 140, 255, 1), width: 0.5),
                            color: Color.fromRGBO(1, 70, 109, 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: 154,
                            height: 28,
                            child: DropdownButton<String>(
                              dropdownColor: Color.fromRGBO(26, 29, 39, 1),
                              value: _selectedCategory,
                              icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 24),
                              iconSize: 24,
                              underline: Container(
                                height: 0,
                                color: Colors.transparent,
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCategory = newValue!;
                                });
                              },
                              items: _categories.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Color.fromRGBO(82, 140, 255, 1),
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
        child: AddOpetationButton(),
      ),
    );
  }
}
class AddOpetationButton extends StatelessWidget {
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
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("onboarding", true);

          if (!context.mounted) return;
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddOperationsPage()));
        },
        child: Text(
          "Добавить операцию",
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