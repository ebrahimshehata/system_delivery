import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../helpers/global_variables.dart';
import '../../helpers/widgets/TaxiOutlineButton.dart';
class NewTripPage extends StatefulWidget {
  const NewTripPage({Key? key}) : super(key: key);

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.normal,
            trafficEnabled: true,
            mapToolbarEnabled: true,
            compassEnabled: true,
            initialCameraPosition: cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              googleMapController = controller;
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 180,
              color: Colors.white,
              child: Column(
                children: [
                  TaxiOutlineButton(
                      title: "Arrived", onPressed: () {}, color: Colors.green),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
