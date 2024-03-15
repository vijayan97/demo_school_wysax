import 'package:demo_school_wysax/constants/style_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import '../custom_widgets/custom_card.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> with SingleTickerProviderStateMixin{
  List<String> items = List.generate(20, (index) => 'Item $index');
  List<String> menusName = ['Users', 'Student Behaviour', 'PTA Meeting',
    'Online Classroom' ,'Nursing', 'Library', 'Canteen Details' ,
    'Transportation Details', 'Room Reservation', 'School Inventory', 'Subscription'];

  var media;

  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _topAlignmentAnimation = TweenSequence<Alignment>(
        [
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight),
              weight: 1
          ),
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.topRight,end: Alignment.bottomRight),
              weight: 1
          ),
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft),
              weight: 1
          ),
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.topLeft),
              weight: 1
          ),

        ]
    ).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>(
        [
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft),
              weight: 1
          ),
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.topLeft),
              weight: 1
          ),
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight),
              weight: 1
          ),
          TweenSequenceItem(
              tween: Tween<Alignment>(begin: Alignment.topRight,end: Alignment.bottomRight),
              weight: 1
          ),

        ]
    ).animate(_controller);

    _controller.repeat();

  }

  void _showPopup(tittle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tittle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _popupItem('Item 1'),
              _popupItem('Item 2'),
              _popupItem('Item 3'),
            ],
          ),
        );
      },
    );
  }

  // Widget for popup items
  Widget _popupItem(String text) {
    return ListTile(
      title: Text(text),
      onTap: () {
        // Handle item tap
        Navigator.pop(context);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    double height = media.height * 0.05 + 100;
    return Stack(
      children: [

        Container(
          margin: EdgeInsets.only(bottom: height),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GridView.builder(
              itemCount: menusName.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).unselectedWidgetColor, width: 0.2)
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          maxLines: 2,
                          menusName[index],
                          style: MyTextStyle.simpleTextStyleFontSize16Bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Positioned(
                        bottom: 0,
                        child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context,_) {
                            return Arc(
                              height: 50,
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width:200,
                                decoration: BoxDecoration(
                                    /*gradient: LinearGradient(
                                      begin: _topAlignmentAnimation.value,
                                      end: _bottomAlignmentAnimation.value,
                                      colors: [
                                        Colors.blue.shade100,
                                        Colors.green.shade100,
                                      ],
                                    ),*/

                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(100))
                                ),
                              ),
                            );
                          }
                        ),
                      ),Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(100))
                          ),
                          height: 100,
                          width: media.width * 0.7,
                          child: Transform.rotate(
                              
                              angle: -math.pi / 6,
                              child: Image.asset("assets/png_images/menus_icon/fees_management_new.png")),
                        ),
                      ),

                      const SizedBox(height: 10,),


                    ],
                  ),
                );
              },
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 60),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1.0),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard("Setting",onTap: (){_showPopup("Setting");},),
                CustomCard("Help",onTap: (){_showPopup("Help");}),
                CustomCard("Emergency",onTap: (){_showPopup("Emergency");}),
                CustomCard("Contact",onTap: (){_showPopup("Contact");}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height);

    path.lineTo(0, size.height * 0.2);
//    path.lineTo(size.width, size.height);
//    path.lineTo(size.width, size.height * 0.5);

    path.quadraticBezierTo(size.width * 0.5, 5, size.width * 0.9, size.height );

    //path.lineTo(size.width , size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({super.key, this.diameter = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}


// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.arcToPoint(
      Offset(size.width / 2, size.height),
      radius: Radius.circular(size.width / 2),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800]!;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.9 , size.height * 0.2,
        size.width * 0.9, size.height * 0.5);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class ClipPainter extends CustomPainter {
  final CustomClipper<Path> clipper;

  ClipPainter(this.clipper);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blue[800]!;
    paint.style = PaintingStyle.fill;
    canvas.drawPath(clipper.getClip(size), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ArcClipper extends CustomClipper<Path> {
  ArcClipper(this.height);

  ///The height of the arc
  final double height;

  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0.0, height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.2, size.width, size.height - height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    ArcClipper oldie = oldClipper as ArcClipper;
    return height != oldie.height;
  }
}

class Arc extends StatelessWidget {
  const Arc({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  /// The widget which one of [edge]s is going to be clippddddded as arc
  final Widget child;

  ///The height of the arc
  final double height;

  @override
  Widget build(BuildContext context) {
    var clipper = ArcClipper(height);
    return CustomPaint(
      painter: ClipPainter(clipper),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}