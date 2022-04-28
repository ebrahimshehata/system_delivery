import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../helpers/global_variables.dart';
import '../../../helpers/push_notifications_service.dart';
import '../../../helpers/widgets/availability_button.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? googleMapController;
  Position? currentPosition;
  User? user;
  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    googleMapController!.animateCamera(CameraUpdate.newLatLng(pos));
  }

  void getCurrentUserInfo() async {
    user = FirebaseAuth.instance.currentUser;
    PushNotificationsService pushNotificationsService =
        PushNotificationsService();
    pushNotificationsService.initialize();
    pushNotificationsService.getToken();
  }

  @override
  void initState() {
    // TODO: implement initState

    getCurrentUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 135),
          child: GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              googleMapController = controller;
              getCurrentLocation();
            },
          ),
        ),
        Container(
          height: 135,
          width: double.infinity,
          color: Colors.green,
        ),
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvailabilityButton(
                  title: "GO Online",
                  onPressed: () {},
                  color: Colors.orange),
            ],
          ),
        ),
      ],
    );
  }
}
