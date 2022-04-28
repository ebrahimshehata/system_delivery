import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/state.dart';

class AdminHome extends StatefulWidget {
const AdminHome({Key?key}) : super(key: key);
@override
AdminHomeState createState() => AdminHomeState();
}

class AdminHomeState extends State<AdminHome> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
