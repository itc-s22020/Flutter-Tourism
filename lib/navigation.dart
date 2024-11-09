import 'package:flutter/cupertino.dart';
import 'package:tourism/page/display.dart';

void navigateToPage(int index, BuildContext context) {
  final displayState = context.findAncestorStateOfType<DisplayState>();
  displayState?.navigateTo(index);
}

void toHome(BuildContext context) {
  navigateToPage(0, context);
}

void toHotel(BuildContext context) {
  navigateToPage(1, context);
}

void toRoute(BuildContext context) {
  navigateToPage(2, context);
}

void toSpot(BuildContext context) {
  navigateToPage(3, context);
}
