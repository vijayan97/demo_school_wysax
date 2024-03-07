import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/dashboard_app_bar.dart';

class DashboardSCreen extends StatefulWidget {
  const DashboardSCreen({Key? key}) : super(key: key);

  @override
  State<DashboardSCreen> createState() => _DashboardSCreenState();
}

class _DashboardSCreenState extends State<DashboardSCreen> {
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return DashboardAppBar(childWidget: Container(),);
    
  }
  void _onItemTapped(int index) {
    setState(() {

      if(index == 1)
        {
          _scaffoldkey.currentState?.showBottomSheet((_) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0.1, // spread radius
                    blurRadius: 1000,
                    offset: Offset(0, -30), // changes position of shadow
                  ),
                ],
              ),

              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 8,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ));
        }
      else
        {
          _selectedIndex = index;
        }
    });
  }


}
