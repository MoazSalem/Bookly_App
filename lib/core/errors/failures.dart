import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout');
      case DioExceptionType.badResponse:
        if (dioException.response?.statusCode != null) {
          return ServerFailure(
              'Received invalid status code: ${dioException.response?.statusCode}');
        } else {
          return ServerFailure('Received invalid status code');
        }
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown error');
      default:
        return ServerFailure('Something went wrong');
    }
  }
}
