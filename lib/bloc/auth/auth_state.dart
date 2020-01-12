import 'package:flutter/material.dart';
import 'package:technical_login_test_prj/model/user_profile_model.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class RequestingLoginState extends AuthState {}

class AuthLoaded extends AuthState {
  final UserProfileEntity userProfileEntity;

  AuthLoaded({@required this.userProfileEntity});
}

class RequestingLoginFailState extends AuthState {
  final String error;

  RequestingLoginFailState({this.error});
}

class GuestState extends AuthState {}
