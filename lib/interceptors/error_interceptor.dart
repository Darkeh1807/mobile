import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_fade.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';

class ErrorInterceptor implements InterceptorContract {
  final BuildContext context;
  ErrorInterceptor({
    required this.context,
  });
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    if (response.statusCode == 401) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Token has expired')));
      await Future.delayed(const Duration(seconds: 3));

      // ignore: use_build_context_synchronously
      nextScreenClosePrev(context, FadeRoute(page: const LoginScreen()));
    }
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() {
    throw UnimplementedError();
  }

  @override
  Future<bool> shouldInterceptResponse() {
    throw UnimplementedError();
  }
}
