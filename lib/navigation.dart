import 'package:flutter/cupertino.dart';
import 'package:tourism/page/display.dart';

void navigateToPage(int index, BuildContext context) {
  final displayState = context.findAncestorStateOfType<DisplayState>();
  displayState?.navigateTo(index);
}

void toLog(BuildContext context) {
  navigateToPage(0, context);
}

void toHome(BuildContext context) {
  navigateToPage(1, context);
}

void toKey(BuildContext context) {
  navigateToPage(2, context);
}
