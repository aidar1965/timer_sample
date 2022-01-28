import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_sample/app/themes/theme_constants.dart';
import 'package:timer_sample/app/themes/theme_data.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final ThemeData? mode;
  const CustomButton(
      {Key? key, required this.onPressed, required this.child, this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData actualMode;
    if (mode == null) {
      actualMode = CustomTheme().lightTheme;
    } else {
      actualMode = mode!;
    }

    return ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
            primary: actualMode.brightness == Brightness.light
                ? primaryLight
                : primaryDark,
            padding: customButtonPadding));
  }
}
