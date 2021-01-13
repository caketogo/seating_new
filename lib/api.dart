import 'dart:convert' show json, base64, ascii;
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:json_traverse/json_traverse.dart';

class Network {
  final String api_url = 'https://www.seatingplanner.co.uk/api/';

  /**
   * Attempt to Login
   */
  Future<bool> login(data) async {
    // Build URL
    var url = api_url + 'login';

    // Make the request
    var res = await http.post(url, body: data);

    // Check status
    if (res.statusCode != 200) {
      return false;
    } else {
      var body = JSONTraverse(res.body);

      // Get our data from the response body
      var token = body.query('meta')['token'];
      var user = body.query('data');

      // Set in storage..
      //StorageUtil.putString('token', token);
      //StorageUtil.putString('name', user['name']);

      return true;
    }
  }

  // ignore: missing_return
  Future<bool> event(id) async {
    // Build URL
    var url = api_url + 'event/1';
    var token = 1234;
    // Make the request
    var res = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(res.body);
  }

  Future<bool> logout() {
    print('logout');
  }
}
