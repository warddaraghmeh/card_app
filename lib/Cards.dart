// ignore_for_file: prefer_const_constructors

import 'package:card_app/main.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Function deletCard;
  final BestQuotes item;

  const Cards({
    super.key,
    required this.deletCard,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 57, 66, 151),
      margin: EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.title,
              style: TextStyle(fontSize: 27, color: Colors.white),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deletCard(item);
                  },
                  icon: Icon(Icons.delete_sweep_sharp),
                  iconSize: 38,
                  color: Color.fromARGB(255, 235, 88, 78),
                ),
                Text(
                  item.author,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
