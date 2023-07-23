import 'package:flutter/material.dart';

SizedBox addVerticalSpace(double verticalSpace) {
  return SizedBox(height: verticalSpace);
}

SizedBox addHorizontalSpace(double horizontalSpace) {
  return SizedBox(
    width: horizontalSpace,
  );
}

void pushNamedRoute(BuildContext context, String routeName) {
  Navigator.of(context).pushNamed(routeName);
}

void pushWidgetRoute(BuildContext context, Widget route) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
}
