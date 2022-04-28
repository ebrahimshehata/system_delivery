import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

User? currentUser;
final CameraPosition cameraPosition =
    CameraPosition(target: LatLng(37, 41), zoom: 14);
String mapKey = "AIzaSyA-K1PmHSZR9wEXeHdrj1CAPemy-i3BBmI";
