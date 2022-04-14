import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/artickel.dart';

String apiKey = 'b088175ab52747bf89a7ca5957114a9c';
String baseUrl = 'https://newsapi.org/v2';

//! Ngelist dan ngambil data dari api

class News {
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url =
        '$baseUrl/top-headlines?country=id&category=business&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){

      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((ano) => Article.fromJson(ano)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("Sorry we can't load this data!");
    }
  }

  Future<List<Article>?> getNewsCategory(String category) async {
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((ano) => Article.fromJson(ano)).toList();
      print(response.body);
      return list;
    }else {
      throw Exception("Sorry we can't load this data!");
    }
  }
}
