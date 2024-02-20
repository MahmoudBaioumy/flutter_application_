import 'package:dio/dio.dart';
import 'package:flutter_application_/core/Constants/app_constants.dart';
import 'package:flutter_application_/features/Home/data/news_model/news_model.dart';

class ApiServices {
  // get data by Category
  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}country=us&category=$category&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

//get Data by Source
 static Future<NewsModel?> getNewsBySource(String source) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}country=us&source=$source&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }


//get Data by Search
  static Future<NewsModel?> getNewsBySearch(String searchkey) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}country=us&q=$searchkey&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
