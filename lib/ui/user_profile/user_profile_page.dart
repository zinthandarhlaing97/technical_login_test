import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_login_test_prj/bloc/bloc.dart';
import 'package:technical_login_test_prj/constant.dart';
import 'package:technical_login_test_prj/model/user_profile_model.dart';
import 'package:technical_login_test_prj/ui/login/login_page.dart';

class UserProfilePage extends StatelessWidget {
  final UserProfileEntity user;

  const UserProfilePage({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("UserProfilePage $user");
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState authState) {
        if (authState is GuestState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) {
                return BlocProvider.value(
                  value: AuthBloc(),
                  child: LoginPage(),
                );
              },
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: BlocProvider.value(
        value: BlocProvider.of<AuthBloc>(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(USER_PHOTO),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.username,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          user.roleId.name,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.amber,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              _buildProfileItem(
                iconData: Icons.mail,
                label: user.clientId.email ?? "",
              ),
              _buildProfileItem(
                iconData: Icons.phone,
                label: user.clientId.phone ?? "",
              ),
              _buildProfileItem(
                iconData: Icons.location_city,
                label: user.clientId.address ?? "",
              ),
              _buildCustomListTile(label: "Role"),
              _buildCustomListTile(label: "Package"),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                  color: Colors.amber,
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomListTile({String label}) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: 50,
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.amber,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[400]),
      ],
    );
  }

  Widget _buildProfileItem({IconData iconData, String label}) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 16),
                width: 40,
                child: Icon(
                  iconData,
                  size: 26,
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              )
            ],
          ),
        ),
        Divider(color: Colors.grey[400]),
      ],
    );
  }
}
