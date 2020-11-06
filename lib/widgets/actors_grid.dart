import 'package:CreateMotionsTask/models/actors_model.dart';
import 'package:CreateMotionsTask/widgets/actor_item.dart';
import 'package:CreateMotionsTask/widgets/actor_profile.dart';
import 'package:flutter/material.dart';

class ActorsGrid extends StatefulWidget {
  final Actors actors;

  ActorsGrid({
    this.actors,
  });
  @override
  _ActorsGridState createState() => _ActorsGridState();
}

class _ActorsGridState extends State<ActorsGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        ActorProfile(),
        GridView.builder(
          shrinkWrap: true,
          physics:NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(5),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 405,
            childAspectRatio: 1.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 5,
          itemBuilder: (ctx, i) => ActorItem(),
        ),
      ],
    );
  }
}
