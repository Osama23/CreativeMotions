import 'dart:convert';
import 'dart:typed_data';

import 'package:CreateMotionsTask/models/actors_model.dart';
import 'package:flutter/material.dart';

class CategorisList extends StatefulWidget {
  final Actors actors;

  CategorisList({
    this.actors,
  });
  @override
  _CategorisListState createState() => _CategorisListState();
}

class _CategorisListState extends State<CategorisList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: DecorationImage(
                  image: Image.asset('assets/man.png').image,
                  fit: BoxFit.cover,
                )),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }
}
