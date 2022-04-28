import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cubit/dataprovider/app_data.dart';
import '../../helpers/global_variable.dart';
import '../../helpers/requesthelper.dart';
import '../../helpers/widgets/brand_divider.dart';
import '../../helpers/widgets/prediction_tile.dart';
import '../../model/prediction.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final pickupController = TextEditingController();
  final destinationController = TextEditingController();
  final focusDestination = FocusNode();
  bool focused = false;
  void setFocused() {
    if (!focused) {
      FocusScope.of(context).requestFocus(focusDestination);
      focused = true;
    }
  }

  List<Prediction> destinationPredictionList = [];
  searchPlace(String placeName) async {
    if (placeName.length > 1) {
      String url =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json ?input=$placeName &key=$mapKey &components=country:eg";
      var response = await RequestHelper.getRequest(url: url);
      if (response == "failed") {
        print("api search response : $response");
        return;
      }
      if (response["status"] == "OK") {
        var predictionJson = response["predictions"];
        var thisList = (predictionJson as List)
            .map((e) => Prediction.fromJson(e))
            .toList();
        setState(() {
          destinationPredictionList = thisList;
        });

        print("api search response : $response");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String address = Provider.of<AppData>(context).pickUpAddress == null
        ? "Nasr city"
        : Provider.of<AppData>(context).pickUpAddress!.placeName!;
    pickupController.text = address;
    setFocused();
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7),
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, top: 30, right: 24, bottom: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      const Center(
                        child: Text(
                          "Set Destination ",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "images/pickicon.png",
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: TextField(
                          controller: pickupController,
                          decoration: const InputDecoration(
                              hintText: "Pickup Location",
                              fillColor: Colors.blueGrey,
                              filled: true,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(
                                left: 10,
                                top: 8,
                                bottom: 8,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "images/desticon.png",
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            onChanged: (val) {
                              searchPlace(val);
                            },
                            focusNode: focusDestination,
                            decoration: const InputDecoration(
                                hintText: "Where to ? ",
                                fillColor: Colors.blueGrey,
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  top: 8,
                                  bottom: 8,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          destinationPredictionList.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PredictionTile(
                            prediction: destinationPredictionList[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const BrandDivider();
                      },
                      itemCount: destinationPredictionList.length),
                )
              : const SizedBox()
        ],
      ),
    ));
  }
}
