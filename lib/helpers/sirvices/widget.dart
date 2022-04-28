import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Future showCustomDialog({text = ''}){
  return Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin:const EdgeInsets.symmetric(
                horizontal: 15
            ),
            width: double.infinity,
            height: 156,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('images/done_dialog.svg'),
                Material(
                  color: Colors.transparent,
                  child: Text('${text}',style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff707070)
                  ),),
                )
              ],
            ),
          ),
        ),
      )
  );
}

class GradientFloatingActionButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData icon;

  const GradientFloatingActionButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      elevation: 0,
      onPressed: onPressed,
      child: Container(
        width: 60,
        height: 60,
        child: Icon(
          icon,
          size: 20,
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff28A2CF), Color(0xff55E96A)])),
      ),
    );
  }
}

Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        title: Text(
          title,

        ),
        subtitle: Text(
          message,

        ),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
