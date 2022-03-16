import 'package:flutter/material.dart';
import 'package:testproject/db/notes_database.dart';
import 'package:testproject/model/food.dart';
import 'package:testproject/widgets/big_text.dart';
//import 'package:testproject/db/notes_database.dart';
//import 'package:testproject/widgets/big_text.dart';

class FoodDetail extends StatefulWidget {
  final Food? food;
  const FoodDetail({Key? key, this.food}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  late List<Food> foods;
  bool isLoading = false;
  var total = 0;
  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    // ignore: unnecessary_this
    this.foods = await NotesDatabase.instance.readAllFoods();
    for (var food in foods) {
      // ignore: unnecessary_this
      this.total = this.total + food.price.toInt();
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : foods.isEmpty
                // ignore: prefer_const_constructors
                ? Text(
                    'No Foods',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  )
                : buildBody(context, foods),
      ),
    );
  }

  Widget buildBody(BuildContext context, foods) => Container(
        margin: const EdgeInsets.only(top: 60, bottom: 15),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  BigText(text: "รายการ", color: Colors.green),
                ]),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  onPressed: () => {Navigator.pop(context)},
                  icon: const Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                  // ignore: prefer_const_constructors
                  label: Text(
                    '',
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  for (var food in foods)
                    ListTile(
                        leading: const Icon(Icons.fastfood_sharp),
                        title: Text(food.name.toString()),
                        subtitle: Text(food.price.toString()),
                        // ignore: unnecessary_new
                        trailing: new IconButton(
                            onPressed: () async {
                              await NotesDatabase.instance.delete(food.id);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          super.widget));
                            },
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )))
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                const Icon(Icons.attach_money_rounded),
                Text("ทั้งหมด: " + total.toString() + " บาท",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 50),
                TextButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                  child: const Text('Show Dialog'),
                )
                // TextButton.icon(
                //   style: TextButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(24.0),
                //     ),
                //   ),
                //   onPressed: () => {Navigator.pop(context)},
                //   icon: const Icon(
                //     Icons.navigate_before,
                //     color: Colors.white,
                //   ),
                //   // ignore: prefer_const_constructors
                //   label: Text(
                //     '',
                //   ),
                // ),
              ],
              // leading: const Icon(Icons.attach_money_rounded),
              // title: Text("ทั้งหมด: " + total.toString() + " บาท"),
            )),
          ],
        ),
      );
}
