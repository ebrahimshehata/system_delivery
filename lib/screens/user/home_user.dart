import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:system_delivery/screens/user/profile_user.dart';
import '../../cubit/dataprovider/app_data.dart';
import '../../helpers/helpermethod.dart';
import '../../helpers/sirvices/utils.dart';
import '../../helpers/widgets/TaxiOutlineButton.dart';
import '../../helpers/widgets/brand_divider.dart';
import '../../model/direction_details.dart';
import '../admin/login_admin.dart';
import 'search_page.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  GlobalKey<ScaffoldState> formKey = GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  double mapButtonPadding = 0;
  // geoLocator
  var geoLocator = Geolocator();
  Position? currentPosition;
  // polyline between source to destination
  List<LatLng> polyLineCoordinates = [];
  Set<Polyline> polyLines = {};
  // markers
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  double rideDetailsSheetHeight = 0;
  double searchSheetHeight = 0;

  DirectionDetails? tripDetails;
  void setupPositionLocator() async {
    if (await Geolocator.checkPermission() != LocationPermission.always) {
      await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    print("currentPosition : $currentPosition");
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 14);
    mapController!.animateCamera(CameraUpdate.newCameraPosition(cp));
    String address = await HelperMethod.findCoordinateAddress(context,
        position: position);
    print("Position Address: $address");
  }

  showDetailsSheet() {
    setState(() {
      searchSheetHeight = 0;
      rideDetailsSheetHeight = 260;
      mapButtonPadding = 260;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login User',),
        backgroundColor: Colors.green,
      ),
        drawer: Drawer(
          child:  SingleChildScrollView(
              child: Column(children: [
                DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.green),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileUser()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 24+MediaQuery.of(context).padding.top,bottom: 24),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/user_icon.png",
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "name",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text("view profile")
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                BrandDivider(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    runSpacing: 16,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.card_giftcard_outlined),
                        title: const Text("Free Rides"),
                        onTap: (){/*Utils().navigateTo(context, LoginAdmin());*/},
                      ),
                       ListTile(
                        leading:Icon(Icons.credit_card),
                        title:Text("Payment"),
                         onTap: (){},
                      ),
                      ListTile(
                        leading:const Icon(Icons.history),
                        title:const Text("Ride History"),
                        onTap: (){},
                      ),
                      ListTile(
                        leading:const Icon(Icons.contact_support),
                        title:const Text("Support"),
                        onTap: (){},
                      ),
                      ListTile(
                        leading:const Icon(Icons.info),
                        title:const Text("About"),
                        onTap: (){},
                      ),
                    ],
                  ),
                )],
              ),
            ),
          ),

        body: Stack(
          children: [
            GoogleMap(
              padding: EdgeInsets.only(bottom: mapButtonPadding),
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              polylines: polyLines,
              markers: markers,
              circles: circles,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                mapController = controller;
                setState(() {
                  mapButtonPadding = 270;
                });
                setupPositionLocator();
              },
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: AnimatedSize(
                  duration: Duration(milliseconds: 150),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 260,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          "nice to see you ",
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Where are you going ?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                            // todo from response after navigation
                            showDetailsSheet();
                            await getDirection();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      spreadRadius: 0.5,
                                      offset: Offset(0.7, 0.7)),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.search,
                                    color: Colors.blueAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Search Destination ")
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.home,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  /*Provider.of<AppData>(context)
                                            .pickUpAddress!
                                            .placeName !=
                                        null
                                    ? Provider.of<AppData>(context)
                                        .pickUpAddress!
                                        .placeName!
                                    : */
                                    "Add Home"),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Your residential address",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const BrandDivider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.work,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 4,
                                ),
                                Text("Add Work"),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Your office address",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            //Ride Details sheet
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 150),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: rideDetailsSheetHeight,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7)),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 70,
                            width: 70,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Taxi"),
                              Text("${tripDetails?.distanceValue ?? "0.0"} KM"),
                            ],
                          ),
                          Expanded(child: Container()),
                          Text(
                            tripDetails != null
                                ? HelperMethod.estimateFares(tripDetails!)
                                .toString()
                                : "0.0",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.money,
                            size: 18,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("cash"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TaxiOutlineButton(
                          title: "Request Captain",
                          onPressed: () {
                            // todo create ride request on firestore & add option to cancel
                          },
                          color: Colors.green),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  Future<void> getDirection() async {
    var pickUp = Provider.of<AppData>(context, listen: false).pickUpAddress!;
    var destination =
        Provider.of<AppData>(context, listen: false).destinationAddress!;

    var pickLatLng = LatLng(pickUp.latitude!, pickUp.longitude!);
    var destinationLatLng =
        LatLng(destination.latitude!, destination.longitude!);
    DirectionDetails thisDetails =
        await HelperMethod.getDirectionDetails(pickLatLng, destinationLatLng);
    setState(() {
      tripDetails = thisDetails;
    });
    // polyline
    List<PointLatLng> results =
        PolylinePoints().decodePolyline(thisDetails.encodedPoints!);
    polyLineCoordinates.clear();
    if (results.isNotEmpty) {
      results.forEach((PointLatLng pointLatLng) {
        polyLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }
    polyLines.clear();
    setState(() {
      Polyline polyline = Polyline(
        polylineId: const PolylineId("polyId"),
        color: Colors.blue,
        points: polyLineCoordinates,
        jointType: JointType.round,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );
      polyLines.add(polyline);
    });
    // make polyline fit into map
    LatLngBounds bounds;
    if (pickLatLng.latitude > destinationLatLng.latitude &&
        pickLatLng.longitude > destinationLatLng.longitude) {
      bounds =
          LatLngBounds(southwest: destinationLatLng, northeast: pickLatLng);
    } else if (pickLatLng.longitude > destinationLatLng.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(pickLatLng.latitude, destinationLatLng.longitude),
          northeast: LatLng(destinationLatLng.latitude, pickLatLng.longitude));
    } else if (pickLatLng.latitude > destinationLatLng.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(pickLatLng.latitude, destinationLatLng.longitude),
          northeast: LatLng(destinationLatLng.latitude, pickLatLng.longitude));
    } else {
      bounds =
          LatLngBounds(southwest: pickLatLng, northeast: destinationLatLng);
    }
    mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 70));
    Marker pickUpMarker = Marker(
      markerId: MarkerId("markId1"),
      position: pickLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title: pickUp.placeName, snippet: "My Location"),
    );
    Marker destinationMarker = Marker(
      markerId: MarkerId("markId2"),
      position: destinationLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow:
          InfoWindow(title: destination.placeName, snippet: "Destination"),
    );
    setState(() {
      markers.add(pickUpMarker);
      markers.add(destinationMarker);
    });
    Circle circle1 = Circle(
      circleId: CircleId("pickUp"),
      strokeColor: Colors.green,
      strokeWidth: 3,
      radius: 12,
      center: pickLatLng,
      fillColor: Colors.green,
    );
    Circle circle2 = Circle(
      circleId: CircleId("destination"),
      strokeColor: Colors.purple,
      strokeWidth: 3,
      radius: 12,
      center: destinationLatLng,
      fillColor: Colors.purpleAccent,
    );
    setState(() {
      circles.add(circle1);
      circles.add(circle2);
    });
  }
}
