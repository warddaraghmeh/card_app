// main.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:card_app/Cards.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  String title;
  String author;

  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  List<BestQuotes> allQuotes = [
    BestQuotes(title: "الله اكبر ولله الحمد", author: "اللهم صل على النبي"),
    BestQuotes(title: "اللهم اغفر لي ذنوبي", author: "وغفر لي خطاياي"),
    BestQuotes(title: "اللهم ارحم ضعفي وقوني", author: "ورزقني وهدني"),
  ];

  deletCard(BestQuotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }

  addNewCard() {
    if (myController.text.isNotEmpty && myController2.text.isNotEmpty) {
      setState(() {
        allQuotes.add(
          BestQuotes(title: myController.text, author: myController2.text),
        );
        myController.clear();
        myController2.clear();
      });
    }
    Navigator.pop(context); // Always close the modal bottom sheet
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        keyboardType: TextInputType.multiline,
                        textDirection: TextDirection.ltr,
                        controller: myController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintText: "Add new quote",
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        textDirection: TextDirection.ltr,
                        controller: myController2,
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintText: "Add new author",
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: addNewCard,
                        child: Text(
                          "Add",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                );
              },
              isScrollControlled: true,
            );
          },
          backgroundColor: Color.fromARGB(255, 33, 210, 89),
          child: Icon(Icons.add_card_sharp),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 50, 57, 121),
          title: Text(
            "Best Quotes",
            style: TextStyle(fontSize: 27, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...allQuotes
                  .map((item) => Cards(
                        item: item,
                        deletCard: deletCard,
                      ))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
