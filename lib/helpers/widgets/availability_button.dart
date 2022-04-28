import 'package:flutter/material.dart';

class AvailabilityButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color color;

  AvailabilityButton(
      {required this.title, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(24))),
          alignment: Alignment.center,
          height: 38,
          width: 200,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
