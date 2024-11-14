import 'package:flutter/material.dart';
import '../ui/light_button.dart';
import '../ui/ticket.dart';
import '../ui/ticket_bottom.dart';
import '../ui/ticket_top.dart';
import 'camera.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              //チケット
              Expanded(
                child: Container(
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Ticket(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    holePosition: 0.6,
                    topChild: TicketTop(
                      hasQRCode: true,
                      qrCodeSize: size.width * 0.75,
                      cornerSize: size.width * 0.04,
                    ),
                    bottomChild: TicketBottom(
                      textLinesWithTitle: const [
                        {'title': '人数', 'text': '2人'},
                        {'title': 'ルーム番号', 'text': '404'},
                        {'title': 'testData', 'text': 'example'},
                        {'title': 'testData', 'text': 'example'},
                        {'title': '発行日時', 'text': 'yyyy-mm-dd'},
                        {'title': '有効期限', 'text': 'yyyy-mm-dd'},
                      ],
                      textSize: size.width * 0.03,
                    ),
                  ),

                ),
              ),


              const SizedBox(height: 24),

              //ボタン
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LightButton(
                    onPressed: () {
                      //::TODO 顔認証処理 仮実装
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CameraPage()),
                      );
                    },
                    icon: Icons.face,
                    label: '顔認証の登録',
                    gradientColors: [
                      Colors.indigoAccent,
                      Colors.indigoAccent.shade700,
                    ],
                    width: size.width * 0.425,
                  ),
                  const SizedBox(width: 20),
                  LightButton(
                    onPressed: () {
                      //::TODO NFC登録処理
                    },
                    icon: Icons.nfc,
                    label: 'NFCの登録',
                    gradientColors: [
                      Colors.teal,
                      Colors.teal.shade700,
                    ],
                    width: size.width * 0.425,
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
