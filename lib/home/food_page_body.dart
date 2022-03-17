import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:testproject/db/notes_database.dart';
import 'package:testproject/model/food.dart';
import 'package:testproject/widgets/big_text.dart';
import 'package:testproject/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  final Food? food;
  const FoodPageBody({Key? key, this.food}) : super(key: key);

  @override
  _FoodPageBody createState() => _FoodPageBody();
}

class _FoodPageBody extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var foodList = [
    {"id": 1, "name": "ผัดพริกเเกง (Fried Chili.)", "price": 40},
    {"id": 2, "name": "ต้มยำกุ้ง ( Tom Yum Kung.)", "price": 60},
    {"id": 3, "name": "เเกงข่าไก่,ต้มข่าไก่ (Tom Kha Gai)", "price": 45},
    {"id": 4, "name": "ไก่ย่าง (grilled chicken)", "price": 50},
    {"id": 5, "name": "ผัดไทย (Pad Thai)", "price": 45},
    {"id": 6, "name": "เเพนงไก่ (Panang Chicken)", "price": 35},
    {"id": 7, "name": "เเกงไก่ (Chicken Curry)", "price": 40},
  ];

  late int price;
  late String name;

  @override
  void initState() {
    super.initState();
    price = widget.food?.price ?? 0;
    name = widget.food?.name ?? '';
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  Future addNote() async {
    final food = Food(
      name: name,
      price: price,
    );

    await NotesDatabase.instance.create(food);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
            height: 200.0,
            width: 350.0,
            child: Carousel(
              // ignore: prefer_const_literals_to_create_immutables
              images: [
                ExactAssetImage("assets/image/01.jpg"),
                ExactAssetImage("assets/image/02.jpg"),
                ExactAssetImage("assets/image/03.jpg"),
                ExactAssetImage("assets/image/03.jpg"),
                ExactAssetImage("assets/image/02.jpg")
              ],
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              borderRadius: true,
              autoplay: true,
              autoplayDuration: Duration(seconds: 3),
            )),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular", color: Colors.green),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".", color: Colors.black26),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 20,
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
                    title: Text(foodList[0]['name'].toString()),
                    subtitle: Text(foodList[0]['price'].toString() + " บาท"),
                    // ignore: prefer_const_constructors
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        // ignore: unnecessary_this
                        this.name = foodList[0]['name'].toString();
                        // ignore: unnecessary_this
                        this.price = int.parse(foodList[0]['price'].toString());
                        addNote();
                      });
                    },
                  )),
                  Card(
                      child: ListTile(
                    title: Text(foodList[1]['name'].toString()),
                    subtitle: Text(foodList[1]['price'].toString() + " บาท"),
                    // ignore: prefer_const_constructors
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        // ignore: unnecessary_this
                        this.name = foodList[1]['name'].toString();
                        // ignore: unnecessary_this
                        this.price = int.parse(foodList[1]['price'].toString());
                        addNote();
                      });
                    },
                  )),
                  Card(
                      child: ListTile(
                    title: Text(foodList[2]['name'].toString()),
                    subtitle: Text(foodList[2]['price'].toString() + " บาท"),
                    // ignore: prefer_const_constructors
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        // ignore: unnecessary_this
                        this.name = foodList[2]['name'].toString();
                        // ignore: unnecessary_this
                        this.price = int.parse(foodList[2]['price'].toString());
                        addNote();
                      });
                    },
                  )),
                  Card(
                      child: ListTile(
                    title: Text(foodList[3]['name'].toString()),
                    subtitle: Text(foodList[3]['price'].toString() + " บาท"),
                    // ignore: prefer_const_constructors
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        // ignore: unnecessary_this
                        this.name = foodList[3]['name'].toString();
                        // ignore: unnecessary_this
                        this.price = int.parse(foodList[3]['price'].toString());
                        addNote();
                      });
                    },
                  )),
                  Card(
                      child: ListTile(
                    title: Text(foodList[4]['name'].toString()),
                    subtitle: Text(foodList[4]['price'].toString() + " บาท"),
                    // ignore: prefer_const_constructors
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        // ignore: unnecessary_this
                        this.name = foodList[4]['name'].toString();
                        // ignore: unnecessary_this
                        this.price = int.parse(foodList[4]['price'].toString());
                        addNote();
                      });
                    },
                  )),
                  Card(
                      child: ListTile(
                    title: Text(foodList[5]['name'].toString()),
                    subtitle: Text(foodList[5]['price'].toString() + " บาท"),
                    // ignore: prefer_const_constructors
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        // ignore: unnecessary_this
                        this.name = foodList[5]['name'].toString();
                        // ignore: unnecessary_this
                        this.price = int.parse(foodList[5]['price'].toString());
                        addNote();
                      });
                    },
                  )),
                  Card(
                      child: ListTile(
                    title: Text(foodList[6]['name'].toString()),
                    subtitle: Text(foodList[6]['price'].toString() + " บาท"),
                    // ignore: prefer_const_constructors
                    trailing: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      setState(() {
                        // ignore: unnecessary_this
                        this.name = foodList[6]['name'].toString();
                        // ignore: unnecessary_this
                        this.price = int.parse(foodList[6]['price'].toString());
                        addNote();
                      });
                    },
                  )),
                ]))) // ))
      ],
    );
  }
}
