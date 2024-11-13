import 'package:flutter/material.dart';

class TicketTop extends StatelessWidget {
  final bool hasQRCode;
  final double qrCodeSize;
  final double cornerSize;

  const TicketTop({
    super.key,
    required this.hasQRCode,
    required this.qrCodeSize,
    required this.cornerSize,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: qrCodeSize,
          height: qrCodeSize,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: CornerPainter(
                    hasQRCode: hasQRCode,
                    cornerSize: cornerSize,
                    color: const Color(0xFFBDBDBD),
                  ),
                ),
              ),
              if (hasQRCode)
                Center(
                  child: Image.asset(
                    'qr_sample.png',
                    width: qrCodeSize,
                    height: qrCodeSize,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

//qrコードの周りのやつ
class CornerPainter extends CustomPainter {
  final bool hasQRCode;
  final double cornerSize;
  final Color color;

  CornerPainter({
    required this.hasQRCode,
    required this.cornerSize,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    // 左上
    canvas.drawLine(
      Offset.zero,
      Offset(cornerSize, 0),
      paint,
    );
    canvas.drawLine(
      Offset.zero,
      Offset(0, cornerSize),
      paint,
    );

    // 右上
    canvas.drawLine(
      Offset(size.width - cornerSize, 0),
      Offset(size.width, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, cornerSize),
      paint,
    );

    // 右下
    canvas.drawLine(
      Offset(size.width - cornerSize, size.height),
      Offset(size.width, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height - cornerSize),
      Offset(size.width, size.height),
      paint,
    );

    // 左下
    canvas.drawLine(
      Offset(0, size.height - cornerSize),
      Offset(0, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(cornerSize, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
