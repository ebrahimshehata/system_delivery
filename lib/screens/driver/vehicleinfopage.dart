import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../../helpers/global_variables.dart';
import '../../helpers/widgets/TaxiOutlineButton.dart';
import 'home_driver.dart';

class VehicleInfoPage extends StatefulWidget {
  const VehicleInfoPage({Key? key}) : super(key: key);

  @override
  State<VehicleInfoPage> createState() => _VehicleInfoPageState();
}

class _VehicleInfoPageState extends State<VehicleInfoPage> {
  final carModelController = TextEditingController();
  final carColorController = TextEditingController();
  final carNumberController = TextEditingController();
  updateProfile() async {
    String uId = currentUser!.uid;
    Map<String, dynamic> map = {
      "car_color": carColorController.text,
      "car_model": carModelController.text,
      "car_number": carNumberController.text,
    };
    await FirebaseFirestore.instance
        .collection("drivers")
        .doc(uId)
        .collection("vehicle_details")
        .doc()
        .set(map);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>DriverHome()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Register data',
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
             child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                  height: 120,
                  width: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Enter Vehicle Details"),
                    TextFormField(
                      validator: (value) {if (value!.isEmpty) {return 'this data must not be empty';}return null;},
                      controller: carModelController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        label: const Text(
                          'Car Model',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (value) {if (value!.isEmpty) {return 'this data must not be empty';}return null;},
                      controller: carColorController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        label: const Text(
                          'Car Color',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (value) {if (value!.isEmpty) {return 'this data must not be empty';}return null;},
                      controller: carNumberController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        label: const Text(
                          'Car Number',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TaxiOutlineButton(
                        title: "Proceed",
                        onPressed: () {
                          updateProfile();
                        },
                        color: Colors.green),
                  ],
                ),
              ),
            ],
        ),
      ),
          ),
    ));
  }
}
