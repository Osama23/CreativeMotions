import 'package:CreateMotionsTask/widgets/actor_item.dart';
import 'package:flutter/material.dart';

class ActorsGrid extends StatefulWidget {
  @override
  _ActorsGridState createState() => _ActorsGridState();
}

class _ActorsGridState extends State<ActorsGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 265,
        childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 5,
      itemBuilder: (ctx, i) => ActorItem(),
    );
  }
}
