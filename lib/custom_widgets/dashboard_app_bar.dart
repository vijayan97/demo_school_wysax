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

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
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
                _page == 3 ? ProfileScreen() :  Container(
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
            if(index == 2)
            {
              _scaffoldkey.currentState?.showBottomSheet((_) => Container(

                color: Colors.white,
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Text('this is a bottomsheet'),
              ));
              // showQuickAccessMenus();
            }
              else
              {
                setState(() {
                  _page = index;
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

  showBrandsBottomSheet() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5, top: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Align(
                    alignment: Alignment.topRight, child: Icon(Icons.close)),
              ),
            ),
            Container(
              color: Colors.white,
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
