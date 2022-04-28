import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LanguageScreen extends StatefulWidget {
  LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool _arabicLanguage = true;
  bool _englishLanguage = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_arabicLanguage?"اللغة":'Language'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 30),
          width: Get.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 9),
                    ),
                  ],
                ),
                child: SwitchListTile(
                  activeColor: Color(0xFF447A78),
                  inactiveThumbColor: Color(0xFF95989A),
                  inactiveTrackColor: Color(0xFFEEECEC),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      _arabicLanguage?"العربية":'Arabic',
                      style: TextStyle(
                        color: Color(0xFF447A78),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  value: _arabicLanguage,
                  onChanged: (bool value) {
                    setState(() {
                      _arabicLanguage = value;
                      _englishLanguage = !value;

                    });
                  },
                ),
              ),

              SizedBox(height: 30),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 9),
                    ),
                  ],
                ),
                child: SwitchListTile(
                  activeColor: Color(0xFF447A78),
                  inactiveThumbColor: Color(0xFF95989A),
                  inactiveTrackColor: Color(0xFFEEECEC),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      _arabicLanguage?"الانجليزية":'English',

                      style: TextStyle(
                        color: Color(0xFF447A78),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  value: _englishLanguage,
                  onChanged: (bool value) {
                    setState(() {
                      _englishLanguage = value;
                      _arabicLanguage =!value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
