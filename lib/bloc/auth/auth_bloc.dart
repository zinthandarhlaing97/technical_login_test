import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:technical_login_test_prj/bloc/auth/auth_event.dart';
import 'package:technical_login_test_prj/bloc/auth/auth_state.dart';
import 'package:technical_login_test_prj/constant.dart';
import 'package:technical_login_test_prj/model/user_profile_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RequestLoginEvent) {
      print("Request login event : ${event.userName}, ${event.passwordHash}");
      yield RequestingLoginState();
      final credentials = {
        "Username": event.userName,
        "PasswordHash": event.passwordHash,
      };

      var response = await http.Client().post(
        BASE_URL + "/login",
        body: json.encode(credentials),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      print("Login:${response.statusCode}");
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body.toString());

        if (decoded == null) {
          yield RequestingLoginFailState(
              error: "Incorrect username or password!");
        } else {
          var userProfile = UserProfileEntity.fromJson(decoded);

          yield AuthLoaded(userProfileEntity: userProfile);
        }
      } else {
        yield RequestingLoginFailState(
            error: "Something went wrong.Please Try again!");
      }
    }
    if (event is LogoutEvent) {
      print("Log out event");
      yield GuestState();
    }
  }
}
