import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:doctor/exceptions/user_exceptions.dart';
import 'package:doctor/services/auth_service.dart';

class User {
  final int id;
  String email;
  String username;
  String cellphone;
  String accessToken;
  String refreshToken;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.cellphone,
    required this.accessToken,
    required this.refreshToken,
  }) {
    if (isValidRefreshToken()) {
      getNewToken();
    } else {
      throw InvalidUserException();
    }
  }

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      cellphone: json['cellphone'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
    if (user.isValidRefreshToken()) {
      return user;
    } else {
      throw InvalidUserException();
    }
  }

  String fullName() {
    return username;
  }

  bool isValidRefreshToken() {
    final jwtData = JwtDecoder.decode(accessToken);
    return jwtData['exp'] < DateTime.now().millisecondsSinceEpoch;
  }

  void getNewToken() async {
    final jwtData = JwtDecoder.decode(accessToken);
    await Future.delayed(
      Duration(
        milliseconds:
            jwtData['exp'] * 1000 - DateTime.now().millisecondsSinceEpoch,
      ),
      () async {
        try {
          await AuthService.refreshToken(this);
        } catch (e) {}
      },
    );
    getNewToken();
  }

  String toJson() {
    return jsonEncode(
      {
        'id': id,
        'email': email,
        'cellphone': cellphone,
        'username': username,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      },
    );
  }
}
