import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_school_wysax/ui/home_screen.dart';
import 'package:demo_school_wysax/ui/menus_search_screen.dart';
import 'package:demo_school_wysax/ui/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constants.dart';

class DashboardAppBar extends StatefulWidget {
  final Widget childWidget;
  const DashboardAppBar({Key? key, required this.childWidget}) : super(key: key);

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  int _page = 0;
  int currentIndex = 0;
  bool showBottomSheett = false;

  List<Map<String, dynamic>> items = [
    {"name": "Item 1", "image": "assets/png_images/calendar.png"},
    {"name": "Item 2", "image": "assets/png_images/chat.png"},
    {"name": "Item 3", "image": "assets/png_images/email.png"},
    {"name": "Item 4", "image": "assets/png_images/setting.png"},
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldkey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(Constants.appName, style: TextStyle(
              color: Theme.of(context).primaryColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold
          ),),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent ,
          actions: [
            InkWell(
              onTap: ()
              {

              },
              child: Icon(Icons.school,  size: 24,),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: ()
              {

              },
              child: Icon(Icons.language,  size: 24,),
            ),SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: ()
              {

              },
              child: Icon(Icons.notifications,  size: 24,),
            ),SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: ()
              {

              },
              child: Icon(Icons.logout, size: 24,),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),

        body: Stack(
          children: [
            _page == 0 ? HomeScreen() : _page == 1 ? MenusSearchScreen() :
                _page == 3 ? ProfileScreen() :  HomeScreen()
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 60,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: Colors.transparent,
          color: Theme.of(context).primaryColor,
          items: <Widget>[
            Icon(Icons.home, color: Colors.white,),
            Icon(Icons.search,color: Colors.white,),
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
                            print(currentIndex);

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
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child:  Text("Quick Access",
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
              ));
              // showQuickAccessMenus();
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
                      Navigator.pop(context);
                      showBottomSheett = !showBottomSheett;
                    }

                });
              }
          },
        ),
    );
  }

   showQuickAccessMenus() {
    showModalBottomSheet<void>(
      useRootNavigator: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
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
                    height: 10,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem({required this.index});

  @override
  Widget build(BuildContext context) {

    // Sample data for demonstration
    List<Map<String, dynamic>> items = [
      {"name": "Timetable", "image": "assets/png_images/schedule.png", "description" : "Schedule Planner"},
      {"name": "Calendar", "image": "assets/png_images/calendar.png", "description" : "Event Tracker"},
      {"name": "Chat", "image": "assets/png_images/chat.png", "description" : "Instant Messaging"},
      {"name": "Email", "image": "assets/png_images/email.png", "description" : "Digital Correspondence"},
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
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF343434)
                      ),
                    ), Text(
                      items[index]['description'],
                      maxLines: 3,
                      overflow: TextOverflow.visible,// Name from the sample data
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF707070),
                          overflow: TextOverflow.visible,
                      ),
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
