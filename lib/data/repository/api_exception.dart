// import 'package:dio/src/dio_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/helper/routes_helper.dart';

import '../model/connection_model/connection_model.dart';

void apiException(
    DioException exception, NavigatorState navigator, String screen) {
  ConnectionModel? connectionModel;

  void navigateToNoConnectionScreen() {
    Future.delayed(Duration.zero, () {
      navigator.pushNamed(
        RouterHelper.noConnectionScreen,
        arguments: connectionModel,
      );
    });
  }

  switch (exception.type) {
    case DioExceptionType.connectionError:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: "Check your internet connection",
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.cancel:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: "Request to API server was cancelled",
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.receiveTimeout:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: "Receive timeout error",
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.sendTimeout:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: "Send timeout error",
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.connectionTimeout:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: "Connection timeout error",
      );
      navigateToNoConnectionScreen();
      break;
    case DioExceptionType.badResponse:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: "Something went Wrong",
      );
      switch (exception.response!.statusCode) {
        case 400:
          connectionModel.message = "Error 400 Bad Request";
          break;
        case 401:
          connectionModel.message = exception.response!.data['message'];
          break;
        case 403:
          connectionModel.message = "Error 403 Forbidden";
          break;
        case 404:
          connectionModel.message = "Error 404 Not Found";
          break;
        case 422:
          connectionModel.message = exception.response!.data['message'];
          break;
        case 500:
          connectionModel.message = "500 Server Error";
          break;
        default:
          break;
      }
      navigateToNoConnectionScreen();
      break;
    default:
      connectionModel = ConnectionModel(
        currentScreen: screen,
        message: "Something went Wrong",
      );
      navigateToNoConnectionScreen();
      break;
  }
}
