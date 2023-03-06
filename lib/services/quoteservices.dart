import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/model/searchmodel.dart';
import 'package:flutter_application_1/services/helper/constant.dart';
import 'package:http/http.dart' as http;

class QuoteService {
  Future<List<SearchModel>> searchQuotes(String query) async {
    List<SearchModel> searchlist = [];
    final response = await http.get(Uri.parse("$SEARCHQUOTE$query=1"));

    log('********************');
    log(response.body.toString());
    log("*****************");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      for (var value in json['results']) {
        SearchModel data = SearchModel.fromJson(value);
        searchlist.add(data);
      }
      return searchlist;
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  Future<List<SearchModel>> searchQuotesdiff(String query) async {
    List<SearchModel> searchlist = [];
    final response = await http.get(Uri.parse("$SEARCHQUOTE$query=10"));

    log('********************');
    print(response.body.toString());
    log("*****************");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      for (var value in json['results']) {
        SearchModel data = SearchModel.fromJson(value);
        searchlist.add(data);
      }
      return searchlist;
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
