import 'package:CreateMotionsTask/helpers/responsive_ui.dart';
import 'package:CreateMotionsTask/models/actors_model.dart';
import 'package:CreateMotionsTask/presenter/actor_presenter.dart';
import 'package:CreateMotionsTask/widgets/actors_grid.dart';
import 'package:CreateMotionsTask/widgets/categories_list.dart';
import 'package:CreateMotionsTask/widgets/followers_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> implements ActorsContract {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  ActorsPresenter actorsPresenter;
  bool _isLoading = false;
  Actors actors = new Actors();

  _MainScreenState() {
    actorsPresenter = ActorsPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    if (!_isLoading) actorsPresenter.loadActors(context);

    return !_isLoading
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan),
          ))
        : actors.data.banner.length == 0
            ? Center(
                child: Text(
                  'No actors to show!!!',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: _large ? 20 : (_medium ? 16 : 12),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.grey.shade200,
                body: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 110,
                      margin: EdgeInsets.only(
                        top: 15,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: actors.data.banner.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return CategorisList(actors: actors);
                          }),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: actors.data.followers.length,
                          itemBuilder: (BuildContext ctx, int i) {
                            return FollowersList(
                              actors: actors,
                              index: i,
                            );
                          }),
                    ),
                    ActorsGrid(actors: actors,),
                  ],
                ),
              );
  }

  @override
  void onLoadDoctorsComplete(Actors c) {
    actors = c;
    setState(() {
      _isLoading = true;
    });
    print('######### doctors loaded successfully ${actors.data.banner.length}');
  }

  @override
  void onLoadDoctorsFailed(onError) {
    setState(() {
      _isLoading = true;
    });
  }
}
