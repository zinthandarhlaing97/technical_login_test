import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_login_test_prj/bloc/bloc.dart';
import 'package:technical_login_test_prj/ui/user_profile/user_profile_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordHashController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordHashController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState authState) {
        if (authState is AuthLoaded) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) {
                return BlocProvider.value(
                  value: AuthBloc(),
                  child: UserProfilePage(
                    user: authState.userProfileEntity,
                  ),
                );
              },
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (authState is RequestingLoginFailState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                '${authState.error}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.amber),
              ),
              backgroundColor: Colors.black87,
            ),
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            print("$authState");
            return Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          MediaQuery.of(context).size.height * 0.1,
                          0,
                          MediaQuery.of(context).size.height * 0.1),
                      child: Text(
                        "Please Log In to your account",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 15.0,
                              color: Colors.amber,
                              offset: Offset(5.0, 5.0),
                            )
                          ],
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      width: double.infinity,
                      child: TextField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 8),
                      child: TextField(
                        controller: _passwordHashController,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    authState is RequestingLoginState
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            width: double.infinity,
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                              color: Colors.amber,
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                    RequestLoginEvent(
                                        userName: _userNameController.text,
                                        passwordHash:
                                            _passwordHashController.text));
                              },
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
