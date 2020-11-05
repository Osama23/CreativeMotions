import 'dart:async';
import 'dart:io';
import 'package:CreateMotionsTask/models/actors_model.dart' as allActors;
import 'package:http/http.dart' as http;

import 'api_constant.dart';
import 'error_response.dart';

enum RequestType {
  GETALLACTORS,
}

dynamic getRequestBody(String requestBody) {
  return requestBody;
}

Future<dynamic> postCallService(String url, RequestType requestType,
    dynamic requestBody, String sessionToken, http.Client client) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        final response = await client
            .post('$url',
                headers: {
                  'Content-Type': 'application/json',
                  'SessionToken': sessionToken,
                },
                body: getRequestBody(requestBody))
            .timeout(const Duration(seconds: 60));
        final statusCode = response.statusCode;

        if (statusCode != 200) {
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_2, error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }

        switch (requestType) {
          
          default:
            {}
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " TimeoutException");
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}

String genericHandleErrorResponse(ErrorResponse errorResponse) {
  logD(errorResponse.message.toString() + errorResponse.key.toString());

  if (errorResponse.message == CODE_1) {
    return "There is no internet connection!";
  } else if (errorResponse.message == CODE_2) {
    return 'Server error check with Adminstrator! \n' + errorResponse.error;
  } else if (errorResponse.code != null && errorResponse.code == CODE_401) {
    return 'token Expired';
  } else {
    return 'Invalid error ,try Again later ';
  }
}

Future<dynamic> getCallService(
    String url, RequestType requestType, String sessionToken) async {
  logD('get url $url');
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        http.Response response = await http.get(url, headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $sessionToken',
        }).timeout(const Duration(seconds: 180));
        final statusCode = response.statusCode;
        logD('statusCode $statusCode');
        logD('response ${response.body}');
        if (statusCode != 200) {
          logD('error response ${response.body}');
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_2, error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.body);
            print('######## error is $errorResponse');
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }
        switch (requestType) {
          case RequestType.GETALLACTORS:
            return allActors.sucssessResponseAllActors(response.body);
            break;
          default:
            {}
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " TimeoutException");
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}

Future<dynamic> deleteCallService(String url, RequestType requestType,
    dynamic requestBody, String sessionToken) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        final response = await http
            //  .delete('$url $record',
            .delete(
          '$url',
          headers: {
            'Content-Type': 'application/json',
            'SessionToken': sessionToken,
          },
        ).timeout(const Duration(seconds: 60));
        final statusCode = response.statusCode;

        if (statusCode != 200) {
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_2, error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }

        switch (requestType) {
          // case RequestType.DELETEGRIDRECORD:
          //   return statusCode;
          //   break;

          default:
            {}
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " TimeoutException");
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}
