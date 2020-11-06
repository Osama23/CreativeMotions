import 'dart:convert';
import 'dart:typed_data';

import 'package:CreateMotionsTask/models/actors_model.dart';
import 'package:flutter/material.dart';

class FollowersList extends StatefulWidget {
  final Actors actors;
  final int index;

  FollowersList({
    this.actors,
    this.index,
  });
  @override
  _FollowersListState createState() => _FollowersListState();
}

class _FollowersListState extends State<FollowersList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 30,
          child: ClipOval(
            child: Image.asset(
              'assets/man.png',
              height: 30,
              width: 30,
              fit: BoxFit.cover, // Image.memory(
              //   dataFromBase64String(
              //     widget.actors.data.banner[0].image == null
              //       ? ""
              //       : widget.actors.data.banner[0].image
              //   ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(widget.actors.data.followers[widget.index].userName),
      ],
    );
  }
}
