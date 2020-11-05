import 'package:CreateMotionsTask/helpers/responsive_ui.dart';
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

    return FittedBox(
      child: Container(
        width: _width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: Card(
              margin: EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5.0,
              color: Color(0XffF7F7F7),
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 12),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.cyan),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: (MediaQuery.of(context).size.height -
                                (_large ? 20 : 18)) /
                            3.5, // 3 - 19.5,                                 4 ,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Image.asset('assets/man.png'),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
