import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/screens/auth/create_account_screen.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/screens/auth/otp_verify_screen.dart';
import 'package:bus_booking/screens/auth/signup_screen.dart';
import 'package:bus_booking/screens/booking/booking_details_cofirm_screen.dart';
import 'package:bus_booking/screens/booking/payment_success_screen.dart';
import 'package:bus_booking/screens/booking/search_results_screen.dart';
import 'package:bus_booking/screens/booking/select_trip_proceed_screen.dart';
import 'package:bus_booking/screens/home/app_home.dart';
import 'package:bus_booking/screens/notifications/notifications_screen.dart';
import 'package:bus_booking/screens/settings/basic_information_screen.dart';
import 'package:bus_booking/screens/ticket/ticket_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:google_fonts/google_fonts.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Palette.primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  //   SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Palette.primaryColor,
              secondary: Palette.tertiaryColor,
            ),
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.inter(
            color: Palette.baseBlack,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Palette.baseBlack),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme.copyWith(
              // bodyText1: const TextStyle(height: 1),
              // bodyText2: const TextStyle(height: 1),
              // headline1: const TextStyle(height: 1),
              // headline2: const TextStyle(height: 1),
              // headline3: const TextStyle(height: 1),
              // headline4: const TextStyle(height: 1),
              // headline5: const TextStyle(height: 1),
              // headline6: const TextStyle(height: 1),
              // subtitle1: const TextStyle(height: 1),
              // subtitle2: const TextStyle(height: 1),
              // caption: const TextStyle(height: 1),
              // button: const TextStyle(height: 1),
              // overline: const TextStyle(height: 1),
              ),
        ).apply(
          bodyColor: Palette.baseBlack,
          displayColor: Palette.baseBlack,
        ),
      ),
      initialRoute: AppHome.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppHome.routeName:
            return MaterialPageRoute(
              builder: (context) => AppHome(),
            );
          case LoginScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => LoginScreen(),
            );
          case SignUpScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            );
          case CreateAccountScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => CreateAccountScreen(),
            );
          case SelectedScreenProceedScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => SelectedScreenProceedScreen(),
            );
          case OtpVerifyScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => OtpVerifyScreen(),
            );
          case SearchResultsScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => SearchResultsScreen(),
            );
          case BookingDetailsConfirmScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => BookingDetailsConfirmScreen(),
            );
          case PaymentSuccessScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => PaymentSuccessScreen(),
            );
          case TicketDetailsScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => TicketDetailsScreen(),
            );
          case NotificationsScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => NotificationsScreen(),
            );
          case BasicInformationScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => BasicInformationScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => LoginScreen(),
            );
        }
      },
    );
  }
}
