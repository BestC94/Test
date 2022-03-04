import 'dart:ffi';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:testproject/home/dimensions.dart';
import 'package:testproject/widgets/big_text.dart';
import 'package:testproject/widgets/small_text.dart';
import 'package:carousel_pro/carousel_pro.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBody createState() => _FoodPageBody();
}

class _FoodPageBody extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPagrValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPagrValue = pageController.page!;
        // print("Current valur is " + _currPagrValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: Dimensions.pageView,
        //   child: PageView.builder(
        //     itemCount: 5,
        //     itemBuilder: (context, position) {
        //       return _buildPageItem(position);
        //     },
        //   ),
        // ),
        // new DotsIndicator(
        //   dotsCount: 5,
        //   position: _currPagrValue,
        //   decorator: DotsDecorator(
        //     size: const Size.square(9.0),
        //     activeSize: const Size(18.0, 9.0),
        //     activeShape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5.0)),
        //   ),
        // ),
        SizedBox(
            height: 200.0,
            width: 350.0,
            child: Carousel(
              images: [
                ExactAssetImage("assets/image/01.png"),
                ExactAssetImage("assets/image/02.jpg"),
                //ExactAssetImage("assets/image/01.png")
              ],
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.purple.withOpacity(0.5),
              borderRadius: true,
              autoplay: false,
              autoplayDuration: Duration(seconds: 1),
            )),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular1"),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(
                    text: "Food pairing",
                  ),
                )
              ],
            )),
        Container(
            height: 400,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: <Widget>[
                  Card(
                      child: ListTile(
                    title: Text("List Item 1"),
                  )),
                  Card(
                    child: ListTile(
                      title: Text("List Item 2"),
                    ),
                  ),
                  Card(
                      child: ListTile(
                    title: Text("List Item 3"),
                  )),
                  Card(
                      child: ListTile(
                    title: Text("List Item 4"),
                  )),
                  Card(
                      child: ListTile(
                    title: Text("List Item 5"),
                  )),
                  Card(
                      child: ListTile(
                    title: Text("List Item 6"),
                  )),
                  Card(
                      child: ListTile(
                    title: Text("List Item 7"),
                  )),
                  // Container(
                  //   height: 100,
                  //   child: Text("01"),
                  // ),
                  // Container(
                  //   height: 100,
                  //   child: Text("02"),
                  // ),
                  // Container(
                  //   height: 100,
                  //   child: Text("03"),
                  // ),
                  // Container(
                  //   height: 100,
                  //   child: Text("04"),
                  // ),
                  // Container(
                  //   height: 100,
                  //   child: Text("05"),
                  // ),
                  // Container(
                  //   height: 100,
                  //   child: Text("06"),
                  // ),
                ]))
            // istView(
            //   children: [
            // Card(
            //     child: ListTile(
            //   title: Text("List Item 1"),
            // )),
            // Card(
            //   child: ListTile(
            //     title: Text("List Item 2"),
            //   ),
            // ),
            // Card(
            //     child: ListTile(
            //   title: Text("List Item 3"),
            // )),
            // Card(
            //     child: ListTile(
            //   title: Text("List Item 4"),
            // )),
            // Card(
            //     child: ListTile(
            //   title: Text("List Item 5"),
            // )),
            // Card(
            //     child: ListTile(
            //   title: Text("List Item 6"),
            // )),
            // Card(
            //     child: ListTile(
            //   title: Text("List Item 7"),
            // )),
            //   ],
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,

            ) // ))
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    // if (index == _currPagrValue.floor()) {
    //   var currScale = 1 - (_currPagrValue - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currScale, 1)
    //     ..setTranslationRaw(0, currTrans, 0);
    // }
    if (index == _currPagrValue.floor() - 1) {
      var currScale = 1 - (_currPagrValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagrValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPagrValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagrValue.floor() - 1) {
      var currScale = 1 - (_currPagrValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc)),
            )
          ],
        ));
  }
}
