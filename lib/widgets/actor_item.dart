import 'package:CreateMotionsTask/helpers/responsive_ui.dart';
import 'package:CreateMotionsTask/widgets/actor_profile.dart';
import 'package:flutter/material.dart';

class ActorItem extends StatefulWidget {
  @override
  _ActorItemState createState() => _ActorItemState();
}

class _ActorItemState extends State<ActorItem> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/man.png',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // child: Image.network(
                  //   imageUrl,
                  //   height: 250,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  child: Container(
                    width: 20,
                  //  color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border_outlined,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('247'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.comment,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('57'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('33'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
