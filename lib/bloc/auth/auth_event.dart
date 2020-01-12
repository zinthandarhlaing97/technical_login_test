import 'package:flutter/material.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class RequestLoginEvent extends AuthEvent {
  final String userName;
  final String passwordHash;

  RequestLoginEvent({@required this.userName, @required this.passwordHash});
}

class LogoutEvent extends AuthEvent {}
