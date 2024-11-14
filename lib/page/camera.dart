import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: CameraView(),
    );
  }
}

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  CameraViewState createState() => CameraViewState();
}

class CameraViewState extends State<CameraView> {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      cameraController = CameraController(
        cameras![0],
        ResolutionPreset.high,
      );
      await cameraController!.initialize();
      setState(() {
        isCameraInitialized = true;
      });
    }
  }

  Future<void> takePicture() async {
    if (!cameraController!.value.isInitialized) return;
    try {
      final image = await cameraController!.takePicture();
      if (kDebugMode) {
        print('画像保存: ${image.path}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('写真撮影エラー: $e');
      }
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    final size = MediaQuery.of(context).size;
    final aspectRatio = cameraController!.value.aspectRatio;

    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: CameraPreview(cameraController!),
          ),
        ),
        Positioned(
          bottom: 30,
          left: size.width / 2 - 30,
          child: FloatingActionButton(
            onPressed: takePicture,
            child: const Icon(Icons.camera_alt),
          ),
        ),
      ],
    );
  }
}
