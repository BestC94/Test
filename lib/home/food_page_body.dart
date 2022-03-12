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
        SizedBox(
            height: 200.0,
            width: 350.0,
            child: Carousel(
              images: [
                ExactAssetImage("assets/image/01.jpg"),
                ExactAssetImage("assets/image/02.jpg"),
                ExactAssetImage("assets/image/03.jpg"),
                ExactAssetImage("assets/image/04.jpg"),
                ExactAssetImage("assets/image/05.jpg")
              ],
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              // dotBgColor: Colors.purple.withOpacity(0.5),
              borderRadius: true,
              autoplay: true,
              autoplayDuration: Duration(seconds: 3),
            )),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular", color: Colors.green),
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
                    title: Text("ผัดพริกเเกง (Fried Chili.)"),
                    subtitle: Text('50 บาท'),
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onLongPress: () {},
                  )),
                  Card(
                      child: ListTile(
                    title: Text("ต้มยำกุ้ง ( Tom Yum Kung.)"),
                    subtitle: Text('60 บาท'),
                    trailing: Icon(Icons.add_circle, color: Colors.blue),
                    onLongPress: () {},
                  )),
                  Card(
                      child: ListTile(
                    title: Text("เเกงข่าไก่,ต้มข่าไก่ (Tom Kha Gai)"),
                    subtitle: Text('45 บาท'),
                    trailing: Icon(Icons.add_circle, color: Colors.blue),
                    onLongPress: () {},
                  )),
                  Card(
                      child: ListTile(
                    title: Text("ไก่ย่าง"),
                    subtitle: Text('50 บาท'),
                    trailing: Icon(Icons.add_circle, color: Colors.blue),
                    onLongPress: () {},
                  )),
                  Card(
                      child: ListTile(
                    title: Text("ผัดไทย"),
                    subtitle: Text('35 บาท'),
                    trailing: Icon(Icons.add_circle, color: Colors.blue),
                    onLongPress: () {},
                  )),
                  Card(
                      child: ListTile(
                    title: Text("เเพนงไก่"),
                    subtitle: Text('45 บาท'),
                    trailing: Icon(Icons.add_circle, color: Colors.blue),
                    onLongPress: () {},
                  )),
                  Card(
                      child: ListTile(
                    title: Text("เเกงไก่"),
                    subtitle: Text('40 บาท'),
                    trailing: Icon(Icons.add_circle, color: Colors.blue),
                    onLongPress: () {},
                  )),
                ]))) // ))
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

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
