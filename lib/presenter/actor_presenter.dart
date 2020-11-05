import 'package:CreateMotionsTask/dependency_injection.dart';
import 'package:CreateMotionsTask/models/actors_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ActorsContract {
  void onLoadDoctorsComplete(Actors c);
  void onLoadDoctorsFailed(onError);
}

class ActorsPresenter {
  ActorsContract actorsContract;
  ActorsRepositry actorsRepositry;

  ActorsPresenter(this.actorsContract) {
    actorsRepositry = new Injector().actorsRepositry;
  }

  void loadActors(BuildContext context) {
    actorsRepositry
        .getAllActorsList(context, http.Client())
        .then((c) => actorsContract.onLoadDoctorsComplete(c))
        .catchError((onError) => actorsContract.onLoadDoctorsFailed(onError));
  }
}