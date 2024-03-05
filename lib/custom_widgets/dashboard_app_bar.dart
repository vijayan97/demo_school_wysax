import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_school_wysax/ui/home_screen.dart';
import 'package:demo_school_wysax/ui/menus_search_screen.dart';
import 'package:demo_school_wysax/ui/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DashboardAppBar extends StatefulWidget {
  final Widget childWidget;
  const DashboardAppBar({Key? key, required this.childWidget}) : super(key: key);

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                _page == 3 ? ProfileScreen() : Container(
                  child: Text("$_page"),
                )
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

            setState(() {
              if(index == 2)
                {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text('Layer'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              else
                {
                  _page = index;
                }
            });

          },
        ),
    );
  }
}
