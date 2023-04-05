import 'dart:convert';

import 'package:covid_tracker/models/home_model.dart';
import 'package:http/http.dart' as http;

class HomeViewModel {
  Future<HomeModel> fetchWorldStates() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return HomeModel.fromJson(data);
    } else {
      throw Exception('some error');
    }
  }
}
