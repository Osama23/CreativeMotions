

import 'package:CreateMotionsTask/models/actors_model.dart';
import 'package:CreateMotionsTask/services/actors_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ActorsRepositry get actorsRepositry {
    return new ActorsService();
  }

}
