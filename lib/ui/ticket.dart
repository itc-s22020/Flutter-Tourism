import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  final Widget topChild;
  final Widget bottomChild;
  final double width;
  final double height;
  final Color color;
  final double borderRadius;
  final double holeRadius;
  final double holePosition;

  const Ticket({
    super.key,
    required this.topChild,
    required this.bottomChild,
    required this.width,
    required this.height,
    this.color = Colors.white,
    this.borderRadius = 20,
    this.holeRadius = 20,
    this.holePosition = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(
        borderRadius: borderRadius,
        holeRadius: holeRadius,
        holePosition: holePosition,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            Expanded(
              flex: (holePosition * 100).toInt(),
              child: topChild,
            ),
            SizedBox(
              height: holeRadius * 0.5,
            ),
            Expanded(
              flex: ((1 - holePosition) * 100).toInt(),
              child: bottomChild,
            ),
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double borderRadius;
  final double holeRadius;
  final double holePosition;

  TicketClipper({
    this.borderRadius = 20,
    this.holeRadius = 15,
    this.holePosition = 0.4,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    // 開始: 左上
    path.moveTo(0, borderRadius);
    // 左上の角
    path.quadraticBezierTo(0, 0, borderRadius, 0);
    // 上辺
    path.lineTo(size.width - borderRadius, 0);
    // 右上の角
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);
    // 右側から穴までの線
    path.lineTo(size.width, size.height * holePosition - holeRadius);
    // 右側の穴
    path.arcToPoint(
      Offset(size.width, size.height * holePosition + holeRadius),
      radius: Radius.circular(holeRadius),
      clockwise: false,
    );
    // 右下の線
    path.lineTo(size.width, size.height - borderRadius);
    // 右下の角
    path.quadraticBezierTo(size.width, size.height, size.width - borderRadius, size.height);
    // 下辺
    path.lineTo(borderRadius, size.height);
    // 左下の角
    path.quadraticBezierTo(0, size.height, 0, size.height - borderRadius);
    // 左側の穴までの線
    path.lineTo(0, size.height * holePosition + holeRadius);
    // 左側の穴
    path.arcToPoint(
      Offset(0, size.height * holePosition - holeRadius),
      radius: Radius.circular(holeRadius),
      clockwise: false,
    );
    // 終了
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
