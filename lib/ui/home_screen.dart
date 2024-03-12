import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_school_wysax/utils/theme_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/style_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _searchController = TextEditingController();
  var media;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Map<String, dynamic>> noticeboardItems = [
    {"name": "Road Safety Seminar", "image": "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80", "description" : "Road Safety Seminar arranged on 30 March 2024"},
    {"name": "AI Seminar", "image": "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80", "description" : "Want to learn AI? Then join us!"},];


  List<Map<String, dynamic>> eventItems = [
    {"name": "Christmas Eve", "image": "assets/lottie_icons/xmas.json", "time" : "5 pm onwards","venue" : "School Ground", "color" : "#016837"},
    {"name": "Sports Day", "image": "assets/lottie_icons/sports.json","time" : "11 am - 5pm", "venue" : "Sports Complex", "color" : "#d6a102"},
    ];


  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20 , right: 20, top: 20),
      child: Column
        (
        children: [
          Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFF707070), width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
                controller: _searchController,
                style: MyTextStyle.simpleTextStyle,
                decoration: InputDecoration(
                 hintText: 'Search',
                 hintStyle: MyTextStyle.hintStyle,
                 suffixIcon: IconButton(
                   icon: const Icon(Icons.search), onPressed: () {  },

                 ),
                 /*prefixIcon: IconButton(
                   icon: Icon(Icons.clear,), onPressed: () {
                   _searchController.clear();
                 },
                 ),*/
                 border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                 ),
               ),
      ),
          const SizedBox(height: 30,),
          Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               width: 5,
               height: 50,
               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                 borderRadius: BorderRadius.circular(10)
               ),
             ),
             const SizedBox(
               width: 10,
             ),
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("School Admin",
                     style: MyTextStyle.simpleTextStyle,
                   ),
                   Text(
                     "School Admin",
                     style: MyTextStyle.simpleTextStyleFontSize11
                   ),
                 ],
               ),
             ),
             CircleAvatar(
               backgroundColor: Theme.of(context).primaryColor,
               radius: 25,
               child: Image.asset("assets/png_images/user.png", color: Colors.white,), // Adjust the radius as needed
             )
           ],
         ),
          const SizedBox(height: 20,),
          Column(children: [
            SizedBox(
              width: double.infinity,

              child: CarouselSlider.builder(
                itemCount: noticeboardItems.length,
                options: CarouselOptions(
                  height: (MediaQuery.of(context).size.height) * 0.25,
                  viewportFraction: media.width > 500 ? 0.6: 0.9,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 16/9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                itemBuilder: (context, i, d) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 10.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 0.5 ),
                              image: DecorationImage(image: NetworkImage(noticeboardItems[i]['image'],), fit: BoxFit.cover,)
                          ),
                          child: BackdropFilter(filter: new ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
                            child: Container(
                              decoration: new BoxDecoration(color: Colors.transparent),
                            ),

                          ),
                        ),
                        Container(
                          width:media.width,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                noticeboardItems[i]['name'],
                                style: MyTextStyle.simpleTextStyleFontSize16Bold,
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                noticeboardItems[i]['description'],
                                style: MyTextStyle.simpleTextStyleNormal,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: _current,
              count: noticeboardItems.length,
              effect: WormEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Color(0xff707070),
                dotHeight: media.width > 600 ? 10.0 : 10.0,
                dotWidth: media.width > 600 ? 10.0 : 10.0,
              ),
            )
          ]),
          const SizedBox(height: 30,),
          Container(child: Row
            (
            children: [
              Text("EVENTS FOR YOU"),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 1,
                  width: media.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [
                              Colors.grey,
                              Colors.white,
                        ],
                      )
                  ),
                ),
              )
            ],
          ),),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                primary: true,
                itemCount: eventItems.length,
                itemBuilder: (BuildContext context, int index)
            {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          eventItems[index]['color'].toString().toColor().withOpacity(0.2),
                          Colors.white,
                        ],
                      )
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Lottie.asset(
                      eventItems[index]['image'],
                    repeat: true,
                    animate: true,
                      width: 70,
                      height: 70
                    ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(eventItems[index]['name'],
                            style: TextStyle(
                                color: eventItems[index]['color'].toString().toColor(),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          /*AnimatedTextKit(
                            pause: const Duration(milliseconds: 0000),
                            repeatForever: true,
                            animatedTexts: [

                              ColorizeAnimatedText(
                                  eventItems[index]['name'],
                                  textStyle: TextStyle(
                                      color: eventItems[index]['color'].toString().toColor(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ), colors: [
                                Colors.purple,
                                Colors.blue,
                                Colors.yellow,
                                Colors.red,
                              ]
                              ),
                            ],
                          ),*/
                          const SizedBox(height: 5,),
                          AnimatedTextKit(
                            pause: const Duration(milliseconds: 0000),
                            repeatForever: true,
                            animatedTexts: [

                              ScaleAnimatedText(
                                eventItems[index]['time'],
                                textStyle: TextStyle(
                                    color: eventItems[index]['color'].toString().toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal
                                )
                              ),
                              ScaleAnimatedText(
                                eventItems[index]['venue'],
                                textStyle:TextStyle(
                                    color: eventItems[index]['color'].toString().toColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                        ],
                      )
                    ],
                  )
                  ),
              );
            })
          ),


        ],
      ),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}


class ItemModel {
  final String title;
  final String description;
  final String lottieAsset;

  ItemModel({
    required this.title,
    required this.description,
    required this.lottieAsset,
  });
}
