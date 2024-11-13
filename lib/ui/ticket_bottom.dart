import 'package:flutter/material.dart';

class TicketBottom extends StatelessWidget {
  final List<Map<String, String>> textLinesWithTitle;
  final double textSize;

  const TicketBottom({
    super.key,
    required this.textLinesWithTitle,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
          childAspectRatio: 3,
        ),
        itemCount: textLinesWithTitle.length,
        itemBuilder: (context, index) {
          final item = textLinesWithTitle[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item['title'] ?? '',
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item['text'] ?? '',
                style: TextStyle(
                  fontSize: textSize * 1.2,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}