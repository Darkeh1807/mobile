import 'package:bus_booking/hive/token_hive_methods.dart';
import 'package:bus_booking/hive/user_hive_methods.dart';
import 'package:bus_booking/models/user_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/screens/auth/signup_screen.dart';
import 'package:bus_booking/screens/home/app_home.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  static const routeName = 'auth_page';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String token = "";
  Future<User?> _isExistingUser(BuildContext context) async {
    // showProgressLoader();
    User? userInfo = await UserHiveMethods().getHiveUser();
    if (userInfo != null && userInfo.id!.isNotEmpty) {
      // cancelLoader();
      return userInfo;
    } else {
      // cancelLoader();
      return null;
    }
  }

  Future<void> getLocalToken(BuildContext context) async {
    try {
      String? ltoken = await TokenHiveMethods().getToken();
      if (ltoken != null && ltoken.isNotEmpty) {
        setState(() {
          token = ltoken;
        });
      } else if (ltoken == "" && ltoken!.isEmpty) {
        await Future.delayed(const Duration(seconds: 3));
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    } catch (e) {
      logs.d('Error: $e');
    }
  }

  @override
  void initState() {
    getLocalToken(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider up = context.read<UserProvider>();
    TokenProvider tp = context.read<TokenProvider>();
    return FutureBuilder(
      future: _isExistingUser(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          up.setUser = snapshot.data!;
          token.isNotEmpty ? tp.setToken = token : null;
          return const AppHome();
        } else {
          return const SignUpScreen();
        }
      },
    );
  }
}
