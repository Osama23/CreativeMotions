


import 'package:CreateMotionsTask/helpers/constants.dart';
import 'package:CreateMotionsTask/models/actors_model.dart';
import 'package:CreateMotionsTask/network/api_client.dart';
import 'package:http/http.dart';

class ActorsService implements ActorsRepositry{

  String token='';
  @override
  Future<Actors> getAllActorsList(context, Client client) async{
    
    final sessionToken = token;
    return await getCallService(
        Constants(context).allActors,
        RequestType.GETALLACTORS,
        sessionToken);
  }
}