import 'package:flutter/material.dart';
import 'package:testproject/widgets/big_text.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: const EdgeInsets.only(top: 60, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    // children: [Text("Bangladesh"), Text("City")],
                    children: [
                      BigText(text: "รายการ", color: Colors.green),
                    ]),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    // textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  onPressed: () => {Navigator.pop(context)},
                  icon: Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                  label: Text(
                    '',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
