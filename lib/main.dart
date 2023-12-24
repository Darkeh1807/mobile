import 'package:bot_toast/bot_toast.dart';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/theme/theme.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/screens/auth/auth_page.dart';
import 'package:bus_booking/screens/auth/create_account_screen.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/screens/auth/otp_verify_screen.dart';
import 'package:bus_booking/screens/auth/signup_screen.dart';
import 'package:bus_booking/screens/booking/booking_details_cofirm_screen.dart';
import 'package:bus_booking/screens/booking/payment_success_screen.dart';
import 'package:bus_booking/screens/booking/search_results_screen.dart';
import 'package:bus_booking/screens/bus/create_bus_screen.dart';
import 'package:bus_booking/screens/home/app_home.dart';
import 'package:bus_booking/screens/notifications/notifications_screen.dart';
import 'package:bus_booking/screens/settings/basic_information_screen.dart';
import 'package:bus_booking/screens/ticket/ticket_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Directory;
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

// import 'package:google_fonts/google_fonts.dart';
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
        )
      ],
      child: MaterialApp(
        title: 'Bus Booking',
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        theme: theme('l', context),
        initialRoute: AuthPage.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppHome.routeName:
              return MaterialPageRoute(
                builder: (context) => const AppHome(),
              );
            case AuthPage.routeName:
              return MaterialPageRoute(
                builder: (context) => const AuthPage(),
              );
            case LoginScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              );
            case SignUpScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              );
            case CreateAccountScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const CreateAccountScreen(),
              );

            case OtpVerifyScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const OtpVerifyScreen(),
              );
            case SearchResultsScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const SearchResultsScreen(),
              );

            case PaymentSuccessScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const PaymentSuccessScreen(),
              );

            case NotificationsScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              );
            case BasicInformationScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const BasicInformationScreen(),
              );

            case CreateBusScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const CreateBusScreen(),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => const AuthPage(),
              );
          }
        },
      ),
    );
  }
}
