import 'package:CreateMotionsTask/helpers/responsive_ui.dart';
import 'package:flutter/material.dart';

enum FilterOptions {
  CLEAR,
  // All,
}

class ActorProfile extends StatefulWidget {
  @override
  _ActorProfileState createState() => _ActorProfileState();
}

class _ActorProfileState extends State<ActorProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // SizedBox(
        //   width: 10,
        // ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: Image.asset(
                  'assets/man.png',
                  height: 50,
                  width: 50,
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
            Column(
              children: [
                Text(
                  'name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
        settingsIcon(context),
      ],
    );
  }

  Widget settingsIcon(context) {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {},
      icon: Icon(
        Icons.more_vert,
        color: Colors.black,
        size: MediaQuery.of(context).size.width * 0.08,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Text('do something'),
          value: FilterOptions.CLEAR,
        ),
      ],
    );
  }
}
