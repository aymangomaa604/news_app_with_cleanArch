import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout in api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout in api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout in api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('there is no internet connection');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response!.statusCode!, error.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('the request is cancled by server');

      case DioExceptionType.connectionError:
        return ServerFailure('there is no internet connection');

      case DioExceptionType.unknown:
        return ServerFailure('opps There was an error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('request not found ,try later please');
    } else if (statusCode == 500) {
      return ServerFailure('problem with server ,try later please');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('opps There was an error');
    }
  }
}
