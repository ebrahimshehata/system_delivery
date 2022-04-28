import 'package:flutter/cupertino.dart';

import '../../model/address.dart';


class AppData extends ChangeNotifier {
  Address? pickUpAddress;

  Address? destinationAddress;
  void updatePickUpAddress(Address pickUpAdd) {
    pickUpAddress = pickUpAdd;
    notifyListeners();
  }

  void updateDestinationAddress(Address destinationAdd) {
    destinationAddress = destinationAdd;
    notifyListeners();
  }
}
