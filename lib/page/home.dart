import 'package:flutter/material.dart';
import '../navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("#HomePage"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                toKey(context);
              },
              child: const Text("toHotelPage"),
            ),
          ],
        ),
      ),
    );
  }
}
