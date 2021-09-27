import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyACkg7x1zigRV_FApKkgnVvGw_AJ_4Ry-Y';

  Future<void> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );
  }
}
