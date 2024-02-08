import 'package:bot_toast/bot_toast.dart';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/theme/theme.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/trip_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/screens/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Directory;
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Palette.primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  Directory dir = await getApplicationCacheDirectory();
  Hive.init(dir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TokenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OriginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DestinationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TripProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Bus Booking',
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        theme: theme('l', context),
        home: const AuthPage(),
      ),
    );
  }
}
