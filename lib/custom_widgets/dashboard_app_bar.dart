
import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_school_wysax/constants/style_constants.dart';
import 'package:demo_school_wysax/ui/home_screen.dart';
import 'package:demo_school_wysax/ui/chat.dart';
import 'package:demo_school_wysax/ui/notification_screen.dart';
import 'package:demo_school_wysax/ui/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constants.dart';

class DashboardAppBar extends StatefulWidget {
  final Widget childWidget;
  const DashboardAppBar({Key? key, required this.childWidget}) : super(key: key);

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> with SingleTickerProviderStateMixin{

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  late PersistentBottomSheetController controller;
  late AnimationController animationController;
  int _page = 0;
  int currentIndex = 0;
  bool showBottomSheett = false;
  int badgeCount =1 ;
  var media;

  List<Map<String, dynamic>> items = [
    {"name": "Item 1", "image": "assets/png_images/calendar.png"},
    {"name": "Item 2", "image": "assets/png_images/chat.png"},
    {"name": "Item 3", "image": "assets/png_images/email.png"},
    {"name": "Item 4", "image": "assets/png_images/setting.png"},
  ];

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
     media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Colors.blue.shade50,
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset('assets/app_logo/wysax_logo.png', width: 150,height: 50,),
        ),
        actions: [
          Visibility(
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
                child: Padding(
                  padding:  const EdgeInsets.only( right: 10.0, left: 10, top: 5, bottom: 5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Container(
                          child: Icon(Icons.notifications, size: 30,),
                        ),
                      ),
                      badgeCount > 0
                          ? Positioned(
                        right: 4,
                        top: 1,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: Text(
                            '$badgeCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                          : const SizedBox(width: 0,)
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
        body: Container(
          height: media.height,
          width: media.width,
          decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue.shade50,
                        Colors.white,
                      ],
                    )
                ),
          child: Stack(
            children: [
              _page == 0 ? const HomeScreen() : _page == 1 ? const ChatScreen() :
                  _page == 3 ? const ProfileScreen() :  const HomeScreen()
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 60,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: Colors.transparent,
          color: Theme.of(context).primaryColor,
          items: const <Widget>[
            Icon(Icons.dashboard, color: Colors.white,),
            Icon(Icons.chat,color: Colors.white,),
            Icon(Icons.layers,color: Colors.white,),
            Icon(Icons.person,color: Colors.white,),
            Icon(Icons.menu,color: Colors.white,),

          ],
          onTap: (index) {
            if(index == 2)
            {
              setState(() {
                print("$_page");
                currentIndex = _page;
                _page = currentIndex;
                print("$_page");
              });
              showBottomSheett = true;
              controller =
                  _scaffoldkey.currentState!.showBottomSheet((BuildContext context) {

                    return BottomSheet(
                      enableDrag: true,
                      animationController: animationController,
                      onClosing: () {

                        if (kDebugMode) {
                          print('on closing');
                        }
                        final CurvedNavigationBarState? navBarState =
                            _bottomNavigationKey.currentState;
                        navBarState?.setPage(currentIndex);
                      },
                      builder: (BuildContext context) {
                        return Container(
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

                            //height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: ()
                                    {
                                      setState(() {
                                        if (kDebugMode) {
                                          print(currentIndex);
                                        }

                                        final CurvedNavigationBarState? navBarState =
                                            _bottomNavigationKey.currentState;
                                        navBarState?.setPage(currentIndex);

                                        index = currentIndex;
                                        _page = index;
                                        print(_page);

                                      });
                                      showBottomSheett = false;
                                      //Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 6,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 15),
                                    child:  const Text("Quick Access",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xFF343434)
                                      ),),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GridItem(index: 0,),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GridItem(index: 1,),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GridItem(index: 2,),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GridItem(index: 3,),
                                    ],
                                  )
                                ],
                              ),
                            )
                        );
                      },
                    );

                  }, enableDrag: true,);
            }
            else if(index == 4)
            {
              _page = index;
              showBottomSheett = true;
              _scaffoldkey.currentState?.showBottomSheet((_) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Text('this is a bottomsheet for 4'),
                ));
              }
              else
              {
                setState(() {
                  currentIndex = index;
                  _page = index;
                  _page = currentIndex;

                  if(showBottomSheett)
                    {
                      _closeModalBottomSheet();
                     /* Navigator.pop(context);
                      showBottomSheett = !showBottomSheett;*/
                    }

                });
              }
          },
        ),
    );
  }

  void _closeModalBottomSheet() {
    if (controller != null) {
      controller.close();
      print("current index in if close $currentIndex");
    }
    /*else
      {
        controller.closed.whenComplete(() => {
          print("close")
        });
        final CurvedNavigationBarState? navBarState =
            _bottomNavigationKey.currentState;
        navBarState?.setPage(currentIndex);
        print("current index in else close $currentIndex");
      }*/
  }

}

class GridItem extends StatelessWidget {
  final int index;

  GridItem({required this.index});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> items = [
      {"name": "Timetable", "image": "assets/png_images/schedule.png", "description" : "Schedule Planner"},
      {"name": "Calendar", "image": "assets/png_images/calendar.png", "description" : "Event Tracker"},
      {"name": "Attendance", "image": "assets/png_images/checking_attendance.png", "description" : "Presence Tracking"},
      {"name": "Exam", "image": "assets/png_images/exam.png", "description" : "Assessment Event"},
    ];

    return Expanded(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Image.asset( items[index]['image'], color: Colors.white,),
                radius: 25, // Adjust the radius as needed
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index]['name'], // Name from the sample data
                      style: MyTextStyle.simpleTextStyle,
                    ),
                    Text(
                      items[index]['description'],
                      maxLines: 3,
                      overflow: TextOverflow.visible,// Name from the sample data
                      style: MyTextStyle.simpleTextStyleFontSize11,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
