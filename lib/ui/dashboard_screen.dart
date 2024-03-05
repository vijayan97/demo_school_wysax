import 'package:demo_school_wysax/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/dashboard_app_bar.dart';

class DashboardSCreen extends StatefulWidget {
  const DashboardSCreen({Key? key}) : super(key: key);

  @override
  State<DashboardSCreen> createState() => _DashboardSCreenState();
}

class _DashboardSCreenState extends State<DashboardSCreen> {
  @override
  Widget build(BuildContext context) {
    return DashboardAppBar(
      childWidget: Container(),
    );
  }
}
