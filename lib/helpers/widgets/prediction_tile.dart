import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cubit/dataprovider/app_data.dart';
import '../../model/address.dart';
import '../../model/prediction.dart';
import '../global_variable.dart';
import '../requesthelper.dart';


class PredictionTile extends StatefulWidget {
  final Prediction prediction;
  const PredictionTile({Key? key, required this.prediction}) : super(key: key);

  @override
  _PredictionTileState createState() => _PredictionTileState();
}

class _PredictionTileState extends State<PredictionTile> {
  void getPlaceDetails(String placeId) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json ?place_id=$placeId &key=$mapKey";
    var response = await RequestHelper.getRequest(url: url);
    if (response == "failed") {
      return;
    }
    if (response['status'] == "OK") {
      Address address = Address();
      address.placeName = response["result"]["name"];
      address.placeID = placeId;
      address.latitude = response["result"]["geometry"]["location"]["lat"];
      address.longitude = response["result"]["geometry"]["location"]["lng"];
      Provider.of<AppData>(context, listen: false)
          .updateDestinationAddress(address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //get place details
        getPlaceDetails(widget.prediction.placeId!);
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.prediction.mainText!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.prediction.secondaryText!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,color: Colors.red,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
