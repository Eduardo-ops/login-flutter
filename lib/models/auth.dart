import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=';

  // Método que realiza autenticação
  Future<void> _authentication(
      String email, String password, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyACkg7x1zigRV_FApKkgnVvGw_AJ_4Ry-Y';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }

    print(body);
  }

  // Método para se inscrever
  Future<void> signup(String email, String password) async {
    _authentication(email, password, 'signUp');
  }

  // Método para realizar login
  Future<void> login(String email, String password) async {
    _authentication(email, password, 'signInWithPassword');
  }
}
