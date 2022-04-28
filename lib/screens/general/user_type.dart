import 'package:flutter/material.dart';
import '../../helpers/sirvices/utils.dart';
import '../admin/login_admin.dart';
import '../driver/login_driver.dart';
import '../user/login.dart';

class UserType extends StatelessWidget {

  UserType({Key? key}) : super(key: key);

  int userType = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 29,
              ),
              ElevatedButton(
                onPressed: () {
                  userType=1;
                  Utils().navigateTo(context, LoginAdmin());
                },
                child: const Text(
                  "Admin",
                  style: TextStyle(fontSize: 24),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  userType=2;

                  Utils().navigateTo(context, LoginDriver());
                },
                child: const Text(
                  " Driver ",
                  style: TextStyle(fontSize: 24),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 98, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  userType=3;
                  Utils().navigateTo(context, LoginScreen());

                },
                child: const Text(
                  " User ",
                  style: TextStyle(fontSize: 24),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 102, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
