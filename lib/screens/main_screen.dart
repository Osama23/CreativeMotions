import 'package:CreateMotionsTask/widgets/actors_grid.dart';
import 'package:CreateMotionsTask/widgets/categories_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        // shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.only(
              top: 15,
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext ctx, int index) {
                  return CategorisList();
                }),
          ),
          SizedBox(
            height: 10,
          ),
        //  ActorsGrid(),
        ],
      ),
    );
  }
}