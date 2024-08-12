import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopliax/model/placeholder_model.dart';
import 'package:shopliax/service_locator.dart';

class PlaceholderRequest {
  Future<void> fetchPlaceHolders() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<PlaceHolderModel> placeHolders =
            data.map((json) => PlaceHolderModel.fromJson(json)).toList();
        $placeholderBloc.addPlaceHolderList(placeHolders);
         $placeholderBloc.addPlaceHolderInternetStatus(true);
        await _savePlaceHoldersToPrefs(placeHolders);
      } else {
        throw Exception('Failed to load placeholders');
      }
    } catch (e) {
      if (e is SocketException) {
        final placeHolders = await _loadPlaceHoldersFromPrefs();
        $placeholderBloc.addPlaceHolderList(placeHolders);
         $placeholderBloc.addPlaceHolderInternetStatus(false);
      } else {}
    }
  }

  Future<void> _savePlaceHoldersToPrefs(
      List<PlaceHolderModel> placeHolders) async {
    final prefs = await SharedPreferences.getInstance();
    final placeHolderJson =
        json.encode(placeHolders.map((e) => e.toJson()).toList());
    await prefs.setString('placeHolders', placeHolderJson);
  }

  Future<List<PlaceHolderModel>> _loadPlaceHoldersFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final placeHolderJson = prefs.getString('placeHolders');
    if (placeHolderJson != null) {
      List<dynamic> data = json.decode(placeHolderJson);
      return data.map((json) => PlaceHolderModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
